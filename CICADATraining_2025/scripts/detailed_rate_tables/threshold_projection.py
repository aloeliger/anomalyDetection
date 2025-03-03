#okay, we want for each threshold, to project it out to PU 64
#or whereever
#So, we need to get a bit creative

import ROOT
import os
from rich.console import Console
import numpy as np
import json
from pathlib import Path
from rich.table import Table
import tensorflow.keras as keras
from collections import defaultdict
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

console = Console()

def convert_eff_to_rate(eff, n_bunches=2544):
    return eff * (float(n_bunches) * 11425e-3) #11425e-3 is the kHz orbit frequency

def convert_rate_to_eff(rate, n_bunches=2544):
    return rate / (float(n_bunches) * 11425e-3)

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

def swap_dictionary_order(the_dict):
    swapped_dict = defaultdict(dict)

    for outer_key, inner_dict in the_dict.items():
        for inner_key, value in inner_dict.items():
            swapped_dict[inner_key][outer_key] = value
    swapped_dict = dict(swapped_dict)
    return swapped_dict

def exp_func(x, a, b):
    return a*np.exp(b * x)

def project_and_plot_for_npv(rates, threshold, projection_npv, output_name):
    use_linear_fit = True
    use_quad_fit = True
    use_expo_fit = True
    
    y_rates = []
    x_npvs = []

    for npv in rates:
        y_rates.append(rates[npv])
        x_npvs.append(npv)

    y_rates= np.array(y_rates)
    x_npvs = np.array(x_npvs)

    projection_x_values = np.linspace(min(x_npvs), 70, 1000)
    try:
        quad_coeffs = np.polyfit(x_npvs, y_rates, 2)
        quad_func = np.poly1d(quad_coeffs)
        quad_y_values = quad_func(projection_x_values)
    except RuntimeError:
        use_quad_fit = False

    try:
        linear_coeffs = np.polyfit(x_npvs, y_rates, 1)
        linear_func = np.poly1d(linear_coeffs)
        linear_y_values = linear_func(projection_x_values)
    except:
        use_linear_fit = False

    try:
        params, covariance = curve_fit(exp_func, x_npvs, y_rates, p0=(1,0.5))
        exp_y_values = exp_func(projection_x_values, *params)
    except RuntimeError:
        use_expo_fit = False

    plt.scatter(
        x_npvs,
        y_rates,
        label='Measured from Zero Bias',
        color='red'
    )
    if use_quad_fit:
        plt.plot(
            projection_x_values,
            quad_y_values,
            label = 'Quadratic Fit',
            color = '#87CEEB',
        )
    if use_expo_fit:
        plt.plot(
            projection_x_values,
            exp_y_values,
            label='Exponential fit',
            color='orange'
        )
    if use_linear_fit:
        plt.plot(
            projection_x_values,
            linear_y_values,
            label='Linear Fit',
            color='green',
        )
    plt.legend()
    plt.xlabel('NPV')
    plt.ylabel('Threshold')
    int_threshold = int(threshold)
    plt.title(f'Threshold = {threshold}')
    plt.savefig(output_name)
    plt.close()

    if use_linear_fit:
        linear_projected_rate = linear_func(projection_npv)
    else:
        linear_projected_rate = -999.
        
    if use_quad_fit:
        quad_projected_rate = quad_func(projection_npv)
    else:
        quad_projected_rate = -999.

    if use_expo_fit:
        exp_projected_rate = exp_func(projection_npv, *params)
    else:
        exp_projected_rate = -999.

    return linear_projected_rate, quad_projected_rate, exp_projected_rate

def convert_dict_keys(the_dict):
    new_dict = {}
    for key in the_dict:
        new_dict[float(key)] = the_dict[key]
    return new_dict

