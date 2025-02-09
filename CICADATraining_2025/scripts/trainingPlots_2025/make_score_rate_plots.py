#!/usr/bin/env python3
#Script for making score and rate plots
#List of plots we want

import ROOT
import src.make_rate_plots as rp
import src.make_score_plots as sp
from src.sample import Sample
from src.utils import *
from rich.console import Console
import os
import tensorflow.keras as keras
import json
from pathlib import Path
import argparse
import numpy as np

console = Console()

# DONE: Score plots per era, per model
# DONE: Rate plots per model, same canvas
# DONE: Pure score plots per model, same canvas
# DONE: Pure rate plots per model, same canvas
# DONE: Pure Rate relation to PU per model, same Canvas
# TODO: Rate relation to <CICADA ET> per model, same canvas

# DONE: Rate and Purity exclusively on the last run, RunI
# DONE: Dump Out Thresholds

#DONE: Prune Bad runs
# DONE: Get all thresolds vs rates in json form

def main(args):
    # Done:
    # Okay, grand plan
    # Get one sample per era, and one overall
    # Each should be only 10% of the total to start for quickness
    console.log('Making samples')
    trees = [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        'npvNtuplizer/NPVTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits'
    ]
    samples = {
        'RunC': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunD': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunE': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunG': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunH': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunI': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        # 'RecentRuns': Sample(
        #     [
        #         '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        #         '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        #         '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
        #     ],
        #     trees
        #     limit_files = args.limit_files,
        #     modulus_acceptance = args.modulus_acceptance
        # )
    }

    # DONE: We need to calculate the purity per each thing
    console.log('Defining purity')
    cmssw_base = os.getenv('CMSSW_BASE')
    json_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'
    with open(json_location) as theFile:
        unprescaled_trigger_list = json.load(theFile)

    for sample in samples:
        console.log(f'\t{sample}')
        filter_bad_events(samples[sample])
        samples[sample] = make_pure_event_variable_from_list(samples[sample], unprescaled_trigger_list)
        samples[sample].pure_df = samples[sample].df.Filter('pure_event ==  1')
    
    # DONE: From there, rip the inputs out of each, and then the NPVs
    inputs = {}
    npvs = {}
    
    pure_inputs = {}
    pure_npvs = {}

    console.log('Overall inputs')
    for sample in samples:
        console.log(f'\t{sample}')
        inputs[sample], _, _, _ = sp.get_all_inputs(samples[sample].df)
        npvs = rp.get_secondary_inputs(samples[sample].df)

    console.log('Pure inputs')
    for sample in samples:
        console.log(f'\t{sample}')
        pure_inputs[sample], _, _, _ = sp.get_all_inputs(samples[sample].pure_df)
        pure_npvs[sample] = rp.get_secondary_inputs(samples[sample].pure_df)
        
    #DONE: Let's get all the models we want to use
    console.log('Getting models')
    cmssw_base = os.getenv('CMSSW_BASE')
    models = {
        'Teacher Score Only (Weighted)': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/teacher_score_only_student/',
        'Legacy Method': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/',
        'NPV Scaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-npv-scaled/',
        'ET scaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-et-scaled/',
    }
    for model in models:
        models[model] = keras.models.load_model(models[model])

    condensed_names = {
        'Teacher Score Only (Weighted)': 'AndrewTeacherOnly',
        'Legacy Method': 'LegacyMethod',
        'NPV Scaled': 'NPVScaled',
        'ET scaled': 'ETScaled',
    }
    #DONE: Let's make all the score predictions
    score_predictions = {}
    pure_score_predictions = {}
    for model in models:
        score_predictions[model] = {}
        pure_score_predictions[model] = {}
        for sample in samples:
            score_predictions[model][sample] = models[model].predict(inputs[sample])
            pure_score_predictions[model][sample] = models[model].predict(pure_inputs[sample])

    #DONE: Let's get an output directory
    base_output_dir = Path(args.output_dir)
    
    #Okay, that was the hard part. Now let's make all the plots we need
    #DONE: Let's make all the score plots
    console.log('ScorePlots')
    score_output_dir = base_output_dir/'ScorePlots'
    score_output_dir.mkdir(exist_ok=True, parents=True)
    
    score_plots = {}
    for model in score_predictions:
        score_plots[model]={}
        for sample in score_predictions[model]:
            score_plots[model][sample]=sp.make_score_plot_from_predictions(
                score_predictions[model][sample],
                tag=f'{model}_{sample}'
            )

        histo_name = f'{score_output_dir}/{condensed_names[model]}_score_plot.png'
        sp.draw_score_plot(
            score_plots[model],
            histo_name,
        )
    #DONE: Let's get Pure Score Plots
    console.log('Pure Score Plots')
    pure_score_output_dir = base_output_dir/'PureScorePlot'
    pure_score_output_dir.mkdir(exist_ok=True, parents=True)
    
    pure_score_plots = {}
    for model in pure_score_predictions:
        pure_score_plots[model] = sp.make_score_plot_from_predictions(
            pure_score_predictions[model]['RecentRuns'],
            tag=f'{model}_sample_pure'
        )
    histo_name = f'{pure_score_output_dir}/pure_score_plot.png'
    sp.draw_score_plot(
        pure_score_plots,
        histo_name
    )
        
    #DONE: Let's make rate plots
    console.log('Rate Plots')
    rate_plot_output_dir = base_output_dir/'RatePlots'
    rate_plot_output_dir.mkdir(exist_ok=True, parents=True)
    rate_plots = {}
    for model in score_plots:
        cdf_plot = rp.make_CDF(score_plots[model]['RecentRuns'])
        rate_plot = rp.make_rate_plot(cdf_plot)
        rate_plots[model] = rate_plot

    histo_name = f'{rate_plot_output_dir}/rate_plot.png'
    console.log('Draw Rate Plots')
    rp.draw_rate_plot(
        rate_plots,
        histo_name,
    )
    
    #DONE: Let's make pure rate plots
    console.log('Pure Rate Plots')
    pure_rate_plot_output_dir = base_output_dir/'PureRatePlots'
    pure_rate_plot_output_dir.mkdir(exist_ok=True, parents=True)
    pure_rate_plots={}
    for model in pure_score_plots:
        cdf_plot = rp.make_CDF(pure_score_plots[model])
        rate_plot = rp.make_rate_plot(cdf_plot)
        pure_rate_plots[model] = rate_plot

    histo_name = f'{pure_rate_plot_output_dir}/pure_rate_plot.png'
    rp.draw_rate_plot(
        pure_rate_plots,
        histo_name,
    )
    
    #DONE: Let's make the rate vs npv plot
    console.log('Rate vs npv')
    pure_rate_vs_npv_output_dir = base_output_dir/'PureRateVsNPV'
    pure_rate_vs_npv_output_dir.mkdir(exist_ok=True, parents=True)
    pure_rate_vs_npv_plots = {}
    for model in pure_score_predictions:
        chosen_kHz_threshold, _ = rp.get_threshold_for_rate(5.0, pure_rate_plots[model])
        rate_vs_npv_plot = rp.make_rate_vs_variable_plot(
            pure_score_predictions[model]['RecentRuns'],
            chosen_kHz_threshold,
            pure_npvs['RecentRuns'],
            [
                (30, 35),
                (35, 40),
                (40, 45),
                (45, 50),
                (50, 55),
                (55, 60),
                (60, 65),
                (65, 70),
            ]
        )
        pure_rate_vs_npv_plots[model] = rate_vs_npv_plot
    histo_name = f'{pure_rate_vs_npv_output_dir}/pure_rate_vs_npv.png'
    rp.draw_rate_vs_variable_plot(
        pure_rate_vs_npv_plots,
        'npv',
        5.0,
        histo_name
    )
    #DONE: Let's make the rate vs <CICADA ET> plot
    #DONE: need a way to specify the points more properly
    console.log('Rate vs average cicada')
    pure_rate_vs_average_cicada_dir = base_output_dir/'PureRateVsAverageCICADA'
    pure_rate_vs_average_cicada_dir.mkdir(exist_ok=True, parents=True)
    pure_rate_vs_average_cicada_plots = {}
    pure_inputs_average = np.mean(pure_inputs['RecentRuns'], axis=1)
    for model in pure_rate_plots:
        chosen_kHz_threshold, _ = rp.get_threshold_for_rate(5.0, pure_rate_plots[model])
        rate_vs_average_cicada_plot = rp.make_rate_vs_variable_plot(
            pure_score_predictions[model]['RecentRuns'],
            chosen_kHz_threshold,
            pure_inputs_average,
            [
                (0.0, 1.0),
                (1.0, 2.0),
                (2.0, 3.0),
                (3.0, 4.0),
                (4.0, 5.0),
                (5.0, 6.0),
                (6.0, 7.0),
                (7.0, 8.0),
            ]
        )
        pure_rate_vs_average_cicada_plots[model] = rate_vs_average_cicada_plot
    histo_name = f'{pure_rate_vs_average_cicada_dir}/pure_rate_vs_average_cicada.npv'
    rp.draw_rate_vs_variable_plot(
        pure_rate_vs_average_cicada_plots,
        'CICADA Input Average',
        5.0,
        histo_name
    )

    #DONE: We need to get a table of rates
    rate_table_location = Path(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/RateTables')
    rate_table_location.mkdir(exist_ok=True)
    
    console.log('Rate Tables')
    rates = [
        1.0,
        0.5,
        0.25,
        0.1,
        0.05,
    ]
    for model in pure_rate_plots:
        rp.dump_rate_table(
            rate_plots[model],
            pure_rate_plots[model],
            rates,
            model
        )
        rp.dump_complete_rate_tables(
            rate_plots[model],
            pure_rate_plots[model],
            condensed_names[model],
            str(rate_table_location)
        )
    
    console.log('Done!')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Script for making score and rate plots for the 2025 training")

    parser.add_argument(
        '--output_dir',
        nargs='?',
        default='TrainingPlots',
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
