import ROOT
import os
from rich.console import Console
import numpy as np
import h5py
import tensorflow.keras as keras
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import json
import argparse

from pathlib import Path

console = Console()

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

def make_df(list_of_paths, list_of_trees, modulus_acceptance=None):
    chains = list_of_trees

    chains = [
        ROOT.TChain(tree) for tree in chains
    ]

    for path in list_of_paths:
        for root, dirs, files in os.walk(path):
            for index, file_name in enumerate(files):
                if modulus_acceptance is not None and index % modulus_acceptance != 0:
                    continue
                file_path = f'{root}/{file_name}'
                for chain in chains:
                    chain.Add(file_path)
    primary_chain = chains[0]
    remainder = chains[1:]
    for chain in remainder:
        primary_chain.AddFriend(chain)
    dataframe = ROOT.RDataFrame(primary_chain)
    return dataframe, primary_chain

def make_total_input_plot(zb_inputs, mc_inputs, output_path):
    for npv_value in zb_inputs:
        counts, bins = np.histogram(
            zb_inputs[npv_value].reshape((-1,)),
            bins=20,
            range=(0.0, 20.0)
        )
        bin_centers = (bins[:-1]+bins[1:]) / 2
        errors = np.sqrt(counts)

        plt.errorbar(
            bin_centers,
            counts/np.sum(counts),
            yerr=errors/np.sum(counts),
            fmt='o',
            # linewidth = 0.0,
            label=f'Zero Bias, NPV = {npv_value}'
        )
    counts, bins = np.histogram(
        mc_inputs.reshape((-1,)),
        bins=20,
        range=(0.0, 20.0)
    )
    bin_centers = (bins[:-1]+bins[1:]) / 2

    errors = np.sqrt(counts)

    plt.errorbar(
        bin_centers,
        counts/np.sum(counts),
        yerr=errors/np.sum(counts),
        fmt='o',
        # linewidth = 0.0,
        label=f'MC-like NPV Sample'
    )

    plt.legend()
    plt.yscale('log')
    plt.xlabel('CICADA Region ET')
    plt.ylabel('A.U.')
    plt.savefig(f'{output_path}/CICADA_Inputs_Plot.png')
    plt.close()

def make_average_input_plot(zb_inputs, mc_inputs, output_path):
    for npv_value in zb_inputs:
        averages = np.mean(zb_inputs[npv_value].reshape((-1, 252)), axis=1)

        counts, bins = np.histogram(
            averages,
            bins=10,
            range=(0.0, 10.0),
        )
        bin_centers = (bins[:-1]+bins[1:])/2
        errors = np.sqrt(counts)

        plt.errorbar(
            bin_centers,
            counts/np.sum(counts),
            yerr=errors/np.sum(counts),
            fmt='o',
            # linewidth = 0.0,
            label=f'Zero Bias, NPV = {npv_value}',
        )
    averages = np.mean(mc_inputs.reshape((-1, 252)), axis=1)
    counts, bins = np.histogram(
        averages,
        bins=10,
        range=(0.0, 10.0),
    )
    bin_centers = (bins[:-1] + bins[1:]) / 2
    errors = np.sqrt(counts)
    plt.errorbar(
        bin_centers,
        counts/np.sum(counts),
        yerr=errors/np.sum(counts),
        fmt='o',
        # linewidth = 0.0,
        label=f'MC-like NPV Sample',
    )

    plt.legend()
    plt.yscale('log')
    plt.xlabel('Average CICADA Region ET')
    plt.ylabel('A.U.')
    plt.savefig(f'{output_path}/CICADA_Average_Inputs_Plot.png')
    plt.close()

def make_nonzero_input_plot(zb_inputs, mc_inputs, output_path):
    for npv_value in zb_inputs:
        non_zero_inputs = np.sum(
            np.where(
                zb_inputs[npv_value].reshape((-1,252)) > 0,
                1.0,
                0.0
            ),
            axis=1
        )

        counts, bins = np.histogram(non_zero_inputs, bins=20, range=(0,252))
        bin_centers = (bins[:-1]+bins[1:]) / 2
        errors = np.sqrt(counts)
        plt.errorbar(
            bin_centers,
            counts/np.sum(counts),
            yerr=errors/np.sum(counts),
            fmt='o',
            # linewidth = 0.0,
            label=f'Zero Bias, NPV = {npv_value}'
        )
    non_zero_inputs = np.sum(
        np.where(
            mc_inputs.reshape((-1,252)) > 0,
            1.0,
            0.0
        ),
        axis=1
    )

    counts, bins = np.histogram(non_zero_inputs, bins=20, range=(0,252))
    bin_centers = (bins[:-1]+bins[1:]) / 2
    errors = np.sqrt(counts)
    plt.errorbar(
        bin_centers,
        counts/np.sum(counts),
        yerr=errors/np.sum(counts),
        fmt='o',
        # linewidth = 0.0,
        label=f'MC-like NPV Sample'
    )

    plt.legend()
    plt.yscale('log')
    plt.xlabel('Number of Non-Zero CICADA INputs')
    plt.ylabel('A.U.')
    plt.savefig(f'{output_path}/CICADA_NonZero_Inputs_Plot.png')
    plt.close()

