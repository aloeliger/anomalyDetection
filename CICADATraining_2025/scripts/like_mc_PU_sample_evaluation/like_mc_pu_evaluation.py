import ROOT
import tensorflow.keras as keras
import os
from rich.console import Console
import numpy as np
import h5py
import matplotlib.pyplot as plt
import json

console = Console()

def make_dfs(list_of_paths, list_of_trees):
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

def get_inputs(the_df):
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
    
    return reshapedModelInput, inputs['pure_event']

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

def make_comparison_plot(
        zb_inputs,
        mclike_inputs,
        xaxis_name='CICADA Input (GeV)',
        output_name='comparison.png',
        nbins=20,
        axis_range=(0,20),
):

    fig, axes = plt.subplots(
        2,
        1,
        sharex=True,
        height_ratios=[2,1],
    )
    
    zb_hist, bins, _ = axes[0].hist(
        zb_inputs,
        density=True,
        bins=nbins,
        range=axis_range,
        histtype='stepfilled',
        alpha=0.3,
        label='Zero Bias NPV 55-65'
    )
    mclike_hist, _, _ = axes[0].hist(
        mclike_inputs,
        density=True,
        bins=nbins,
        range=axis_range,
        histtype='stepfilled',
        alpha=0.3,
        label='MC-Like Sample',
    )

    #print(zb_hist)
    #print()
    #print(mclike_hist)
    ratio = np.where(np.array(zb_hist) != 0.0, np.array(mclike_hist) / np.array(zb_hist), 0)

    axes[1].plot(
        bins[:-1],
        ratio,
        marker='o',
        color='black',
        label='MC-like / Zero Bias'
    )
    axes[1].axhline(1, color='grey', linestyle='--')

    axes[0].set_ylabel('A.U.')
    #axes[0].set_xlabel('CICADA Input (GeV)')
    axes[0].legend()

    axes[1].set_ylabel('Ratio')
    axes[1].set_xlabel(xaxis_name)

    axes[0].tick_params(axis='x', which='both', bottom=False, labelbottom=False)
    plt.savefig(output_name)
    plt.close()

def main():
    #Start by making the df for zero bias, and
    #Getting inputs prepared.
    console.log('Making Zero Bias Dataframe')
    all_data = [
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
    ]

    zb_df, zb_chains = make_dfs(
        all_data,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits',
            'npvNtuplizer/NPVTree',
        ],
    )

    console.log('Making Purity')
    cmssw_base = os.getenv('CMSSW_BASE')
    with open(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_combined_trigger_list.json') as the_file:
        unprescaled_trigger_list = json.load(the_file)
    zb_df = make_pure_event_variable_from_list(
        zb_df,
        unprescaled_trigger_list,
    )

    #zb_df = zb_df.Filter('npv >= 55 && npv <= 65')
    zb_df = zb_df.Filter('npv == 64')

    #debug
    zb_df = zb_df.Range(100000)
    true_count = zb_df.Count()

    console.log('Making inputs')
    zb_inputs, zb_purity = get_inputs(zb_df)
    zb_inputs = zb_inputs.reshape((-1,252))

    console.log('Getting the MC-like sample')
    mclike_path = '/hdfs/store/user/ligerlac/CICAD2025Training/ZB-2024-sampled-like-mc.h5'
    with h5py.File(mclike_path) as the_file:
        #mclike_inputs = np.array(the_file['CaloRegions']).reshape((-1,252))
        #mclike_purity = np.array(the_file['is_pure'])
        #Debug
        mclike_inputs = np.array(the_file['CaloRegions']).reshape((-1,252))[:100000]
        mclike_purity = np.array(the_file['is_pure'])[:100000]

        
    make_comparison_plot(
        zb_inputs.reshape((-1,)),
        mclike_inputs.reshape((-1,))
    )

    make_comparison_plot(
        np.mean(zb_inputs, axis=1),
        np.mean(mclike_inputs, axis=1),
        xaxis_name = 'CICADA Average Input (GeV)',
        output_name = 'average_comparison.png',
        nbins=8,
        axis_range=(0,8)
    )
    console.log('Done!')
    console.log(f'Final Event Count: {true_count.GetValue()}')
    
if __name__ == '__main__':
    main()
