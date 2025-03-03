#!/usr/bin/env python3
#Script for drawing the precalculated score plots
#And making the remaining rate and rate vs variable plots

import ROOT
import src.make_rate_plots as rp
import src.make_score_plots as sp
from src.sample import Sample
from src.utils import *
from rich.console import Console
import os
import json
from pathlib import Path
import argparse
import numpy as np

console = Console()

def get_overall_score_plot(runs, models, open_files):
    overall_score_plots={}
    for model in models:
        overall_score_plots[model] = {}
        for run in runs:
            path = f'TrainingPlotROOTFiles/GroupedScorePlots/{run}/{model}/Overall/score.root'
            theFile = ROOT.TFile(path)
            open_files.append(theFile)
            the_plot = theFile.Get('score_plot').Clone()
            overall_score_plots[model][run] = the_plot
    return overall_score_plots

def get_pure_score_plot(models, open_files):
    pure_score_plots = {}
    for model in models:
        path = f'TrainingPlotROOTFiles/GroupedScorePlots/RunI/{model}/Pure/score.root'
        theFile = ROOT.TFile(path)
        open_files.append(theFile)
        the_plot = theFile.Get('score_plot').Clone()
        pure_score_plots[model] = the_plot
    return pure_score_plots

def get_NPV_Rate_Graph(model, open_files, threshold):
    the_graph = ROOT.TGraph()
    for npv_bin in [
            (30, 35),
            (35, 40),
            (40, 45),
            (45, 50),
            (50, 55),
            (55, 60),
            (60, 65),
    ]:
        
        file_path = f'TrainingPlotROOTFiles/GroupedScorePlots/RunI/{model}/NPV_{npv_bin[0]}_{npv_bin[1]}/score.root'
        the_file = ROOT.TFile(file_path)
        score_plot = the_file.Get('score_plot')
        cdf_plot = rp.make_CDF(score_plot)
        rate_plot = rp.make_rate_plot(cdf_plot)

        graph_point = (npv_bin[0] + npv_bin[1])/2
        
        rate_for_bin = rate_plot.GetBinContent(
            rate_plot.FindBin(threshold)
        )

        the_graph.AddPoint(graph_point, rate_for_bin)

    return the_graph

def get_CICADA_average_rate_graph(model, open_files, threshold):
    the_graph = ROOT.TGraph()
    for cicada_average_bin in [
            ('0p0', '1p0'),
            ('1p0', '2p0'),
            ('2p0', '3p0'),
            ('3p0', '4p0'),
            ('4p0', '5p0'),
            ('5p0', '6p0'),
    ]:
        file_path = f'TrainingPlotROOTFiles/GroupedScorePlots/RunI/{model}/CICADA_average_{cicada_average_bin[0]}_{cicada_average_bin[1]}/score.root'
        the_file = ROOT.TFile(file_path)
        score_plot = the_file.Get('score_plot')
        cdf_plot = rp.make_CDF(score_plot)
        rate_plot = rp.make_rate_plot(cdf_plot)

        low_edge = float(cicada_average_bin[0].replace('p', '.'))
        high_edge = float(cicada_average_bin[1].replace('p', '.'))

        graph_point = (low_edge + high_edge) / 2

        rate_for_bin = rate_plot.GetBinContent(
            rate_plot.FindBin(threshold)
        )

        the_graph.AddPoint(graph_point, rate_for_bin)
    return the_graph

