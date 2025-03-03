import ROOT
import tensorflow.keras as keras
import os
from rich.console import Console
import numpy as np
from sklearn.metrics import roc_curve, auc
import json
import h5py
from pathlib import Path
import matplotlib.pyplot as plt

console = Console()

def convert_eff_to_rate(eff, n_bunches=2544):
    return eff * (float(n_bunches) * 11425e-3) #11425e-3 is the kHz orbit frequency

def convert_rate_to_eff(rate, n_bunches=2544):
    return rate / (float(n_bunches) * 11425e-3)

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

def make_df_dict(path_dict, list_of_trees):
    df_dict = {}
    df_chains = {}
    for sample in path_dict:
        df_dict[sample], df_chains[sample] = make_df(path_dict[sample], list_of_trees)
    return df_dict, df_chains

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

def make_all_score_plots(
        signal_predictions,
        background_predictions,
        output_name,
):
    plt.figure()
    for sample in signal_predictions:
        plt.hist(
            signal_predictions[sample],
            bins=100,
            density=True,
            histtype='step',
            alpha=0.3,
            log=True,
            label=sample,
            linewidth=2.0,
        )
    plt.hist(
        background_predictions,
        bins=100,
        density=True,
        histtype='step',
        alpha=0.3,
        log=True,
        label='ZeroBias',
        linewidth=2.0,
    )
    plt.xlabel('CICADA Score')
    plt.ylabel('A.U.')
    plt.title('')
    plt.legend(loc='upper right', ncol=2)
    plt.tight_layout()
    plt.savefig(output_name)
    plt.close()

def make_all_roc_curves(
        signal_predictions,
        signal_inputs,
        background_predictions,
        background_inputs,
        output_name,
        xaxis_name = 'Overall Rate (kHz)',
):
    fig, ax = plt.subplots()
    #plt.set_xscale('log')
    for index, sample in enumerate(signal_predictions):
        console.log(f'\t{sample}')
        console.log(f'len: {len(signal_predictions[sample])}, sum: {np.sum(signal_predictions[sample])}')
        y_true = np.append(
            np.zeros((len(background_predictions),)),
            np.ones((len(signal_predictions[sample]),))
        )
        y_scores = np.append(
            background_predictions,
            signal_predictions[sample],
        )
        y_dummy_scores = np.append(
            np.sum(background_inputs**2, axis=1),
            np.sum(signal_inputs[sample]**2, axis=1),
        )

        #console.print(y_true.shape)
        #console.print(y_scores.shape)
        #console.print(y_dummy_scores.shape)

        fpr, tpr, thresholds = roc_curve(y_true, y_scores)
        dummy_fpr, dummy_tpr, dummy_thresholds = roc_curve(y_true, y_dummy_scores)

        roc_auc = auc(fpr, tpr)
        dummy_roc_auc = auc(dummy_fpr, dummy_tpr)
        #convert fprs to rates
        zero_bias_rate = convert_eff_to_rate(fpr)
        dummy_zero_bias_rate = convert_eff_to_rate(dummy_fpr)

        #rate_mask = (zero_bias_rate >= 100.0)
        #dummy_rate_mask = (dummy_zero_bias_rate >= 100.0)
        
        ax.plot(
            #fpr,
            zero_bias_rate,
            #zero_bias_rate[rate_mask],
            tpr,
            label=f'{sample}, AUC:{roc_auc:0.2f}',
            c=f'C{index}',
            linestyle='-'
        )
        ax.plot(
            #dummy_fpr,
            dummy_zero_bias_rate,
            #dummy_zero_bias_rate[dummy_rate_mask],
            dummy_tpr,
            label=f'{sample}, cut-based, AUC {dummy_roc_auc:0.2f}',
            c=f'C{index}',
            linestyle='--'
        )
    vline = ax.axvline(3.0, color='grey', linestyle='--', label= '3 kHz Overall')
    ax.set_xscale("log")
    ax.set_yscale("log")
    ax.set_xlabel('Overall Rate (kHz)')
    #plt.xlim(0.0, 100.0)
    ax.set_ylabel("Signal Efficiency")
    plt.title("")
    plt.legend(bbox_to_anchor=(1.0, 0.0), loc='lower right')
    plt.tight_layout()
    plt.savefig(output_name)
    plt.close()

