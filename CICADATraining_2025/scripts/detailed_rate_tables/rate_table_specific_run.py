from detailed_rate_table_calculator import *
import ROOT
from rich.console import Console
from rich.table import Table
from rich.progress import track, Progress
import numpy as np
import json
from pathlib import Path
import tensorflow.keras as keras
import matplotlib.pyplot as plt
import math
import argparse

console = Console()

def calculate_threshold_for_desired_rate(
        percentile,
        pure_scores,
):
    thresholds = []
    sample_size = 2000
    for sample_index in track(range(sample_size), description='[green]Resampling for bootstrap uncertainty[/green]'):
        sample = np.random.choice(
            pure_scores,
            size=len(pure_scores),
            replace=True,
        )

        threshold = np.percentile(
            sample,
            percentile
        )

        thresholds.append(threshold)
    return np.mean(thresholds), np.std(thresholds)

def calculate_rates_for_threshold(
        threshold,
        pure_score_samples,
        overall_score_samples,
):
    pure_rates = []
    overall_rates = []
    for sample_index in range(len(pure_score_samples)):
        pure_sample = pure_score_samples[sample_index]
        sample = overall_score_samples[sample_index]
        pure_rates.append(
            convert_eff_to_rate(
                np.sum(pure_sample > threshold)/len(pure_sample)
            )
        )
        overall_rates.append(
            convert_eff_to_rate(
                np.sum(sample > threshold)/len(sample)
            )
        )
    return np.mean(pure_rates), np.std(pure_rates), np.mean(overall_rates), np.std(overall_rates)

def round_to_power_of_two(number, power=8):
    shifted_number = number * (2**power)
    rounded_number = round(shifted_number)
    return rounded_number / (2**power)

def make_npv_plot(npvs, output_path):
    plt.hist(
        npvs,
        bins=50,
        histtype='stepfilled',
        label='Selected Zero Bias Runs',
        density=True
    )

    plt.legend(loc='upper right')
    plt.xlabel('NPVs')
    plt.ylabel('A.U.')
    plt.title('NPV For Selected Runs')
    plt.savefig(f'{output_path}')
    plt.close()


def make_score_plot(scores, output_path):
    plt.hist(
        scores,
        bins=75,
        range=(0.0, 150.0),
    )
    plt.xlabel('CICADA Score')
    plt.ylabel('A.U.')
    plt.yscale('log')
    plt.title('CICADA Scores'),
    plt.savefig(f'{output_path}')
    plt.close()
    
