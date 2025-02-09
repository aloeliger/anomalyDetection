#!/usr/bin/env python3
#script for making the complete set of scores to be later hadded together
import ROOT
import src.make_score_plots as sp
from src.sample import GroupedSample
from src.utils import *
from pathlib import Path
from rich.console import Console
import tensorflow.keras as keras
import os
import json

console = Console()

def main():
    console.log('Making samples')
    trees = [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        'npvNtuplizer/NPVTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits'
    ]
    samples = {
        'RunC': GroupedSample(
            name='RunC',
            nGroups=10,
            list_of_paths=['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',],
            list_of_trees=trees,
        ),
        'RunD': GroupedSample(
            name='RunD',
            nGroups=10,
            list_of_paths=['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',],
            list_of_trees=trees,
        ),
        'RunE': GroupedSample(
            name='RunE',
            nGroups=10,
            list_of_paths=['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',],
            list_of_trees=trees,
        ),
        'RunG': GroupedSample(
            name='RunG',
            nGroups=10,
            list_of_paths=['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',],
            list_of_trees=trees,
        ),
        'RunH': GroupedSample(
            name='RunH',
            nGroups=10,
            list_of_paths=['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',],
            list_of_trees=trees,
        ),
        'RunI': GroupedSample(
            name='RunC',
            nGroups=10,
            list_of_paths=['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',],
            list_of_trees=trees,
        ),
        
    }

    cmssw_base = os.getenv('CMSSW_BASE')
    json_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'
    with open(json_location) as theFile:
        unprescaled_trigger_list = json.load(theFile)

    models = {
        'AndrewTeacherOnly': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/teacher_score_only_student/',
        'LegacyMethod': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/',
        'NPVScaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-npv-scaled/',
        'ETScaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-et-scaled/',
    }
    for model in models:
        models[model] = keras.models.load_model(models[model])

    base_path = Path('TrainingPlotROOTFiles/GroupedScorePlots')
    base_path.mkdir(exist_ok=True, parents=True)

    npv_bins = [
        (30, 35),
        (35, 40),
        (40, 45),
        (45, 50),
        (50, 55),
        (55, 60),
        (60, 65),
    ]

    cicada_average_bins = [
        (0.0, 1.0),
        (1.0, 2.0),
        (2.0, 3.0),
        (3.0, 4.0),
        (4.0, 5.0),
        (5.0, 6.0)
    ]

    console.log('Pre-definitions')
    for sample in samples:
        the_sample = samples[sample]
        for i in range(the_sample.nGroups):
        
            the_sample.grouped_dfs[i] = filter_bad_events(the_sample.grouped_dfs[i])
            the_sample.grouped_dfs[i] = define_cicada_average_variable(the_sample.grouped_dfs[i])
            the_sample.grouped_dfs[i] = make_pure_event_variable_from_list(the_sample.grouped_dfs[i], unprescaled_trigger_list)

    console.log('Making all plots')
    for sample in samples:
        console.log(f'sample: {sample}')
        the_sample = samples[sample]

        for group_num in range(the_sample.nGroups):
            console.log(f'\tgroup: {group_num}')
            #Let's get all the inputs we need before hand to save ourselves some computing time
            sample_inputs, sample_pure, sample_npvs, sample_input_averages = sp.get_all_inputs(the_sample.grouped_dfs[group_num])
            
            for model in models:
                console.log(f'\t\tmodel: {model}')
                the_model = models[model]
                model_predictions = the_model.predict(sample_inputs, verbose=0).reshape((-1,))
                #Okay, now we need to do everything here
                #General score plot
                general_score_output_dir = base_path/f"{sample}/{model}/Overall/"
                general_score_output_dir.mkdir(exist_ok=True, parents=True)
                file_name = f'{general_score_output_dir}/scores_{group_num}.root'
                histogram_name='score_plot'
                sp.make_score_plot_from_group(
                    model_predictions,
                    histogram_name = histogram_name,
                    output_file_name = file_name,
                )
                
                #pure score plot
                pure_score_output_dir = base_path/f"{sample}/{model}/Pure/"
                pure_score_output_dir.mkdir(exist_ok=True, parents=True)
                mask = (sample_pure == 1)
                sp.make_score_plot_from_group(
                    model_predictions[mask],
                    histogram_name = histogram_name,
                    output_file_name=file_name,
                )
                
                #binned npv score plot
                for npv_bin in npv_bins:
                    npv_output_dir = base_path/f"{sample}/{model}/NPV_{npv_bin[0]}_{npv_bin[1]}/"
                    npv_output_dir.mkdir(exist_ok=True, parents=True)
                    mask = (sample_pure == 1) & (sample_npvs >= npv_bin[0]) & (sample_npvs <= npv_bin[1])
                    sp.make_score_plot_from_group(
                        model_predictions[mask],
                        histogram_name,
                        output_file_name=file_name,
                    )
                        
                #binned cicada average score plot?
                for cicada_average_bin in cicada_average_bins:
                    bin_low_edge_str = str(cicada_average_bin[0]).replace('.', 'p')
                    bin_high_edge_str = str(cicada_average_bin[1]).replace('.', 'p')
                    cicada_average_output_dir = base_path/f"{sample}/CICADA_average_{bin_low_edge_str}_{bin_high_edge_str}/"
                    cicada_average_output_dir.mkdir(exist_ok=True, parents=True)
                    mask = (sample_pure == 1) & (sample_input_averages >= cicada_average_bin[0]) & (sample_input_averages <= cicada_average_bin[1])
                    sp.make_score_plot_from_group(
                        model_predictions[mask],
                        histogram_name,
                        output_file_name = file_name
                    )
            #End Models loop
        #End group num loop
    #End Samples loop

if __name__ == '__main__':
    main()