def make_sum_input_plot(zb_inputs, mc_inputs, output_path):
    for npv_value in zb_inputs:
        sums = np.sum(
            zb_inputs[npv_value].reshape((-1,252)),
            axis=1,
        )
        counts, bins = np.histogram(sums, bins=20, range=(0, 2000))
        bin_centers = (bins[:-1]+bins[1:]) / 2
        errors = np.sqrt(counts)

        console.print(f'\tNPV-value: {npv_value}, Sum: {np.sum(counts/np.sum(counts))}')
        console.print(counts/np.sum(counts))
        console.print(np.cumsum(counts/np.sum(counts)))
        console.print("Errors")
        console.print(errors/np.sum(counts))
        
        plt.errorbar(
            bin_centers,
            counts/np.sum(counts),
            yerr=errors/np.sum(counts),
            fmt='o',
            # linewidth = 0.0,
            label=f'Zero Bias, NPV = {npv_value}',
        )
    sums = np.sum(
        mc_inputs.reshape((-1,252)),
        axis=1,
    )
    counts, bins = np.histogram(sums, bins=20, range=(0,2000))
    bin_centers = (bins[:-1]+bins[1:]) / 2
    errors = np.sqrt(counts)
    console.print(f'\tMC-like PU, Sum: {np.sum(counts/np.sum(counts))}')
    console.print(counts/np.sum(counts))
    console.print(np.cumsum(counts/np.sum(counts)))
    console.print("Errors")
    console.print(errors/np.sum(counts))
    
    plt.errorbar(
        bin_centers,
        counts/np.sum(counts),
        yerr=errors/np.sum(counts),
        fmt='o',
        # linewidth=0.0,
        label=f'MC-like PU sample',
    )

    plt.legend()
    plt.yscale('log')
    plt.xlabel('CICADA Input Sum')
    plt.ylabel('A.U.')
    plt.savefig(f'{output_path}/CICADA_Inputs_Sum_Plot.png')
    plt.close()

def make_score_plot(zb_scores, mc_scores, output_path):
    for npv_value in zb_scores:
        plt.hist(
            zb_scores[npv_value],
            bins=75,
            range=(0.0,150.0),
            histtype='step',
            density=True,
            label=f'Zero Bias, NPV = {npv_value}',
            alpha=0.4,
            linewidth=2.0,
        )
    plt.hist(
        mc_scores,
        bins=75,
        range=(0.0, 150.0),
        density=True,
        histtype='step',
        label='MC-like NPV Sample',
        alpha=0.4,
        linewidth=2.0,
    )

    plt.legend()
    plt.yscale('log')
    plt.xlabel('CICADA Model Score')
    plt.ylabel('A.U.')
    plt.savefig(f'{output_path}/CICADA_Score_plot.png')
    plt.close()

def make_score_vs_average_input_plot(
        npv_scores,
        npv_inputs,
        mc_scores,
        mc_inputs,
        output_path,
):
    fig = plt.figure(figsize=(8, 8))
    gs = gridspec.GridSpec(2, 2, width_ratios=[4, 1], height_ratios=[1, 4])

    ax_main = plt.subplot(gs[1, 0])
    ax_top = plt.subplot(gs[0, 0], sharex=ax_main)
    ax_right = plt.subplot(gs[1, 1], sharey=ax_main)
    
    for npv_value in npv_inputs:
        average_inputs = np.mean(npv_inputs[npv_value].reshape((-1, 252)), axis=1)

        ax_main.scatter(
            average_inputs,
            npv_scores[npv_value],
            alpha=0.3,
            label=f'ZB, NPV = {npv_value}'
        )

        ax_top.hist(
            average_inputs,
            bins=40,
            alpha=0.3,
            density=True,
        )
        ax_right.hist(
            npv_scores[npv_value],
            bins=40,
            alpha=0.3,
            orientation='horizontal',
            density=True,
        )

    average_inputs = np.mean(mc_inputs.reshape((-1,252)), axis=1)
    ax_main.scatter(
        average_inputs,
        mc_scores,
        alpha=0.3,
        label='MC-like PU Sample',
    )
    ax_top.hist(
        average_inputs,
        bins=40,
        alpha=0.3,
        density=True,
    )
    ax_right.hist(
        mc_scores,
        bins=40,
        alpha=0.3,
        orientation='horizontal',
        density=True,
    )
    
    ax_main.set_xlabel('CICADA Average Input (GeV)')
    ax_main.set_ylabel('CICADA Scores')
    ax_main.legend(loc='upper left')
    ax_top.set_xticks([])
    ax_top.set_yticks([])
    ax_right.set_xticks([])
    ax_right.set_yticks([])
    plt.yscale('linear')
    plt.tight_layout()
    plt.savefig(f'{output_path}/CICADA_vs_average_input.png')
    plt.close()