def main():
    signal_paths = {
        'GluGluHToGG': '/hdfs/store/user/aloelige/GluGluHToGG_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_GluGluHToGG_Run3Winter24_10Jan2025/',
        'GluGluHToTauTau': '/hdfs/store/user/aloelige/GluGluHToTauTau_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_GluGluHToTauTau_Run3Winter24_10Jan2025/',
        'HTo2LongLivedTo4b': '/hdfs/store/user/aloelige/HTo2LongLivedTo4b_MH-125_MFF-12_CTau-900mm_TuneCP5_13p6TeV_pythia8/CICADATraining2025_HTo2LongLivedTo4b_Run3Winter24_10Jan2025/',
        'TT': '/hdfs/store/user/aloelige/TT_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_TT_Run3Winter24_13Jan2025/',
        'VBFHToTauTau': '/hdfs/store/user/aloelige/VBFHToTauTau_M125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_VBFHToTauTau_Run3Winter24_13Feb2025/',
        'VBFHto2B': '/hdfs/store/user/aloelige/VBFHto2B_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_VBFHTo2B_Run3Winter24_13Feb2025/',
    }

    console.log('Making Dataframes')
    signal_dfs, signal_chains = make_df_dict(
        signal_paths,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits'
        ],
    )

    ##TT is huge. We have to treat it differently
    signal_dfs['TT'] = signal_dfs['TT'].Range(5000000)
    
    #debug
    # for sample in signal_dfs:
    #    signal_dfs[sample] = signal_dfs[sample].Range(100000)

    #Define purity information
    console.log('Defining Purity')
    cmssw_base = os.getenv('CMSSW_BASE')
    with open(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_combined_trigger_list.json') as the_file:
        unprescaled_trigger_list = json.load(the_file)
    for sample in signal_dfs:
        signal_dfs[sample] = make_pure_event_variable_from_list(
            signal_dfs[sample],
            unprescaled_trigger_list,
        )

    console.log("Making inputs")
    signal_inputs = {}
    signal_purity = {}
    for sample in signal_dfs:
        console.log(f'\t{sample}')
        signal_inputs[sample], signal_purity[sample] = get_inputs(signal_dfs[sample])
        #I wonder if the baseline outperformance here is a function of the goofy high iEta largeness?
        #signal_inputs[sample].reshape((-1,18,14,1))[:, :, 0, :] = 0
        #signal_inputs[sample].reshape((-1,18,14,1))[:, :, 13, :] = 0
        
    #background_path = '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/'
    console.log("Getting Background sample")
    #background_path = '/hdfs/store/user/ligerlac/CICAD2025Training/ZB-2024-sampled-like-mc.h5' #lino's MC like data sample
   # with h5py.File(background_path) as the_file:
        #debug
        #background_inputs = np.array(the_file['CaloRegions']).reshape((-1,252))[:100000]
        #background_purity = np.array(the_file['is_pure'])[:100000]
        # background_inputs = np.array(the_file['CaloRegions']).reshape((-1,252))
        # background_purity = np.array(the_file['is_pure'])
    all_data = [
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
    ]

    #console.log('Making DF')
    background_df, background_chains = make_dfs(
        all_data,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits',
            'npvNtuplizer/NPVTree',
        ],
    )
    background_df = make_pure_event_variable_from_list(background_df, unprescaled_trigger_list)
    background_df = background_df.Filter('npv <= 65 && npv >= 60')
    background_npv_mean = background_df.Mean('npv')
    #debug
    background_df = background_df.Range(5000000)
    background_inputs, background_purity = get_inputs(background_df)
        
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    new_model = keras.models.load_model(model_path)

    teacher_model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/data/teachers/best-mse-trained/'
    teacher_model = keras.models.load_model(teacher_model_path)

    console.log('Making signal model predictions')
    signal_predictions = {}
    for sample in signal_inputs:
        console.log(f'\t{sample}')
        signal_predictions[sample] = new_model.predict(signal_inputs[sample]).reshape((-1,))

    console.log('Making background model predictions')
    background_predictions = new_model.predict(background_inputs).reshape((-1,))

    console.log('Making Teacher signal errors predictions')
    teacher_signal_errors = {}
    for sample in signal_inputs:
        console.log(f'\t{sample}')
        predictions = teacher_model.predict(signal_inputs[sample].reshape((-1,18,14,1))).reshape((-1,18,14,1))
        errors = np.mean((predictions-signal_inputs[sample].reshape((-1,18,14,1)))**2, axis=(1,2,3))
        teacher_signal_errors[sample] = errors

    console.log('Making teacher background errors predictions')
    teacher_predictions = teacher_model.predict(background_inputs.reshape((-1,18,14,1))).reshape((-1,18,14,1))
    teacher_background_errors = np.mean((teacher_predictions - background_inputs.reshape((-1,18,14,1)))**2, axis=(1,2,3))

    console.log('Making pure samples/inputs')
    pure_signal_predictions = {}
    pure_signal_inputs = {}
    for sample in signal_predictions:
        console.log(f'\t{sample}')
        pure_signal_predictions[sample] = signal_predictions[sample][signal_purity[sample] == 1]
        pure_signal_inputs[sample] = signal_inputs[sample][signal_purity[sample] == 1]
        console.log(f'\tPurity: {len(pure_signal_predictions[sample])/len(signal_predictions[sample]):0.2%}')
    pure_background_predictions = background_predictions[background_purity == 1]
    pure_background_inputs = background_inputs[background_purity == 1]

    console.log('Making output dir')
    plot_output_dir = Path("SignalPlots")
    plot_output_dir.mkdir(exist_ok=True, parents=True)
    
    console.log('Making Score Plots')
    make_all_score_plots(
        signal_predictions,
        background_predictions,
        str(plot_output_dir/'score_plots.png')
    )

    make_all_score_plots(
        teacher_signal_errors,
        teacher_background_errors,
        str(plot_output_dir/'teacher_error_plots.png')
    )

    make_all_score_plots(
        pure_signal_predictions,
        pure_background_predictions,
        str(plot_output_dir/'pure_score_plots.png')
    )
    
    console.log("Making ROC Curves")
    make_all_roc_curves(
        signal_predictions,
        signal_inputs,
        background_predictions,
        background_inputs,
        str(plot_output_dir/'overall_rocs.png')
    )

    console.log('Teacher Overall ROC Curves')
    make_all_roc_curves(
        teacher_signal_errors,
        signal_inputs,
        teacher_background_errors,
        background_inputs,
        str(plot_output_dir/'teacher_overall_rocs.png')
    )

    console.log('Pure ROC curves')

    make_all_roc_curves(
        pure_signal_predictions,
        pure_signal_inputs,
        background_predictions,
        background_inputs,
        #pure_background_predictions,
        #pure_background_inputs,
        str(plot_output_dir/'pure_rocs.png'),
        xaxis_name = 'Pure Rate (kHz)',
    )
    console.log(f'Mean NPV in data: {background_npv_mean.GetValue()}')
    console.log('Done!')
    
if __name__ == '__main__':
    main()