def main():
    console.log('Making zero bias dataframe')
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

    # structure these as rate_dict[npv_window][threshold]
    pure_rates = {}
    overall_rates = {}

    npv_window_size = 3
    npv_targets = list(range(20,51,3))

    #Get the model
    cmssw_base = os.getenv('CMSSW_BASE')
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    model = keras.models.load_model(model_path)
    
    #okay, for an npv, we go through, and dump out the inputs
    #We make a score histogram-> rate histogram, and then
    #for each threshold, we estimate the overall and pure rate
    for npv_target in npv_targets:
        console.log(f'NPV: {npv_target}')

        pure_rates[npv_target] = {}
        overall_rates[npv_target] = {}

        filter_str = f'npv == {npv_target}'
        npv_df_prelim = zb_df.Filter(filter_str)
        npv_event_count = npv_df_prelim.Count()
        #limit = 3000000
        limit = 10000
        npv_df = npv_df_prelim.Range(limit)
        final_event_count = npv_df.Count()

        #Okay, we need to dump out the inputs, and then
        #make score plot predictions

        inputs, purity = get_inputs(npv_df)
        scores = model.predict(inputs).reshape((-1,))
        pure_scores = scores[purity==1]

        score_histogram, bin_edges = np.histogram(scores, bins=256, range=(0.0, 256.0))

        pure_score_histogram, _ = np.histogram(scores, bins=256, range=(0.0, 256.0))

        score_density = score_histogram/np.sum(score_histogram)
        score_cdf = 1.0 - np.cumsum(score_density)
        score_rate_hist = convert_eff_to_rate(score_cdf)

        pure_density = pure_score_histogram / np.sum(score_histogram)
        pure_cdf = 1.0 - np.cumsum(pure_density)
        pure_rate_hist = convert_eff_to_rate(pure_cdf)

        thresholds = bin_edges[:-1]
        
        for index, threshold in enumerate(thresholds):
            pure_rates[npv_target][threshold] = pure_rate_hist[index]
            overall_rates[npv_target][threshold] = score_rate_hist[index]
            #Let's save the events above and total, so we can try and make errors
            nEventsAboveThreshold = np.sum(scores > threshold)

    #these dicts will now be in rate_dict[threshold][npv] form.
    console.log('Making projections and plots')
    pure_rates = swap_dictionary_order(pure_rates)
    overall_rates = swap_dictionary_order(overall_rates)

    #Now we need to draw and make some projections

    linear_projected_pure_rates = {}
    quadratic_projected_pure_rates = {}
    exponential_projected_pure_rates = {}

    linear_projected_overall_rates = {}
    quadratic_projected_overall_rates = {}
    exponential_projected_overall_rates = {}

    pure_plot_dir = Path('PureRateFits')
    overall_plot_dir = Path('OverallRateFits')

    pure_plot_dir.mkdir(exist_ok=True)
    overall_plot_dir.mkdir(exist_ok=True)
    
    for index, threshold in enumerate(pure_rates):
        linear_projected_pure_rates[threshold], quadratic_projected_pure_rates[threshold], exponential_projected_pure_rates[threshold] = project_and_plot_for_npv(
            pure_rates[threshold],
            threshold,
            projection_npv=64,
            output_name = f'{pure_plot_dir}/pure_rate_threshold_{int(threshold)}.png'
        )
        

        linear_projected_overall_rates[threshold], quadratic_projected_overall_rates[threshold], exponential_projected_overall_rates[threshold] = project_and_plot_for_npv(
            overall_rates[threshold],
            threshold,
            projection_npv=64,
            output_name = f'{overall_plot_dir}/overall_rate_threshold_{int(threshold)}.png'
        )

    linear_projected_pure_rates = convert_dict_keys(linear_projected_pure_rates)
    quadratic_projected_pure_rates = convert_dict_keys(quadratic_projected_pure_rates)
    exponential_projected_pure_rates = convert_dict_keys(exponential_projected_pure_rates)

    linear_projected_overall_rates = convert_dict_keys(linear_projected_overall_rates)
    quadratic_projected_overall_rates = convert_dict_keys(quadratic_projected_overall_rates)
    exponential_projected_overall_rates = convert_dict_keys(exponential_projected_overall_rates)
        
    final_dict = {
        'pure':{
            'linear': linear_projected_pure_rates,
            'quadratic': quadratic_projected_pure_rates,
            'exponential': exponential_projected_pure_rates,
        },
        'overall':{
            'linear': linear_projected_overall_rates,
            'quadratic': quadratic_projected_overall_rates,
            'exponential': exponential_projected_overall_rates,
        }
    }
    #Okay, now let's save this as json
    with open('project_rate_tables.json', 'w') as the_file:
        json.dump(
            final_dict,
            the_file,
            indent=4,
        )
    console.log('Done!')
    

if __name__ == '__main__':
    main()
