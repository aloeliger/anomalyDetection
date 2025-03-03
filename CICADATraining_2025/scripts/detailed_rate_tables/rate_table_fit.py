import ROOT
import os
from rich.console import Console
import numpy as np
import json
from pathlib import Path
from rich.table import Table
from rich.progress import track
import tensorflow.keras as keras
import h5py
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import math

console = Console()

def convert_eff_to_rate(eff, n_bunches=2544):
    return eff * (float(n_bunches) * 11425e-3) #11425e-3 is the kHz orbit frequency

def convert_rate_to_eff(rate, n_bunches=2544):
    return rate / (float(n_bunches) * 11425e-3)


def get_inputs(the_df):
    inputs = the_df.AsNumpy(['modelInput', 'iEta', 'iPhi', 'pure_event', 'npv'])

    modelInput = list(inputs['modelInput'])
    modelInput = [ list(x) for x in modelInput]
    modelInput = np.array(modelInput)#.reshape((-1, 18, 14))

    iEta = list(inputs['iEta'])
    iEta = [ list(x) for x in iEta]
    iEta = np.array(iEta)
    
    iPhi = list(inputs['iPhi'])
    iPhi = [list(x) for x in iPhi]
    iPhi = np.array(iPhi)

    rows = np.arange(len(modelInput))[:, None]
    reshapedModelInput = np.zeros((len(modelInput), 18, 14))
    reshapedModelInput[rows, iPhi, iEta] = modelInput

    reshapedModelInput = reshapedModelInput.reshape((-1, 252))
    
    return reshapedModelInput, inputs['pure_event'], inputs['npv']

def make_pure_event_filter_string(list_of_triggers):
    filter_string = ''
    for trigger in list_of_triggers:
        filter_string += f'{trigger} == 0 && '
    filter_string = filter_string[:-4]
    return filter_string

def make_pure_event_variable_from_list(the_df, list_of_triggers):
    the_df = the_df.Define(
        'pure_event',
        make_pure_event_filter_string(list_of_triggers)
    )
    return the_df

def make_df(list_of_paths, list_of_trees):
    chains = list_of_trees

    chains = [
        ROOT.TChain(tree) for tree in chains
    ]

    for path in list_of_paths:
        for root, dirs, files in os.walk(path):
            for file_name in files:
                file_path = f'{root}/{file_name}'
                for chain in chains:
                    chain.Add(file_path)
    primary_chain = chains[0]
    remainder = chains[1:]
    for chain in remainder:
        primary_chain.AddFriend(chain)
    dataframe = ROOT.RDataFrame(primary_chain)
    return dataframe, primary_chain

def get_threshold_for_rate(
        rates,
        threshold,
        desired_rate,
):
    low_bin = 0
    high_bin = len(rates)-1
    search_bin = (low_bin+high_bin)//2
    prev_search_bin = None

    while(search_bin != prev_search_bin):
        search_rate = rates[search_bin]
        search_threshold = threshold[search_bin]
        if search_rate > desired_rate: #rate too high, searching too low
            low_bin = search_bin
        else:
            high_bin = search_bin
        prev_search_bin = search_bin
        search_bin = (low_bin+high_bin) // 2
    return search_threshold, search_rate

def make_prediction_histograms(predictions, pure_predictions, npv):
    plt.hist(
        predictions,
        bins=75,
        range=(0.0, 150.0),
        label='All Events',
        alpha=0.4,
    )
    plt.hist(
        pure_predictions,
        bins=75,
        range=(0.0, 150.0),
        label='Pure Events',
        alpha=0.4,
    )

    plt.legend(loc='upper left')
    plt.xlabel('CICADA Score')
    plt.ylabel('Events')
    plt.title(f'Score Distribution, NPV = {npv}')
    plt.savefig(f'./score_distribution_npv_{npv}.png')
    plt.close()

