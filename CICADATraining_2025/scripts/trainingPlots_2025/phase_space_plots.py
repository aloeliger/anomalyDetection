#!/usr/bin/env python3
#Script for making phase space plots from the given models

import ROOT
import src.make_phase_space_plots as psp
import src.make_score_plots as sp
from src.sample import Sample
from src.utils import *
from rich.console import Console
import os
import tensorflow.keras as keras
import json
import argparse
from pathlib import Path

console = Console()

#Okay, per each model, let's make and draw a heap of kinematics plots

def main(args):
    output_path = Path(args.output_dir)
    output_path.mkdir(exist_ok=True, parents=True)
    console.log('Making sample')
    trees = [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        'npvNtuplizer/NPVTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits',
        'l1UpgradeTree/L1UpgradeTree',
    ]
    sample = Sample(
        [
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
        ],
        trees,
        limit_files = args.limit_files,
        modulus_acceptance = args.modulus_acceptance,
    )

    console.log('Getting models')
    cmssw_base = os.getenv('CMSSW_BASE')
    models = {
        'AndrewTeacherOnly': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/teacher_score_only_student/',
        'LegacyMethod': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/',
        'NPVScaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-npv-scaled/',
        'ETScaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-et-scaled/',
    }
    

    #Next let's define a pure event
    console.log("Pre-Definitions")
    json_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'
    with open(json_location) as theFile:
        unprescaled_trigger_list = json.load(theFile)

    sample.df = filter_bad_events(sample.df)
    sample.df = define_cicada_average_variable(sample.df)
    sample.df = make_pure_event_variable_from_list(sample.df, unprescaled_trigger_list)

    sample_inputs, _, _, _ = sp.get_all_inputs(sample.df)
    
    #Let's do some definitions we need to do up top
    #First, add the scores to the df
    console.log('Adding scores to DF')
    for model in models:
        console.log(f'\t{model}')
        models[model] = keras.models.load_model(models[model])
        model_predictions = models[model].predict(sample_inputs, verbose=0).reshape((-1,))
        sample = psp.add_score_to_sample(
            sample,
            model_predictions,
            f"{model}_cicada_score"
        )

    #Need to redefine these after we have modified the df
    sample.df = filter_bad_events(sample.df)
    sample.df = define_cicada_average_variable(sample.df)
    sample.df = make_pure_event_variable_from_list(sample.df, unprescaled_trigger_list)

    rate_table_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/RateTables'
    
    console.log('Making bookings')
    all_bookings = {}
    for model in models:
        rate_table_file = f'{rate_table_location}/{model}_rates.json'
        with open(rate_table_file) as theFile:
            rate_tables = json.load(theFile)
            all_bookings[model] = psp.make_all_phase_space_bookings(
                sample,
                #overall_rate_table[model],
                rate_tables['overall'],
                #pure_rate_table[model],
                rate_tables['pure'],
                f'{model}_cicada_score',
            )
    #Will have a dict full of bookings in indices [model][physics var][rate]

    console.log('Drawing all plots')
    base_dir = Path('PhaseSpacePlots')
    base_dir.mkdir(exist_ok=True)
    for model in all_bookings:
        
        psp.draw_phase_space_bookings(
            all_bookings[model],
            model,
            str(output_path)
        )

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Script for making phase space plots")

    parser.add_argument(
        '--output_dir',
        nargs='?',
        default='TrainingPlots/PhaseSpace',
        type=str
    )
    parser.add_argument(
        '--limit_files',
        type=int,
        help='Limit samples to this number of files'
    )
    parser.add_argument(
        '--modulus_acceptance',
        type=int,
        help='Modulus acceptance for all samples'
    )

    args = parser.parse_args()
    
    main(args)

