import ROOT
import tensorflow.keras as keras
import os
from rich.console import Console
import numpy as np
import json
from pathlib import Path
import matplotlib.pyplot as plt
from rich.table import Table

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

def make_df(path, list_of_trees):
    chains = list_of_trees

    chains = [
        ROOT.TChain(tree) for tree in chains
    ]
    
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

def main():
    recent_run_path = '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/'

    console.log('Making dataframes')
    signal_df, signal_chains = make_df(
        recent_run_path,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits',
            'npvNtuplizer/NPVTree',
        ],
    )

    #debug
    signal_df = signal_df.Range(16000000)
    #signal_df = signal_df.Range(50000)
    
    nEvents = signal_df.Count()
    console.log(f'nEvents: {nEvents.GetValue()}')

    cmssw_base = os.getenv('CMSSW_BASE')
    with open(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_combined_trigger_list.json') as the_file:
        unprescaled_trigger_list = json.load(the_file)
    signal_df = make_pure_event_variable_from_list(signal_df, unprescaled_trigger_list)

    console.log("Making Inputs")
    inputs, purity, npv = get_inputs(signal_df)

    console.log('Making model predictions')
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    new_model = keras.models.load_model(model_path)

    model_predictions = new_model.predict(inputs).reshape((-1,))

    console.log("Getting initial rate estimates")
    prediction_histo, bin_edges = np.histogram(model_predictions, bins=256, range=(0.0, 256.0))

    overall_density = prediction_histo/np.sum(prediction_histo)
    overall_cdf = 1.0 - np.cumsum(overall_density)
    overall_rates = convert_eff_to_rate(overall_cdf)

    pure_predictions = model_predictions[purity==1]
    pure_npv = npv[purity==1]

    pure_prediction_histo, pure_bin_edges=np.histogram(pure_predictions, bins=256, range=(0.0, 256.0))

    pure_density = pure_prediction_histo/np.sum(prediction_histo)
    pure_cdf = np.sum(pure_density) - np.cumsum(pure_density) #flip the sum
    pure_rates = convert_eff_to_rate(pure_cdf)

    console.print(pure_rates)
    console.print(bin_edges)
    console.print(pure_rates.shape)
    console.print(bin_edges.shape)

    thresholds = bin_edges[:-1]
    
    
    #transform that into a rate plot
    #Then figure out what rate our threshold corresponds to
    #Then add that NPV bin and set of rates to a plot
    

    #Okay, for each pure rate threshold we want
    info_table = Table(title='Rate Table')
    info_table.add_column('Threshold')
    info_table.add_column('Overall Rate (kHz)')
    info_table.add_column('Pure Rate (kHz)')
    desired_rates = [
        0.035,
        0.075,
        0.150,
        0.250,
        0.300,
    ]

    npv_bin_width = 5
    npv_bins = list(range(20,70, npv_bin_width))
    console.log('Desired Rates vs PU')
    plt.figure()
    for desired_rate in desired_rates:
        console.log(f'\tRate:{desired_rate}')
        #Find the pure rate threshold that matches it
        threshold, true_rate = get_threshold_for_rate(
            pure_rates,
            thresholds,
            desired_rate
        )
        console.print(threshold)
        console.print(true_rate)

        true_overall_rate = overall_rates[int(threshold)] #this works because at the moment threshold matches index. If we bin differently we would have to search!

        x_npv = []
        y_rate = []
        
        #Then for each npv bin, make a pure score plot,
        for npv_bin in npv_bins:
            console.log(f'\t\tNPV bin: NPV > {npv_bin}')
            npv_bin_predictions = model_predictions[(npv >= npv_bin) & (npv < (npv_bin+npv_bin_width))]
            npv_bin_score_plot, _ = np.histogram(npv_bin_predictions, bins=256, range=(0.0, 256.0))
            npv_bin_density = npv_bin_score_plot/np.sum(npv_bin_predictions)
            npv_bin_cdf = np.sum(npv_bin_density)-np.cumsum(npv_bin_density) # flip the sum
            npv_bin_rates = convert_eff_to_rate(npv_bin_cdf)
            
            npv_bin_rate = npv_bin_rates[int(threshold)] #this works because at the moment threshold matches index. If we bin differently we would have to search!

            x_npv.append(npv_bin)
            y_rate.append(npv_bin_rate)

        plt.plot(
            x_npv,
            y_rate,
            label=f'Pure {int(desired_rate*1000.0)} Hz Threshold',
            linestyle='-'
        )

        info_table.add_row(
            f'{threshold:.2f}',
            f'{true_overall_rate:0.2f}',
            f'{true_rate:0.2f}',
        )

    pltvline(3.0, color='grey', linestyle='--', label='3 kHz Overall')
    plt.xlabel('NPV')
    plt.ylabel('Overall Rate (kHz)')
    plt.title('')
    plt.legend(loc='upper left')
    plt.savefig('pure_rates_vs_pu.png')
    plt.close()

    console.print(info_table)

if __name__ == '__main__':
    main()