def threshold_calculation(df, desired_rates, npv_target):
    console.log('Making inputs')

    inputs, purity, npv = get_inputs(df)
    cmssw_base = os.getenv('CMSSW_BASE')
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    model = keras.models.load_model(model_path)

    model_predictions = model.predict(inputs).reshape((-1,))

    console.log('Making overall rate estimates')

    prediction_histo, bin_edges = np.histogram(model_predictions, bins=512, range=(0.0, 256.0))

    overall_density = prediction_histo/np.sum(prediction_histo)
    overall_cdf = 1.0 - np.cumsum(overall_density)
    overall_rates = convert_eff_to_rate(overall_cdf)

    pure_predictions = model_predictions[purity==1]

    #Just log the distribution we're working with
    make_prediction_histograms(model_predictions, pure_predictions, npv_target)

    pure_prediction_histo, pure_bin_edges=np.histogram(pure_predictions, bins=512, range=(0.0, 256.0))

    pure_density = pure_prediction_histo/np.sum(prediction_histo)
    pure_cdf = np.sum(pure_density) - np.cumsum(pure_density) #flip the sum
    pure_rates = convert_eff_to_rate(pure_cdf)

    thresholds = bin_edges[:-1]

    #info_table = Table(title=f'NPV={npv_value}')
    #info_table.add_column('Threshold')
    #info_table.add_column('Overall Rate (kHz)')
    #info_table.add_column('Pure Rate (kHz)')

    threshold_mean_dict = {}
    threshold_std_dict = {}
    rate_mean_dict = {}
    rate_std_dict = {}
    overall_rate_mean_dict = {}
    overall_rate_std_dict = {}
    sample_size = 5000

    desired_percentiles = convert_rate_to_eff(np.array(desired_rates))
    
    for index, desired_percentile in enumerate(desired_percentiles):
        calculated_thresholds = []
        calculated_rates = []
        calculated_overall_rates = []
        for sample_index in track(range(sample_size), description='Resampling to estimate error'):
            #sample = np.random.choice(pure_rates, size=len(pure_rates), replace=True)
            # threshold, true_rate = get_threshold_for_rate(
            #     sample,
            #     thresholds,
            #     desired_rate,
            # )
            #instead of binary searching for this, let's let numpy
            #do the heavy lifting
            threshold = np.percentile(
                pure_predictions,
                (1.0-desired_percentile)*100.0,
            )
            
            calculated_thresholds.append(threshold)
            calculated_rates.append(
                convert_eff_to_rate(
                    np.sum(pure_predictions > threshold) / len(pure_predictions)
                )
            )
            calculated_overall_rates.append(
                convert_eff_to_rate(
                    np.sum(model_predictions > threshold) / len(model_predictions)
                )
            )
            #calculated_overall_rates.append(overall_rates[int(threshold)]) #this only works because we have line dup the bins! the binning changes this needs to change too
        #estimate central values and uncertainties
        threshold_mean_dict[desired_rates[index]] = np.mean(calculated_thresholds)
        threshold_std_dict[desired_rates[index]] = np.std(calculated_thresholds)
        rate_mean_dict[desired_rates[index]] = np.mean(calculated_rates)
        rate_std_dict[desired_rates[index]] = np.std(calculated_rates)
        overall_rate_mean_dict[desired_rates[index]] = np.mean(calculated_overall_rates)
        overall_rate_std_dict[desired_rates[index]] = np.std(calculated_overall_rates)
        
    return threshold_mean_dict, threshold_std_dict, rate_mean_dict, rate_std_dict, overall_rate_mean_dict, overall_rate_std_dict

def exp_func(x, a, b):
    return a * np.exp(b * x)