def make_score_vs_nonzero_inputs_plot(
        npv_scores,
        npv_inputs,
        mc_scores,
        mc_inputs,
        output_path,
):
    fig = plt.figure(figsize=(8, 8))
    gs = gridspec.GridSpec(2, 2, width_ratios=[4, 1], height_ratios=[1, 4])

    ax_main = plt.subplot(gs[1, 0])
    ax_top = plt.subplot(gs[0, 0], sharex=ax_main)
    ax_right = plt.subplot(gs[1, 1], sharey=ax_main)

    for npv_value in npv_inputs:
        non_zero_inputs = np.sum(
            np.where(
                npv_inputs[npv_value].reshape((-1, 252)) > 0,
                1.0,
                0.0
            ),
            axis=1
        )

        ax_main.scatter(
            non_zero_inputs,
            npv_scores[npv_value],
            alpha=0.3,
            label=f'ZB, NPV = {npv_value}'
        )

        ax_top.hist(
            non_zero_inputs,
            bins=40,
            alpha=0.3,
            density=True,
        )
        ax_right.hist(
            npv_scores[npv_value],
            bins=40,
            alpha=0.3,
            orientation='horizontal',
            density=True,
        )
    non_zero_inputs = np.sum(
        np.where(
            mc_inputs.reshape((-1, 252)) > 0,
            1.0,
            0.0,
        ),
        axis=1
    )

    ax_main.scatter(
        non_zero_inputs,
        mc_scores,
        alpha=0.3,
        label='MC-like PU Sample',
    )

    ax_top.hist(
        non_zero_inputs,
        bins=40,
        alpha=0.3,
        density=True,
    )
    ax_right.hist(
        mc_scores,
        bins=40,
        alpha=0.3,
        orientation='horizontal',
        density=True,
    )

    ax_main.set_xlabel('CICADA Non Zero Inputs (GeV)')
    ax_main.set_ylabel('CICADA Scores')
    ax_main.legend(loc='upper left')
    ax_top.set_xticks([])
    ax_top.set_yticks([])
    ax_right.set_xticks([])
    ax_right.set_yticks([])
    plt.yscale('linear')
    plt.tight_layout()
    plt.savefig(f'{output_path}/CICADA_vs_nonzero_inputs.png')
    plt.close()
        
def make_score_vs_input_sum_plot(
        npv_scores,
        npv_inputs,
        mc_scores,
        mc_inputs,
        output_path,
):
    fig = plt.figure(figsize=(8, 8))
    gs = gridspec.GridSpec(2, 2, width_ratios=[4, 1], height_ratios=[1, 4])

    ax_main = plt.subplot(gs[1, 0])
    ax_top = plt.subplot(gs[0, 0], sharex=ax_main)
    ax_right = plt.subplot(gs[1, 1], sharey=ax_main)

    for npv_value in npv_inputs:
        input_sum = np.sum(npv_inputs[npv_value].reshape((-1, 252)), axis=1)

        ax_main.scatter(
            input_sum,
            npv_scores[npv_value],
            alpha=0.3,
            label=f'ZB, NPV = {npv_value}'
        )

        ax_top.hist(
            input_sum,
            bins=40,
            alpha=0.3,
            density=True,
        )
        ax_right.hist(
            npv_scores[npv_value],
            bins=40,
            alpha=0.3,
            orientation='horizontal',
            density=True,
        )
    input_sum = np.sum(mc_inputs.reshape((-1, 252)), axis=1)

    ax_main.scatter(
        input_sum,
        mc_scores,
        alpha=0.3,
        label='MC-like PU Sample',
    )

    ax_top.hist(
        input_sum,
        bins=40,
        alpha=0.3,
        density=True,
    )
    ax_right.hist(
        mc_scores,
        bins=40,
        alpha=0.3,
        orientation='horizontal',
        density=True,
    )

    ax_main.set_xlabel('CICADA Sum of All Inputs (GeV)')
    ax_main.set_ylabel('CICADA Scores')
    ax_main.legend(loc='upper left')
    ax_top.set_xticks([])
    ax_top.set_yticks([])
    ax_right.set_xticks([])
    ax_right.set_yticks([])
    plt.yscale('linear')
    plt.tight_layout()
    plt.savefig(f'{output_path}/CICADA_vs_input_sum.png')
    plt.close()