def main(args):
    console.log('[green]Start[/green]')
    all_data = [
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_28Feb2025/',
    ]

    console.log('Making DF')
    df, chains = make_df(
        all_data,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits',
            'npvNtuplizer/NPVTree',
        ],
    )

    #debug
    #df = df.Range(50000)

    cmssw_base = os.getenv('CMSSW_BASE')
    with open(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_combined_trigger_list.json') as the_file:
        unprescaled_trigger_list = json.load(the_file)
    df = make_pure_event_variable_from_list(df, unprescaled_trigger_list)

    # console.log('Available runs')
    # available_runs = df.AsNumpy(['run'])['run']
    # unique_runs = np.unique(available_runs)
    # console.log(unique_runs)

    #[386478 386509 386554 386594 386604 386618 386640 386661 386668 386673 386679]

    #Rate spike starts at Run 386673
    #possible sections Run 386478: Lumi 140-400
    # Run 386509: Lumi 1-1000
    # Run 386554: Lumi 1-420
    # Run 386594: Lumi 1-100
    # Run 386604: Lumi 100-1250
    # Run 386618: Lumi 1-200
    # Run 386661: Lumi 100-450
    # Run 386668: Lumi 100-350
    #Rate spike runs
    # Run 386673: Lumi 1-950
    # Run 386679: Lumi 75-375

    #After Rate Spike Runs
    # Run 386951: Lumi 100-700
    # Run 386945: Lumi 100-800

    lumi_level_df = df.Filter("""
(run == 386594 && lumi >= 1 && lumi <= 100) ||
(run == 386604 && lumi >= 100 && lumi <= 1250) ||
(run == 386618 && lumi >= 1 && lumi <= 200) ||
(run == 386661 && lumi >= 100 && lumi <= 450) ||
(run == 386668 && lumi >= 100 && lumi <= 350) ||
(run == 386945 && lumi >= 100 && lumi <= 800) ||
(run == 386951 && lumi >= 100 && lumi <= 700)
"""
    )
    # lumi_level_df = df.Filter("""
# (run == 386673 && lumi >= 1 && lumi <= 950) ||
# (run == 386679 && lumi >= 75 && lumi <= 375)
# """
#     )
    # lumi_level_df = df.Filter("""
# (run == 386509 && lumi >= 1 && lumi <= 1000) ||
# (run == 386554 && lumi >= 1 && lumi <= 420)
# """
#     )

    #debug
    # lumi_level_df = lumi_level_df.Range(50000)

    nEvents = df.Count()
    
    counts = lumi_level_df.Count()

    pure_counts = lumi_level_df.Filter('pure_event==1').Count()
    console.log(f'nEvents: {nEvents.GetValue()}')
    console.log(f'nEvents in the window: {counts.GetValue()}')
    console.log(f'Total pure events: {pure_counts.GetValue()}')

    inputs, pure, npvs = get_inputs(lumi_level_df)

    pure_counts = np.sum(pure)

    console.log('Getting model and making predictions')
    cmssw_base = os.getenv('CMSSW_BASE')
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    new_model = keras.models.load_model(model_path)
    
    model_predictions = new_model.predict(inputs).reshape((-1,))
    pure_predictions = model_predictions[pure==1]
    
    console.log('Making output path')
    output_path = Path(f'{args.output_dir}')
    output_path.mkdir(exist_ok=True, parents=True)

    console.log('Making some validation plots')
    make_npv_plot(
        npvs,
        output_path=output_path/'npv_plot.png'
    )
    make_score_plot(
        model_predictions,
        output_path=output_path/'scores.png'
    )
    
    console.log('Defining rates and threhsolds of interest')
    rates_of_interest = np.array([
        0.035,
        0.075,
        0.150,
        0.250,
        0.300,
    ])

    effs_of_interest = convert_rate_to_eff(rates_of_interest)
    percentiles_of_interest = (1.0 - effs_of_interest) * 100.0

    console.log('Making projections on the rates of interest')

    info_table = Table(title='Rates')
    info_table.add_column('Pure Rate (kHz)')
    info_table.add_column('Threshold')
    info_table.add_column('Theshold Uncertainty')
    info_table.add_column('Overall Rate (kHz)')
    info_table.add_column('Overall Rate Uncertainty')
    
    for index, percentile in enumerate(percentiles_of_interest):
        threshold, error = calculate_threshold_for_desired_rate(
            percentile,
            pure_predictions
        )
        threshold = round_to_power_of_two(threshold, power=3)
        error = round_to_power_of_two(error, power=3)

        total_rate = convert_eff_to_rate(
            np.sum(model_predictions > threshold) / len(model_predictions)
        )

        total_rate_up = convert_eff_to_rate(
            np.sum(model_predictions > (threshold-error)) / len(model_predictions)
        )

        total_rate_down = convert_eff_to_rate(
            np.sum(model_predictions > (threshold+error)) / len(model_predictions)
        )
        
        info_table.add_row(
            f'{rates_of_interest[index]:.3f}',
            f'{threshold:.3f}',
            f'{error:.3f}',
            f'{total_rate:.3f}',
            f'+{total_rate_up-total_rate:.3f}/-{total_rate-total_rate_down:.3f}'
        )
    console.print(info_table)

    console.log('Projecting rates for all thresholds')
    granularity = 2
    upper_range = granularity + 8 #i.e. we check decimals down to 2**-granularity
    #but our upper range will always be at 2**8 maximum
    pure_rates = {}
    pure_rate_uncertainties = {}
    rates = {}
    rate_uncertainties = {}
    sample_size = 2000
    pure_samples = np.random.choice(
        pure_predictions,
        size=(sample_size, len(pure_predictions)),
        replace=True,
    )
    overall_samples = np.random.choice(
        model_predictions,
        size=(sample_size, len(model_predictions)),
        replace=True,
    )
    
    for threshold_index in track(range(2**upper_range), description='[green][/green]'):
        threshold = threshold_index*(2**(-granularity))
        
        pure_rate, pure_rate_unc, rate, rate_unc = calculate_rates_for_threshold(
            threshold,
            pure_samples,
            overall_samples,
        )
        pure_rates[threshold]=pure_rate
        pure_rate_uncertainties[threshold]=pure_rate_unc
        rates[threshold] = rate
        rate_uncertainties[threshold] = rate_unc


    rate_table = Table(title='Thresholds vs Rates')
    rate_table.add_column('Threshold')
    rate_table.add_column('Pure Rates (kHz)')
    rate_table.add_column('Overall Rates (kHz)')
    for threshold in pure_rates:
        rate_table.add_row(
            f'{threshold:.3f}',
            f'{pure_rates[threshold]:.3f} +/- {pure_rate_uncertainties[threshold]:.3f}',
            f'{rates[threshold]:.3f} +/- {rate_uncertainties[threshold]:.3f}',
        )
    console.print(rate_table)

    console.log('Dumping to JSON')
    final_dict = {
        'pure': {
            'central_value': pure_rates,
            'uncertainty': pure_rate_uncertainties,
        },
        'overall':{
            'central_value': rates,
            'uncertainty': rate_uncertainties,
        }
    }

    with open(f'{output_path}/rate_table.json', 'w') as the_file:
        json.dump(
            final_dict,
            the_file,
            indent=4,
        )
    console.log('[green]Done![/green]')
    
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Perform rate table calculations on defined runs')

    parser.add_argument(
        '--output_dir',
        default='Simple_Rate_Derivation',
        nargs='?',
        help='Directory to store results in',
    )

    args = parser.parse_args()
    
    main(args)