def main():
    console.log("Base paths")
    base_path = Path('TrainingPlotROOTFiles_Initial')
    runs = [
        'RunC',
        'RunD',
        'RunE',
        'RunH',
        'RunG',
        'RunI',
    ]
    models = [
        'AndrewTeacherOnly',
        'LegacyMethod',
        'ETScaled',
        'NPVScaled',
    ]

    output_dir = Path('TrainingPlotsOptimized')
    output_dir.mkdir(exist_ok=True)
    
    open_files=[]
    console.log('Retrieving and making score plots')
    console.log("Overall score plots")
    overall_score_plots = get_overall_score_plot(runs, models, open_files)
    overall_score_dir = output_dir/'ScorePlots'
    overall_score_dir.mkdir(exist_ok=True, parents=True)

    for model in models:
        histo_name = str(overall_score_dir/f'{model}.png')
        sp.draw_score_plot(
            overall_score_plots[model],
            histo_name
        )

    console.log("Pure score plots")
    pure_score_plots = get_pure_score_plot(models, open_files)
    pure_score_dir = output_dir/'PureScorePlots'
    pure_score_dir.mkdir(exist_ok=True, parents=True)

    histo_name = f'{pure_score_dir}/pure_score_plot.png'
    sp.draw_score_plot(
        pure_score_plots,
        histo_name
    )

    #reduced range draw
    histo_name = f'{pure_score_dir}/pure_score_reduced_range.png'
    sp.draw_score_plot(
        pure_score_plots,
        histo_name,
        x_axis_range = (50.0, 85.0),
        y_axis_range = (0.00001, 0.01)
    )

    console.log('Rate Plots')
    rate_plot_output_dir = output_dir/'RatePlots'
    rate_plot_output_dir.mkdir(exist_ok=True, parents=True)
    rate_plots={}
    for model in pure_score_plots:
        cdf_plot = rp.make_CDF(
            overall_score_plots[model]['RunI']
        )
        rate_plot = rp.make_rate_plot(cdf_plot)
        rate_plots[model]=rate_plot

    histo_name = f'{rate_plot_output_dir}/rate_plot.png'
    rp.draw_rate_plot(
        rate_plots,
        histo_name
    )

    console.log('Pure rate plots')
    pure_rate_plot_dir=output_dir/'PureRatePlots'
    pure_rate_plot_dir.mkdir(exist_ok=True, parents=True)
    pure_rate_plots = {}
    for model in pure_score_plots:
        cdf_plot = rp.make_CDF(
            pure_score_plots[model]
        )
        rate_plot = rp.make_rate_plot(cdf_plot)
        pure_rate_plots[model] = rate_plot

    histo_name = f'{pure_rate_plot_dir}/pure_rate_plot.png'
    rp.draw_rate_plot(
        pure_rate_plots,
        histo_name
    )

    console.log('Rate Tables')
    cmssw_base = os.getenv('CMSSW_BASE')
    rate_table_location = Path(f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/RateTables')
    rate_table_location.mkdir(exist_ok=True)
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
            model,
        )
        rp.dump_complete_rate_tables(
            rate_plots[model],
            pure_rate_plots[model],
            model,
            str(rate_table_location)
        )
    rate_tables = {}
    for model in models:
        rate_table_file = f'{rate_table_location}/{model}_rates.json'
        rate_tables[model] = {}
        with open(rate_table_file) as theFile:
            rate_tables[model] = json.load(theFile)

    console.log('Rate vs NPV plot')
    chosen_rate = 5.0
    rate_vs_npv_graphs = {}
    for model in models:
        chosen_rate_threshold, _ = get_threshold_from_rate_table(
            rate_tables[model]['pure'],
            chosen_rate
        )
        chosen_rate_threshold = float(chosen_rate_threshold)
        rate_vs_npv_graphs[model] = get_NPV_Rate_Graph(
            model,
            open_files,
            chosen_rate_threshold,
        )

    rate_vs_npv_dir = output_dir/'PureRateVsNPV'
    rate_vs_npv_dir.mkdir(exist_ok=True, parents=True)
    histo_name = rate_vs_npv_dir/'pure_rate_vs_npv.png'
    rp.draw_rate_vs_variable_plot(
        rate_vs_npv_graphs,
        'npv',
        chosen_rate,
        str(histo_name),
    )

    console.log('Rate vs CICADA Average Plots')
    chosen_rate = 5.0
    rate_vs_cicada_average_graphs = {}
    for model in models:
        chosen_rate_threshold, _ = get_threshold_from_rate_table(
            rate_tables[model]['pure'],
            chosen_rate,
        )
        chosen_rate_threshold = float(chosen_rate_threshold)
        rate_vs_cicada_average_graphs[model] = get_CICADA_average_rate_graph(
            model,
            open_files,
            chosen_rate_threshold,
        )

    rate_vs_cicada_average_dir = output_dir/'PureRateVsCICADAAverage'
    rate_vs_cicada_average_dir.mkdir(exist_ok=True, parents=True)
    histo_name = rate_vs_cicada_average_dir/'pure_rate_vs_cicada_average.png'
    rp.draw_rate_vs_variable_plot(
        rate_vs_cicada_average_graphs,
        'CICADA Average Input',
        chosen_rate,
        str(histo_name),
    )
    
    for the_file in open_files:
        the_file.Close()
    console.log('Done!')
        

if __name__ == '__main__':
    main()
