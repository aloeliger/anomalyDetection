import ROOT
import os
from rich.console import Console
import numpy as np
import json
from pathlib import Path
from rich.table import Table
import tensorflow.keras as keras
import h5py

console = Console()

def convert_eff_to_rate(eff, n_bunches=2544):
    return eff * (float(n_bunches) * 11425e-3) #11425e-3 is the kHz orbit frequency

def convert_rate_to_eff(rate, n_bunches=2544):
    return rate / (float(n_bunches) * 11425e-3)


def get_inputs(the_df):
    # inputs = the_df.AsNumpy(['modelInput', 'iEta', 'iPhi', 'pure_event', 'npv'])
    inputs = the_df.AsNumpy(['modelInput', 'iEta', 'iPhi', 'pure_event'])

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
    
    return reshapedModelInput, inputs['pure_event']#, inputs['npv']

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

def make_rate_table(
        inputs,
        purity,
        npv,
        desired_rates,
        npv_value
):
    console.log('Making inputs')
    #inputs, purity, npv = get_inputs(df)

    console.log('Making model predictions')
    cmssw_base = os.getenv('CMSSW_BASE')
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    new_model = keras.models.load_model(model_path)
    
    model_predictions = new_model.predict(inputs).reshape((-1,))

    console.log('Making overall rate estimates')

    prediction_histo, bin_edges = np.histogram(model_predictions, bins=256, range=(0.0, 256.0))

    overall_density = prediction_histo/np.sum(prediction_histo)
    overall_cdf = 1.0 - np.cumsum(overall_density)
    overall_rates = convert_eff_to_rate(overall_cdf)

    pure_predictions = model_predictions[purity==1]

    pure_prediction_histo, pure_bin_edges=np.histogram(pure_predictions, bins=256, range=(0.0, 256.0))

    pure_density = pure_prediction_histo/np.sum(prediction_histo)
    pure_cdf = np.sum(pure_density) - np.cumsum(pure_density) #flip the sum
    pure_rates = convert_eff_to_rate(pure_cdf)

    thresholds = bin_edges[:-1]

    info_table = Table(title=f'NPV={npv_value}')
    info_table.add_column('Threshold')
    info_table.add_column('Overall Rate (kHz)')
    info_table.add_column('Pure Rate (kHz)')
    for desired_rate in desired_rates:
        threshold, true_rate = get_threshold_for_rate(
            pure_rates,
            thresholds,
            desired_rate,
        )

        true_overall_rate = overall_rates[int(threshold)]

        info_table.add_row(
            f'{threshold}',
            f'{true_overall_rate:.2f}',
            f'{true_rate:.2f}',
        )
    console.print(info_table)

def main():
    #Okay. This isn't going to work, so we need to try Lino's PU enhanced trick
    # all_data = [
    #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
    #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
    #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
    #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
    #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
    #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
    # ]

    # console.log('Making DF')
    # df, chains = make_df(
    #     all_data,
    #     [
    #         'l1EventTree/L1EventTree',
    #         'CICADAInputNtuplizer/CICADAInputTree',
    #         'L1TTriggerBitsNtuplizer/L1TTriggerBits',
    #         'npvNtuplizer/NPVTree',
    #     ],
    # )

    # #debug
    # #df = df.Range(50000)

    # nEvents = df.Count()
    # console.log(f'nEvents: {nEvents.GetValue()}')

    # cmssw_base = os.getenv('CMSSW_BASE')
    # with open(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_combined_trigger_list.json') as the_file:
    #     unprescaled_trigger_list = json.load(the_file)
    # df = make_pure_event_variable_from_list(df, unprescaled_trigger_list)

    background_path = '/hdfs/store/user/ligerlac/CICAD2025Training/ZB-2024-sampled-like-mc.h5' #lino's MC like data sample
    with h5py.File(background_path) as the_file:
        inputs = np.array(the_file['CaloRegions']).reshape((-1,252))
        purity = np.array(the_file['is_pure'])
        npv = np.array(the_file['nPV'])
    
    npv_rate_values = [
        60,
        64,
        68,
    ]
    window_size = 2

    desired_rates = [
        0.035,
        0.075,
        0.150,
        0.250,
        0.300,
    ]

    for npv_rate_value in npv_rate_values:
        console.log()
        console.log(f'Making rate table for NPV: {npv_rate_value}')
        console.log()
        
        #npv_df = df.Filter(f'npv == {npv_rate_value}')
        #filter_str = f'(npv >= {npv_rate_value - window_size}) && (npv <= {npv_rate_value + window_size})'
        #npv_df = df.Filter(filter_str)
        #npv_event_count = npv_df.Count()
        #console.log(f'nEvents: {npv_event_count.GetValue()}')
        # console.log('Filter:')
        # console.log(filter_str)
        npv_mask = (npv >= (npv_rate_value - window_size)) & (npv <= (npv_rate_value + window_size))
        npv_inputs = inputs[npv_mask]
        npv_purity = purity[npv_mask]
        true_npvs = npv[npv_mask]

        console.print(f'True NPV mean: {np.mean(true_npvs)}')
        console.print(f'nEvents: {len(true_npvs)}')
        
        make_rate_table(
            npv_inputs,
            npv_purity,
            npv,
            desired_rates,
            npv_rate_value,
        )

if __name__ == '__main__':
    main()