def main(args):
    #Get ZB sample
    all_data = [
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
    ]

    console.log('Making ZB DF')
    df, chains = make_df(
        all_data,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits',
            'npvNtuplizer/NPVTree',
        ],
        #debug
        #modulus_acceptance = 10
    )

    #debug
    #df = df.Range(100000)

    nEvents = df.Count()
    console.log(f'nEvents: {nEvents.GetValue()}')

    cmssw_base = os.getenv('CMSSW_BASE')
    with open(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_combined_trigger_list.json') as the_file:
        unprescaled_trigger_list = json.load(the_file)
    df = make_pure_event_variable_from_list(df, unprescaled_trigger_list)
    
    #Get Lino's Sample
    console.log('Loading MC like sample')
    background_path = '/hdfs/store/user/ligerlac/CICAD2025Training/ZB-2024-sampled-like-mc.h5' #lino's MC like data sample
    with h5py.File(background_path) as the_file:
        mc_inputs = np.array(the_file['CaloRegions']).reshape((-1,252))
        mc_purity = np.array(the_file['is_pure'])
        mc_npv = np.array(the_file['nPV'])
    
    #Separate ZB out into pu 20, 30, 40, 50, 60, 64, and 68 samples
    npv_values = [
        # 20,
        # 30,
        # 40,
        # 50,
        60,
        64,
        68,
    ]

    npv_dfs = {}

    for npv_value in npv_values:
        npv_dfs[npv_value] = df.Filter(f'npv == {npv_value}')

    console.log('Counting events')
    for npv_value in npv_dfs:
        event_count = npv_dfs[npv_value].Count().GetValue()
        console.log(f'\tNPV {npv_value}: {event_count}')
    console.log(f'\tMC-like sample: {len(mc_inputs)}')
        
    #Get CICADA Inputs and purities
    console.log('Getting inputs')
    npv_inputs = {}
    npv_purity = {}
    for npv_value in npv_dfs:
        npv_inputs[npv_value], npv_purity[npv_value], _ = get_inputs(npv_dfs[npv_value])

    output_path = Path(args.output_dir)
    output_path.mkdir(exist_ok=True, parents=True)
        
    #CICADA Inputs plots    
    #total ET fractions
    console.log('Making total inputs plot')
    make_total_input_plot(npv_inputs, mc_inputs,output_path)
    #Averages
    console.log('Making average inputs plot')
    make_average_input_plot(npv_inputs, mc_inputs, output_path)
    #non zeros
    console.log('Making non-zero inputs plot')
    make_nonzero_input_plot(npv_inputs, mc_inputs, output_path)
    #sums
    console.log('Making summed inputs plot')
    make_sum_input_plot(npv_inputs, mc_inputs, output_path)
    
    #purity as a function of each

    #Let's make score plots
    console.log('Making model predictions')
    cmssw_base = os.getenv('CMSSW_BASE')
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    model = keras.models.load_model(model_path)

    npv_scores = {}
    for npv_value in npv_dfs:
        npv_scores[npv_value] = model.predict(npv_inputs[npv_value].reshape((-1,252))).reshape((-1,))
    mc_scores = model.predict(mc_inputs.reshape((-1,252))).reshape((-1,))

    console.log('Score Plots')
    make_score_plot(
        npv_scores,
        mc_scores,
        output_path,
    )

    #Let's do score as a function of the inputs
    console.log('Score as a function of inputs')
    console.log('Score vs average input')
    make_score_vs_average_input_plot(npv_scores, npv_inputs, mc_scores, mc_inputs, output_path)
    console.log('Score vs Non-zero inputs')
    make_score_vs_nonzero_inputs_plot(npv_scores, npv_inputs, mc_scores, mc_inputs, output_path)
    console.log('Score vs input sum')
    make_score_vs_input_sum_plot(npv_scores, npv_inputs, mc_scores, mc_inputs, output_path)

    #Let's make CDF plots/Rate plots with errors for all integer values!
    #Do score as a function of the inputs as well

    #For Lino's sample only we can do the score as a function of NPV

    console.log('Done!')
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Validate the MC-like PU sample')

    parser.add_argument(
        '--output_dir',
        default='ValidationPlots',
        nargs='?',
        help='Spot for all output',
    )

    args = parser.parse_args()
    
    main(args)