def fit_and_plot(npvs, thresholds, errors):
    for desired_rate in thresholds:
        console.log(f'Desired rate: {desired_rate}')
        
        #quadratic fit
        quad_coeffs, quad_covar = np.polyfit(npvs[desired_rate], thresholds[desired_rate], 2, w=1/(np.array(errors[desired_rate])+1e-8), cov=True)
        quad_func = np.poly1d(quad_coeffs)

        quad_x_values = np.linspace(min(npvs[desired_rate]), 70, 1000)
        quad_y_values = quad_func(quad_x_values)

        linear_coeffs, linear_covar = np.polyfit(npvs[desired_rate], thresholds[desired_rate], 1, w=1/(np.array(errors[desired_rate])+1e-8), cov=True)
        linear_func = np.poly1d(linear_coeffs)
        linear_x_values = np.linspace(min(npvs[desired_rate]), 70, 1000)
        linear_y_values = linear_func(linear_x_values)

        linear_slope, linear_intercept = linear_coeffs
        linear_slope_error, linear_intercept_error = np.sqrt(np.diag(linear_covar))
        
        #exponential fit
        params, covariance = curve_fit(exp_func, npvs[desired_rate], thresholds[desired_rate], p0=(1,0.5))
        exp_x_values = np.linspace(min(npvs[desired_rate]), 70, 1000)
        exp_y_values = exp_func(exp_x_values, *params)
        
        # plt.scatter(
        #     npvs[desired_rate],
        #     thresholds[desired_rate],
        #     label = 'Measured from Zero Bias',
        #     color = 'red',
        # )
        plt.errorbar(
            npvs[desired_rate],
            thresholds[desired_rate],
            yerr=errors[desired_rate],
            label='Measured from Zero Bias',
            color='red'
        )
        plt.plot(
            quad_x_values,
            quad_y_values,
            label = 'Quadratic Fit',
            color = '#87CEEB',
        )
        plt.plot(
            exp_x_values,
            exp_y_values,
            label='Exponential fit',
            color='orange'
        )
        plt.plot(
            linear_x_values,
            linear_y_values,
            label='Linear Fit',
            color='green'
        )
        plt.legend()
        plt.xlabel('NPV')
        plt.ylabel('Threshold')
        hz_value = int(1000*desired_rate)
        plt.title(f'Pure Rate Fit: {hz_value} Hz')
        plt.savefig(f'./pure_rate_fit_{hz_value}_hz.png')
        plt.close()

        extrapolation_npvs = [
            60,
            64,
            68,
        ]

        info_table = Table(title=f'Rate Fit: {hz_value} Hz')
        info_table.add_column('NPV')
        info_table.add_column('Threshold Linear Fit')
        info_table.add_column('Threhsold Quadratic Fit')
        info_table.add_column('Threshold Exponential Fit')
        for extrapolation_npv in extrapolation_npvs:
            quad_threshold = quad_func(extrapolation_npv)
            exp_threshold = exp_func(extrapolation_npv, *params)
            linear_threshold = linear_func(extrapolation_npv)
            linear_threshold_up = (linear_slope+linear_slope_error)*extrapolation_npv + (linear_intercept+linear_intercept_error)
            linear_threshold_down = (linear_slope-linear_slope_error)*extrapolation_npv + (linear_intercept-linear_intercept_error)

            info_table.add_row(
                f'{extrapolation_npv}',
                f'{linear_threshold:.3f} ~ {math.ceil(linear_threshold)}, Up: {linear_threshold_up:.3f}, Down: {linear_threshold_down:.3f}',
                f'{quad_threshold:.3f} ~ {math.ceil(quad_threshold)}',
                f'{exp_threshold:.3f} ~ {math.ceil(exp_threshold)}',
            )
        console.print(info_table)
        console.print()

def overall_rates_fit_and_plots(
        npvs,
        overall_rates,
        errors,
):
    for desired_rate in overall_rates:
        console.log(f'Desired rate: {desired_rate}')

        #quadratic fit
        quad_coeffs, quad_covar = np.polyfit(npvs[desired_rate], overall_rates[desired_rate], 2, w=1/(np.array(errors[desired_rate])+1e-8), cov=True)
        quad_func = np.poly1d(quad_coeffs)

        quad_x_values = np.linspace(min(npvs[desired_rate]), 70, 1000)
        quad_y_values = quad_func(quad_x_values)

        linear_coeffs, linear_covar = np.polyfit(npvs[desired_rate], overall_rates[desired_rate], 1, w=1/(np.array(errors[desired_rate])+1e-8), cov=True)
        linear_func = np.poly1d(linear_coeffs)
        linear_x_values = np.linspace(min(npvs[desired_rate]), 70, 1000)
        linear_y_values = linear_func(linear_x_values)

        linear_slope, linear_intercept = linear_coeffs
        linear_slope_error, linear_intercept_error = np.sqrt(np.diag(linear_covar))
        
        #exponential fit
        params, covariance = curve_fit(exp_func, npvs[desired_rate], overall_rates[desired_rate], p0=(1,0.5))
        exp_x_values = np.linspace(min(npvs[desired_rate]), 70, 1000)
        exp_y_values = exp_func(exp_x_values, *params)
        
        # plt.scatter(
        #     npvs[desired_rate],
        #     overall_rates[desired_rate],
        #     label = 'Measured from Zero Bias',
        #     color = 'red',
        # )
        plt.errorbar(
            npvs[desired_rate],
            overall_rates[desired_rate],
            yerr=errors[desired_rate],
            label='Measured from Zero Bias',
            color='red'
        )
        plt.plot(
            quad_x_values,
            quad_y_values,
            label = 'Quadratic Fit',
            color = '#87CEEB',
        )
        plt.plot(
            exp_x_values,
            exp_y_values,
            label='Exponential fit',
            color='orange'
        )
        plt.plot(
            linear_x_values,
            linear_y_values,
            label='Linear Fit',
            color='green'
        )
        plt.legend()
        plt.xlabel('NPV')
        plt.ylabel('Overall Rate (kHz)')
        hz_value = int(1000*desired_rate)
        plt.title(f'Overall Rate Fit: {hz_value} Hz')
        plt.savefig(f'./overall_rate_fit_{hz_value}_hz.png')
        plt.close()

        extrapolation_npvs = [
            60,
            64,
            68,
        ]

        info_table = Table(title=f'Rate Fit: {hz_value} Hz')
        info_table.add_column('NPV')
        info_table.add_column('Overall Rate Linear Fit')
        info_table.add_column('Overall Rate Quadratic Fit')
        info_table.add_column('Overall Rate Exponential Fit')
        for extrapolation_npv in extrapolation_npvs:
            quad_rate = quad_func(extrapolation_npv)
            exp_rate = exp_func(extrapolation_npv, *params)
            linear_rate = linear_func(extrapolation_npv)

            info_table.add_row(
                f'{extrapolation_npv}',
                f'{linear_rate:.3f} ~ {math.ceil(linear_rate)}',
                f'{quad_rate:.3f} ~ {math.ceil(quad_rate)}',
                f'{exp_rate:.3f} ~ {math.ceil(exp_rate)}',
            )
        console.print(info_table)
        console.print()
        
def main():
    all_data = [
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
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

    nEvents = df.Count()
    console.log(f'nEvents: {nEvents.GetValue()}')

    cmssw_base = os.getenv('CMSSW_BASE')
    with open(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_combined_trigger_list.json') as the_file:
        unprescaled_trigger_list = json.load(the_file)
    df = make_pure_event_variable_from_list(df, unprescaled_trigger_list)

    npv_window_size = 2
    npv_targets = list(range(20,51,npv_window_size))

    desired_rates = [
        0.035,
        0.075,
        0.150,
        0.250,
        0.300,
    ]
    
    rate_npvs = {}
    rate_thresholds = {}
    rate_threshold_errs = {}
    rate_overall_rates = {}
    rate_overall_rate_errs = {}
    
    for desired_rate in desired_rates:
        rate_npvs[desired_rate] = []
        rate_thresholds[desired_rate] = []
        rate_threshold_errs[desired_rate] = []
        rate_overall_rates[desired_rate] = []
        rate_overall_rate_errs[desired_rate] = []

    npv_dfs = {}
    for npv_target in npv_targets:
        filter_str = f'npv == {npv_target}'
        npv_dfs[npv_target] = df.Filter(filter_str)
        
    for npv_target in npv_dfs:
        console.log(f'NPV: {npv_target}')
        
        #filter_str = f'npv == {npv_target}'
        #filter_str = f'npv >= {npv_target - npv_window_size} && npv <= {npv_target + npv_window_size}'
        #filter_str = f'npv == {npv_target}'
        npv_df_prelim = npv_dfs[npv_target]
        npv_event_count = npv_df_prelim.Count()
        #limit = 3000000
        #limit = 5000000
        #limit = 10000
        #npv_df = npv_df_prelim.Range(limit)
        npv_df = npv_df_prelim
        final_event_count = npv_df.Count()
        
        for desired_rate in desired_rates:
            rate_npvs[desired_rate].append(
                npv_target
            )
        npv_threshold_means, npv_threshold_errs, npv_true_rate_mean, npv_true_rate_std, npv_overall_rate_mean, npv_overall_rate_std = threshold_calculation(
            npv_df,
            desired_rates,
            npv_target
        )

        for desired_rate in desired_rates:
            console.log(f'Desired rate: {desired_rate}')
            rate_thresholds[desired_rate].append(
                npv_threshold_means[desired_rate]
            )
            rate_threshold_errs[desired_rate].append(
                npv_threshold_errs[desired_rate]
            )
            rate_overall_rates[desired_rate].append(
                npv_overall_rate_mean[desired_rate]
            )
            rate_overall_rate_errs[desired_rate].append(
                npv_overall_rate_std[desired_rate]
            )
        try:
            percent_utilization = final_event_count.GetValue() / npv_event_count.GetValue()
        except ZeroDivisionError:
            percent_utilization = 0.0
        console.log(f'Total events used at NPV: {final_event_count.GetValue()}')
        console.log(f'Percent of NPV used: {percent_utilization:.3%}')
        console.log()

    console.log('Making fits and plotting')
    fit_and_plot(
        rate_npvs,
        rate_thresholds,
        rate_threshold_errs,
    )

    console.log('Making overall rates fits and plots')
    overall_rates_fit_and_plots(
        rate_npvs,
        rate_overall_rates,
        rate_overall_rate_errs,
    )

if __name__ == '__main__':
    main()
