#This may honestly be the worst thing I have ever written
#That still runs

import ROOT
import argparse
import os
from pathlib import Path
import numpy as np
from anomalyDetection.anomalyTriggerSkunkworks.utilities.decorators import quietROOTFunc

from rich.console import Console
from rich.table import Table

import argparse

console = Console()

data_paths = [
    '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024',
    '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024',
    '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024',
    '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024',
    '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024',
]

mc_paths = [
    '/hdfs/store/user/aloelige/GluGluHToGG_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_GluGluHToGG_Run3Winter24_10Jan2025/',
    '/hdfs/store/user/aloelige/GluGluHToTauTau_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_GluGluHToTauTau_Run3Winter24_10Jan2025/',
    '/hdfs/store/user/aloelige/HTo2LongLivedTo4b_MH-125_MFF-12_CTau-900mm_TuneCP5_13p6TeV_pythia8/CICADATraining2025_HTo2LongLivedTo4b_Run3Winter24_10Jan2025/',
]

def build_sample(list_of_paths, list_of_trees, test=False):
    list_of_chains = [
        ROOT.TChain(tree) for tree in list_of_trees
    ]
    nFiles = 0
    for path in list_of_paths:
        for root, dirs, files in os.walk(path):
            if test:
                files=files[:1]
            for fileName in files:
                theFile = f'{root}/{fileName}'
                nFiles += 1
                for chain in list_of_chains:
                    chain.Add(theFile)
    #console.print(f'nFiles: {nFiles}')
    primary_chain = list_of_chains[0]
    remainder = list_of_chains[1:]
    if remainder != []:
        for chain in remainder:
            primary_chain.AddFriend(chain)
    dataframe = ROOT.RDataFrame(primary_chain)
    return primary_chain, dataframe, nFiles

def build_all_samples(test=False):
    input_trees = ['l1EventTree/L1EventTree', 'CICADAInputNtuplizer/CICADAInputTree', 'l1UpgradeTree/L1UpgradeTree']
    data_input_trees = ['l1EventTree/L1EventTree', 'CICADAInputNtuplizer/CICADAInputTree', 'npvNtuplizer/NPVTree', 'l1UpgradeTree/L1UpgradeTree']
    console.log('Making samples...')
    data_chain, data_df, data_nFiles = build_sample(data_paths, data_input_trees, test=test)
    GluGluHToGG_chain, GluGluHToGG_df, GluGluHToGG_nFiles = build_sample(mc_paths[0:1], input_trees, test=test)
    GluGluHToTauTau_chain, GluGluHToTauTau_df, GluGluHToTauTau_nFiles = build_sample(mc_paths[1:2], input_trees, test=test)
    HTo2LongLivedTo4b_chain, HTo2LongLivedTo4b_df, HTo2LongLivedTo4b_nFiles = build_sample(mc_paths[2:3], input_trees, test=test)

    #console.print('Data')
    data_nEntries = data_df.Count().GetValue()
    #console.print('GluGluHToGG')
    GluGluHToGG_nEntries = GluGluHToGG_df.Count().GetValue()
    #console.print('GluGluHToTauTau')
    GluGluHToTauTau_nEntries = GluGluHToTauTau_df.Count().GetValue()
    #console.print('HTo2LongLivedTo4b')
    HTo2LongLivedTo4b_nEntries = HTo2LongLivedTo4b_df.Count().GetValue()

    entriesTable=Table(title="Entries")
    entriesTable.add_column('Sample')
    entriesTable.add_column('Entries', justify='right')
    entriesTable.add_column('nFiles', justify='right')
    entriesTable.add_row('Data', f'{data_nEntries}', f'{data_nFiles}')
    entriesTable.add_row('GluGluHToGG', f'{GluGluHToGG_nEntries}', f'{GluGluHToGG_nFiles}')
    entriesTable.add_row('GluGluHToTauTau', f'{GluGluHToTauTau_nEntries}', f'{GluGluHToTauTau_nFiles}')
    entriesTable.add_row('HTo2LongLivedTo4b', f'{HTo2LongLivedTo4b_nEntries}', f'{HTo2LongLivedTo4b_nFiles}')

    console.print(entriesTable)

    console.log('Defining quantities')
    data_df = define_quantities(filter_bad_runs(data_df))
    GluGluHToGG_df = define_aliases(define_quantities(GluGluHToGG_df))
    GluGluHToTauTau_df = define_aliases(define_quantities(GluGluHToTauTau_df))
    HTo2LongLivedTo4b_df = define_aliases(define_quantities(HTo2LongLivedTo4b_df))

    return [
        (data_chain, data_df, data_nFiles),
        (GluGluHToGG_chain, GluGluHToGG_df, GluGluHToGG_nFiles),
        (GluGluHToTauTau_chain, GluGluHToTauTau_df, GluGluHToTauTau_nFiles),
        (HTo2LongLivedTo4b_chain, HTo2LongLivedTo4b_df, HTo2LongLivedTo4b_nFiles),
    ]

def define_quantities(df):
    cicadaInputSumFunction = """
    int sum = 0;
    try {
       for(int i = 0; i < 18; ++i) {
          for(int j = 0; j < 14; ++j) {
             //sum += modelInput[i*14+j];
             sum += modelInput.at(i*14 + j);
          }
       }
       return sum;
    }
    catch (const std::runtime_error& e) {
       return -999;
    }
    """

    df = df.Define("cicadaInputSum", cicadaInputSumFunction)

    central_HT_mask = "sumBx == 0 && sumType == 1"
    df = df.Define("central_HT_mask", central_HT_mask)
    df = df.Define("HT_masked_vector", 'sumEt[central_HT_mask]')
    df = df.Define("HT", "HT_masked_vector.at(0)")

    central_ET_mask = 'sumBx == 0 && sumType == 0'
    df = df.Define("central_ET_mask", central_ET_mask)
    df = df.Define("ET_masked_vector", 'sumEt[central_ET_mask]')
    df = df.Define("ET", "ET_masked_vector.at(0)")

    return df

def define_aliases(df):
    df = df.Alias('npv', 'nPV')
    return df

def filter_bad_runs(df):
    bad_runs = [
        379442,
        379456,
        379530,
        379660,
        380074,
        380310,
        380360,
        380649,
        381115,
        381151,
        381380,
        383814,
        383966,
        384188,
        386071,
        376554,
    ]

    filter_string = ''
    for index, run in enumerate(bad_runs):
        if index == len(bad_runs)-1:
            filter_string += f'run != {run}'
        else:
            filter_string += f'run != {run} &&'
    df = df.Filter(filter_string)
    return df

def make_cicada_2d_input_plot_booking(df, name):
    return df.Histo2D((f'{name}_2d', f'{name}_2d', 14, 0.0, 14.0, 18, 0.0, 18.0), 'iEta', 'iPhi', 'modelInput')

def make_cicada_input_plot_booking(df, name):
    return df.Histo1D((f'{name}_inputs', f'{name}_inputs', 20, 0.0, 20.0), 'modelInput')

def make_cicada_input_sum_plot_booking(df, name):
    return df.Histo1D((f'{name}_inputSum', f'{name}_inputSum', 20, 0.0, 1500.0), 'cicadaInputSum')

def draw_cicada_2d_input_plot(plot_booking, name):
    histoName = f'{name}_2D_Input_Plot'
    outputPath = Path('ValidationPlots/2DInputPlots/')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas(name)

    theCanvas.SetRightMargin(0.15)
    
    plot_booking.Draw('COLZ')
    plot_booking.GetXaxis().SetTitle('iEta')
    plot_booking.GetYaxis().SetTitle('iPhi')

    plot_booking.SetTitle('')

    plot_booking.Scale(1.0 / plot_booking.Integral())

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath / f'{histoName}.png')
    )

def get_max_histogram_value(list_of_histograms):
    max_val = None
    for hist in list_of_histograms:
        if max_val is None:
            max_val = hist.GetMaximum()
        else:
            hist_max = hist.GetMaximum()
            if hist_max > max_val:
                max_val = hist_max
    return max_val
    
def draw_cicada_input_plot(
        data_booking,
        filtered_data_booking,
        GluGluHToGG_booking,
        GluGluHToTauTau_booking,
        HTo2LongLivedTo4b_booking,
): 
    histoName = 'CICADA_Input_Plot'
    outputPath = Path('ValidationPlots/CICADAInputPlot/')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas('CICADA_Input')

    data_booking = data_booking.GetValue()
    filtered_data_booking = filtered_data_booking.GetValue()
    GluGluHToGG_booking = GluGluHToGG_booking.GetValue()
    GluGluHToTauTau_booking = GluGluHToTauTau_booking.GetValue()
    HTo2LongLivedTo4b_booking = HTo2LongLivedTo4b_booking.GetValue()
    
    data_booking.Draw('HIST')
    filtered_data_booking.Draw("HIST SAME")
    GluGluHToGG_booking.Draw('HIST SAME')
    GluGluHToTauTau_booking.Draw('HIST SAME')
    HTo2LongLivedTo4b_booking.Draw('HIST SAME')

    for hist in [data_booking, filtered_data_booking, GluGluHToGG_booking, GluGluHToTauTau_booking, HTo2LongLivedTo4b_booking]:
        hist.Scale(1.0/hist.Integral())

    data_booking.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([data_booking, filtered_data_booking, GluGluHToGG_booking, GluGluHToTauTau_booking, HTo2LongLivedTo4b_booking])
    )

    data_booking.SetTitle('')
    data_booking.GetXaxis().SetTitle("Region ET")
    data_booking.GetYaxis().SetTitle('A.U.')
    data_booking.SetLineColor(ROOT.kBlack)
    data_booking.SetLineWidth(2)

    filtered_data_booking.SetLineColor(
        ROOT.TColor.GetColor('#f89c20')
    )
    filtered_data_booking.SetLineWidth(2)
    
    GluGluHToGG_booking.SetLineColor(
        ROOT.TColor.GetColor('#7a21dd')
    )
    GluGluHToGG_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#7a21dd'),
        0.3,
    )
    #GluGluHToGG_booking.SetLineWidth(2)
    
    GluGluHToTauTau_booking.SetLineColor(
        ROOT.TColor.GetColor('#964a8b')
    )
    GluGluHToTauTau_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#964a8b'),
        0.3,
    )
    #GluGluHToTauTau_booking.SetLineWidth(2)
    
    HTo2LongLivedTo4b_booking.SetLineColor(
        ROOT.TColor.GetColor('#e42536')
    )
    HTo2LongLivedTo4b_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#e42536'),
        0.3
    )
    #HTo2LongLivedTo4b_booking.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(data_booking, 'Data', 'l')
    theLegend.AddEntry(filtered_data_booking, 'Data, NPV > 1', 'l')
    theLegend.AddEntry(GluGluHToGG_booking, 'GluGluHToGG', 'lf')
    theLegend.AddEntry(GluGluHToTauTau_booking, 'GluGluHToTauTau', 'lf')
    theLegend.AddEntry(HTo2LongLivedTo4b_booking, 'HTo2LongLivedto4b', 'lf')
    theLegend.Draw()

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )

def draw_cicada_input_sum_plot(
        data_booking,
        filtered_data_booking,
        GluGluHToGG_booking,
        GluGluHToTauTau_booking,
        HTo2LongLivedTo4b_booking,
):
    histoName = 'CICADA_Input_Sum'
    outputPath = Path('ValidationPlots/CICADAInputSumPlot')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas('CICADA_Input_Sum')

    data_booking = data_booking.GetValue()
    filtered_data_booking = filtered_data_booking.GetValue()
    GluGluHToGG_booking = GluGluHToGG_booking.GetValue()
    GluGluHToTauTau_booking = GluGluHToTauTau_booking.GetValue()
    HTo2LongLivedTo4b_booking = HTo2LongLivedTo4b_booking.GetValue()

    data_booking.Draw("HIST")
    filtered_data_booking.Draw("HIST SAME")
    GluGluHToGG_booking.Draw("HIST SAME")
    GluGluHToTauTau_booking.Draw("HIST SAME")
    HTo2LongLivedTo4b_booking.Draw("HIST SAME")

    for hist in [data_booking, filtered_data_booking, GluGluHToGG_booking, GluGluHToTauTau_booking, HTo2LongLivedTo4b_booking]:
        hist.Scale(1.0/hist.Integral())

    data_booking.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([data_booking, filtered_data_booking, GluGluHToGG_booking, GluGluHToTauTau_booking, HTo2LongLivedTo4b_booking])
    )

    data_booking.SetTitle('')
    data_booking.GetXaxis().SetTitle('CICADA Input Sum')
    data_booking.GetYaxis().SetTitle('A.U.')
    data_booking.SetLineColor(ROOT.kBlack)
    data_booking.SetLineWidth(2)

    filtered_data_booking.SetLineColor(
        ROOT.TColor.GetColor('#f89c20')
    )
    filtered_data_booking.SetLineWidth(2)
    
    GluGluHToGG_booking.SetLineColor(
        ROOT.TColor.GetColor('#7a21dd')
    )
    GluGluHToGG_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#7a21dd'),
        0.3,
    )
    #GluGluHToGG_booking.SetLineWidth(2)
    
    GluGluHToTauTau_booking.SetLineColor(
        ROOT.TColor.GetColor('#964a8b')
    )
    GluGluHToTauTau_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#964a8b'),
        0.3,
    )
    #GluGluHToTauTau_booking.SetLineWidth(2)
    
    HTo2LongLivedTo4b_booking.SetLineColor(
        ROOT.TColor.GetColor('#e42536'),
    )
    HTo2LongLivedTo4b_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#e42536'),
        0.3
    )
    #HTo2LongLivedTo4b_booking.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(data_booking, 'Data', 'l')
    theLegend.AddEntry(filtered_data_booking, 'Data, NPV > 1', 'l')
    theLegend.AddEntry(GluGluHToGG_booking, 'GluGluHToGG', 'lf')
    theLegend.AddEntry(GluGluHToTauTau_booking, 'GluGluHToTauTau', 'lf')
    theLegend.AddEntry(HTo2LongLivedTo4b_booking, 'HTo2LongLivedto4b', 'lf')

    theLegend.Draw()
    
    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )

def draw_data_only_cicada_input_plot(
        run_c_plot,
        run_d_plot,
        run_e_plot,
        run_g_plot,
        run_h_plot,
        outputDir='DataOnlyCICADAInputPlot'
):
    histoName = 'CICADA_Input_Plot_Data_Only'
    outputPath = Path(f'ValidationPlots/{outputDir}/')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas(histoName)

    run_c_plot = run_c_plot.GetValue()
    run_d_plot = run_d_plot.GetValue()
    run_e_plot = run_e_plot.GetValue()
    run_g_plot = run_g_plot.GetValue()
    run_h_plot = run_h_plot.GetValue()

    run_c_plot.Draw("HIST")
    run_d_plot.Draw("HIST SAME")
    run_e_plot.Draw("HIST SAME")
    run_g_plot.Draw("HIST SAME")
    run_h_plot.Draw("HIST SAME")

    for hist in [run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot]:
        hist.Scale(1.0/hist.Integral())

    run_c_plot.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot])
    )

    run_c_plot.SetTitle('')
    run_c_plot.GetXaxis().SetTitle("CICADA Inputs")
    run_c_plot.GetYaxis().SetTitle("A.U.")
    run_c_plot.SetLineColor(ROOT.TColor.GetColor('#7a21dd'))
    run_c_plot.SetLineWidth(2)

    run_d_plot.SetLineColor(ROOT.TColor.GetColor('#9c9ca1'))
    run_d_plot.SetLineWidth(2)

    run_e_plot.SetLineColor(ROOT.TColor.GetColor('#964a8b'))
    run_e_plot.SetLineWidth(2)

    run_g_plot.SetLineColor(ROOT.TColor.GetColor('#e42536'))
    run_g_plot.SetLineWidth(2)

    run_h_plot.SetLineColor(ROOT.TColor.GetColor('#f89c20'))
    run_h_plot.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(run_c_plot, 'Run C', 'l')
    theLegend.AddEntry(run_d_plot, 'Run D', 'l')
    theLegend.AddEntry(run_e_plot, 'Run E', 'l')
    theLegend.AddEntry(run_g_plot, 'Run G', 'l')
    theLegend.AddEntry(run_h_plot, 'Run H', 'l')

    theLegend.Draw()

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )

def draw_data_only_cicada_input_sum_plot(
        run_c_plot,
        run_d_plot,
        run_e_plot,
        run_g_plot,
        run_h_plot,
        outputDir='DataOnlyCICADAInputPlot'
):
    histoName = 'CICADA_Input_Sum_Plot_Data_Only'
    outputPath = Path(f'ValidationPlots/{outputDir}/')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas(histoName)

    run_c_plot = run_c_plot.GetValue()
    run_d_plot = run_d_plot.GetValue()
    run_e_plot = run_e_plot.GetValue()
    run_g_plot = run_g_plot.GetValue()
    run_h_plot = run_h_plot.GetValue()

    run_c_plot.Draw("HIST")
    run_d_plot.Draw("HIST SAME")
    run_e_plot.Draw("HIST SAME")
    run_g_plot.Draw("HIST SAME")
    run_h_plot.Draw("HIST SAME")

    for hist in [run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot]:
        hist.Scale(1.0/hist.Integral())

    run_c_plot.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot])
    )

    run_c_plot.SetTitle('')
    run_c_plot.GetXaxis().SetTitle("CICADA Input Sum")
    run_c_plot.GetYaxis().SetTitle("A.U.")
    run_c_plot.SetLineColor(ROOT.TColor.GetColor('#7a21dd'))
    run_c_plot.SetLineWidth(2)

    run_d_plot.SetLineColor(ROOT.TColor.GetColor('#9c9ca1'))
    run_d_plot.SetLineWidth(2)

    run_e_plot.SetLineColor(ROOT.TColor.GetColor('#964a8b'))
    run_e_plot.SetLineWidth(2)

    run_g_plot.SetLineColor(ROOT.TColor.GetColor('#e42536'))
    run_g_plot.SetLineWidth(2)

    run_h_plot.SetLineColor(ROOT.TColor.GetColor('#f89c20'))
    run_h_plot.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(run_c_plot, 'Run C', 'l')
    theLegend.AddEntry(run_d_plot, 'Run D', 'l')
    theLegend.AddEntry(run_e_plot, 'Run E', 'l')
    theLegend.AddEntry(run_g_plot, 'Run G', 'l')
    theLegend.AddEntry(run_h_plot, 'Run H', 'l')

    theLegend.Draw()

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )

def makeInputPlots(test=False):
    samples = build_all_samples(test=test)
    data_df = samples[0][1]
    GluGluHToGG_df = samples[1][1]
    GluGluHToTauTau_df = samples[2][1]
    HTo2LongLivedTo4b_df = samples[3][1]

    filtered_data_df = data_df.Filter('npv > 1')
    # Okay. What plots do we want?
    # 1. Normalized CICADA Input plots
    # 2. CICADA Input Plots
    # 3. Eta Based Cicada Input plots <- too many plots to be practical
    # 4. Input Sum Plot

    #Normalized CICADA Plots
    console.log('Making 2D CICADA input plot bookings')
    data_2d_booking = make_cicada_2d_input_plot_booking(data_df, 'data')
    GluGluHToGG_2d_booking = make_cicada_2d_input_plot_booking(GluGluHToGG_df, 'GluGluHtoGG')
    GluGluHToTauTau_2d_booking = make_cicada_2d_input_plot_booking(GluGluHToTauTau_df, 'GluGluHToTauTau')
    HTo2LongLivedTo4b_2d_booking = make_cicada_2d_input_plot_booking(HTo2LongLivedTo4b_df, 'HTo2LongLivedTo4b')

    # 1D Inputs Bookings
    data_1d_booking = make_cicada_input_plot_booking(data_df, 'data')
    data_filtered_1d_booking = make_cicada_input_plot_booking(data_df, 'data_filtered')
    GluGluHToGG_1d_booking = make_cicada_input_plot_booking(GluGluHToGG_df, 'GluGluHToGG')
    GluGluHToTauTau_1d_booking = make_cicada_input_plot_booking(GluGluHToTauTau_df, 'GluGluHToTauTau')
    HTo2LongLivedTo4b_1d_booking = make_cicada_input_plot_booking(GluGluHToGG_df, 'HTo2LongLivedTo4b')

    data_sum_booking = make_cicada_input_sum_plot_booking(data_df, 'data')
    data_filtered_sum_booking = make_cicada_input_sum_plot_booking(filtered_data_df, 'data_filtered')
    GluGluHToGG_sum_booking = make_cicada_input_sum_plot_booking(GluGluHToGG_df, 'GluGluHToGG')
    GluGluHToTauTau_sum_booking = make_cicada_input_sum_plot_booking(GluGluHToTauTau_df, 'GluGluHToTauTau')
    HTo2LongLivedTo4b_sum_booking = make_cicada_input_sum_plot_booking(HTo2LongLivedTo4b_df, 'HTo2LongLivedTo4b')
    
    with console.status("Making 2D CICADA Input Plot"):
        draw_cicada_2d_input_plot(data_2d_booking, 'Data')
        draw_cicada_2d_input_plot(GluGluHToGG_2d_booking, 'GluGluHToGG')
        draw_cicada_2d_input_plot(GluGluHToTauTau_2d_booking, 'GluGluHToTauTau')
        draw_cicada_2d_input_plot(HTo2LongLivedTo4b_2d_booking, 'HToLongLivedTo4b')
    console.log('[green]DONE:[/green] Making 2D Input Plots')

    with console.status("Making CICADA Inputs Plot"):
        draw_cicada_input_plot(
            data_1d_booking,
            data_filtered_1d_booking,
            GluGluHToGG_1d_booking,
            GluGluHToTauTau_1d_booking,
            HTo2LongLivedTo4b_1d_booking,
        )
    console.log('[green]DONE:[/green] Making CICADA Inputs Plot')

    with console.status('Making CICADA Input Sum Plot'):
        draw_cicada_input_sum_plot(
            data_sum_booking,
            data_filtered_sum_booking,
            GluGluHToGG_sum_booking,
            GluGluHToTauTau_sum_booking,
            HTo2LongLivedTo4b_sum_booking,
        )
    console.log('[green]DONE:[/green] Making CICADA Input Sum Plot')

def make_npv_booking(df, name):
    return df.Histo1D((f'{name}_npv', f'{name}_npv', 50, 0, 100.0), 'npv')

def make_filtered_npv_booking(df, name):
    return df.Filter('npv > 1').Histo1D((f'{name}_filtered_npv', f'{name}_filtered_npv', 50, 0, 100.0), 'npv')
    
def draw_npv_plot(
        data_booking,
        GluGluHToGG_booking,
        GluGluHToTauTau_booking,
        HTo2LongLivedTo4b_booking,
        name
):
    histoName = f'npv_{name}'
    outputPath = Path('ValidationPlots/NPVPlots')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas(histoName)

    data_booking = data_booking.GetValue()
    GluGluHToGG_booking = GluGluHToGG_booking.GetValue()
    GluGluHToTauTau_booking = GluGluHToTauTau_booking.GetValue()
    HTo2LongLivedTo4b_booking = HTo2LongLivedTo4b_booking.GetValue()

    data_booking.Draw("HIST")
    GluGluHToGG_booking.Draw("HIST SAME")
    GluGluHToTauTau_booking.Draw("HIST SAME")
    HTo2LongLivedTo4b_booking.Draw("HIST SAME")

    for hist in [data_booking, GluGluHToGG_booking, GluGluHToTauTau_booking, HTo2LongLivedTo4b_booking]:
        hist.Scale(1.0/hist.Integral())

    data_booking.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([data_booking, GluGluHToGG_booking, GluGluHToTauTau_booking, HTo2LongLivedTo4b_booking])
    )

    data_booking.SetTitle('')
    data_booking.GetXaxis().SetTitle('nPV')
    data_booking.GetYaxis().SetTitle('A.U.')
    data_booking.SetLineColor(ROOT.kBlack)
    data_booking.SetLineWidth(2)

    GluGluHToGG_booking.SetLineColor(
        ROOT.TColor.GetColor('#7a21dd')
    )
    GluGluHToGG_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#7a21dd'),
        0.3,
    )
    #GluGluHToGG_booking.SetLineWidth(2)
    
    GluGluHToTauTau_booking.SetLineColor(
        ROOT.TColor.GetColor('#964a8b')
    )
    GluGluHToTauTau_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#964a8b'),
        0.3,
    )
    #GluGluHToTauTau_booking.SetLineWidth(2)
    
    HTo2LongLivedTo4b_booking.SetLineColor(
        ROOT.TColor.GetColor('#e42536')
    )
    HTo2LongLivedTo4b_booking.SetFillColorAlpha(
        ROOT.TColor.GetColor('#e42536'),
        0.3
    )
    #HTo2LongLivedTo4b_booking.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(data_booking, 'Data', 'l')
    theLegend.AddEntry(GluGluHToGG_booking, 'GluGluHToGG', 'lf')
    theLegend.AddEntry(GluGluHToTauTau_booking, 'GluGluHToTauTau', 'lf')
    theLegend.AddEntry(HTo2LongLivedTo4b_booking, 'HTo2LongLivedto4b', 'lf')
    theLegend.Draw()

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )

def makeNPVPlots(test=False):
    samples = build_all_samples(test=test)
    data_df = samples[0][1]
    GluGluHToGG_df = samples[1][1]
    GluGluHToTauTau_df = samples[2][1]
    HTo2LongLivedTo4b_df = samples[3][1]

    console.log('Making NPV Plot Bookings')

    #What plots do we want here?
    # 1. NPV Plots
    # 2. NPV excluding 1 plots
    
    data_booking = make_npv_booking(data_df, 'data')
    GluGluHToGG_booking = make_npv_booking(GluGluHToGG_df, 'GluGluHToGG')
    GluGluHToTauTau_booking = make_npv_booking(GluGluHToTauTau_df, 'GluGluHToTauTau')
    HTo2LongLivedTo4b_booking = make_npv_booking(HTo2LongLivedTo4b_df, 'HTo2LongLivedTo4b')

    data_filtered_booking = make_filtered_npv_booking(data_df, 'data')
    GluGluHToGG_filtered_booking = make_filtered_npv_booking(GluGluHToGG_df, 'GluGluHToGG')
    GluGluHToTauTau_filtered_booking = make_filtered_npv_booking(GluGluHToTauTau_df, 'GluGluHToTauTau')
    HTo2LongLivedTo4b_filtered_booking = make_filtered_npv_booking(HTo2LongLivedTo4b_df, 'HTo2LongLivedTo4b')

    with console.status("Making NPV Plots"):
        draw_npv_plot(
            data_booking,
            GluGluHToGG_booking,
            GluGluHToTauTau_booking,
            HTo2LongLivedTo4b_booking,
            "all",
        )
    console.log('[green]DONE:[/green] NPV Plots')

    with console.status('NPV >1 Plots'):
        draw_npv_plot(
            data_filtered_booking,
            GluGluHToGG_filtered_booking,
            GluGluHToTauTau_filtered_booking,
            HTo2LongLivedTo4b_filtered_booking,
            "filtered",
        )
    console.log('[green]DONE:[/green] NPV >1 Plots')

def make_variable_booking(df, sample, variable, settings):
    return df.Histo1D(
        (f'{sample}_{variable}', f'{sample}_{variable}', settings[0], settings[1], settings[2]),
        variable
    )
    
def draw_variable_booking(bookings, variable):
    histoName= f'{variable}_plot'
    outputPath = Path('ValidationPlots/ObjectPlots')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas(histoName)

    data_plot = bookings[variable]['data'].GetValue()
    filtered_data_plot = bookings[variable]['filtered_data'].GetValue()
    GluGluHToGG_plot = bookings[variable]['GluGluHToGG'].GetValue()
    GluGluHToTauTau_plot = bookings[variable]['GluGluHToTauTau'].GetValue()
    HTo2LongLivedTo4b_plot = bookings[variable]['HTo2LongLivedTo4b'].GetValue()

    data_plot.Draw("HIST")
    filtered_data_plot.Draw("HIST SAME")
    GluGluHToGG_plot.Draw("HIST SAME")
    GluGluHToTauTau_plot.Draw("HIST SAME")
    HTo2LongLivedTo4b_plot.Draw("HIST SAME")

    for hist in [data_plot, filtered_data_plot, GluGluHToGG_plot, GluGluHToTauTau_plot, HTo2LongLivedTo4b_plot]:
        hist.Scale(1.0/hist.Integral())

    data_plot.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([data_plot, filtered_data_plot, GluGluHToGG_plot, GluGluHToTauTau_plot, HTo2LongLivedTo4b_plot])
    )

    data_plot.GetXaxis().SetTitle('')
    data_plot.GetYaxis().SetTitle('A.U.')
    data_plot.SetLineColor(ROOT.kBlack)
    data_plot.SetLineWidth(2)

    filtered_data_plot.SetLineColor(
        ROOT.TColor.GetColor('#f89c20')
    )
    filtered_data_plot.SetLineWidth(2)
    
    GluGluHToGG_plot.SetLineColor(
        ROOT.TColor.GetColor('#7a21dd')
    )
    GluGluHToGG_plot.SetFillColorAlpha(
        ROOT.TColor.GetColor('#7a21dd'),
        0.3,
    )
    #GluGluHToGG_plot.SetLineWidth(2)
    
    GluGluHToTauTau_plot.SetLineColor(
        ROOT.TColor.GetColor('#964a8b')
    )
    GluGluHToTauTau_plot.SetFillColorAlpha(
        ROOT.TColor.GetColor('#964a8b'),
        0.3,
    )
    #GluGluHToTauTau_plot.SetLineWidth(2)
    
    HTo2LongLivedTo4b_plot.SetLineColor(
        ROOT.TColor.GetColor('#e42536')
    )
    HTo2LongLivedTo4b_plot.SetFillColorAlpha(
        ROOT.TColor.GetColor('#e42536'),
        0.3
    )
    #HTo2LongLivedTo4b_plot.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(data_plot, 'Data', 'l')
    theLegend.AddEntry(filtered_data_plot, 'Data, NPV > 1', 'l')
    theLegend.AddEntry(GluGluHToGG_plot, 'GluGluHToGG', 'lf')
    theLegend.AddEntry(GluGluHToTauTau_plot, 'GluGluHToTauTau', 'lf')
    theLegend.AddEntry(HTo2LongLivedTo4b_plot, 'HTo2LongLivedto4b', 'lf')
    theLegend.Draw()

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )
    
def makeObjectPlots(test=False):
    samples = build_all_samples(test=test)

    data_df = samples[0][1]
    data_chain = samples[0][0]
    
    GluGluHToGG_df = samples[1][1]
    GluGluHToGG_chain = samples[1][0]
    
    GluGluHToTauTau_df = samples[2][1]
    GluGluHToTauTau_chain = samples[2][0]
    
    HTo2LongLivedTo4b_df = samples[3][1]
    HTo2LongLivedTo4b_chain = samples[3][0]

    filtered_data_df = data_df.Filter('npv > 1')

    console.log("Making object plot bookings")

    plot_settings = {
        'ET': (20, 0.0, 1500.0),
        'HT': (20, 0.0, 500.0),
        'nEGs': (20, 0.0, 20.0),
        'nTaus': (20, 0.0, 20.0),
        'nJets': (20, 0.0, 20.0),
        'egEt': (20, 0.0, 100.0),
        'tauEt': (20, 0.0, 100.0),
        'jetEt': (20, 0.0, 200.0),
    }
    samples = ['data', 'filtered_data', 'GluGluHToGG', 'GluGluHToTauTau', 'HTo2LongLivedTo4b']
    dataframes = [
        data_df,
        filtered_data_df,
        GluGluHToGG_df,
        GluGluHToTauTau_df,
        HTo2LongLivedTo4b_df,
    ]

    #data_df.Describe().Print()

    #exit(0)
    
    plot_bookings = {}
    for variable in plot_settings:
        plot_bookings[variable] = {}
        for df, sample in zip(dataframes, samples):
            plot_bookings[variable][sample] = make_variable_booking(
                df,
                sample,
                variable,
                plot_settings[variable],
            )
    console.log("Drawing object plots")
    for variable in plot_bookings:
        console.log(f'Variable Draw: {variable}')
        draw_variable_booking(
            plot_bookings,
            variable,
        )

def draw_data_only_variable_booking(bookings, variable, outputDir='DataOnlyObjectPlots'):
    histoName = f'{variable}_data_only_plot'
    outputPath = Path(f'ValidationPlots/{outputDir}')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas(histoName)

    run_c_plot = bookings[variable]['RunC'].GetValue()
    run_d_plot = bookings[variable]['RunD'].GetValue()
    run_e_plot = bookings[variable]['RunE'].GetValue()
    run_g_plot = bookings[variable]['RunG'].GetValue()
    run_h_plot = bookings[variable]['RunH'].GetValue()

    run_c_plot.Draw("HIST")
    run_d_plot.Draw('HIST SAME')
    run_e_plot.Draw('HIST SAME')
    run_g_plot.Draw('HIST SAME')
    run_h_plot.Draw('HIST SAME')

    for hist in [run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot]:
        hist.Scale(1.0/hist.Integral())

    run_c_plot.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot])
    )

    run_c_plot.SetTitle('')
    run_c_plot.GetXaxis().SetTitle(variable)
    run_c_plot.GetYaxis().SetTitle("A.U.")
    run_c_plot.SetLineColor(ROOT.TColor.GetColor('#7a21dd'))
    run_c_plot.SetLineWidth(2)

    run_d_plot.SetLineColor(ROOT.TColor.GetColor('#9c9ca1'))
    run_d_plot.SetLineWidth(2)

    run_e_plot.SetLineColor(ROOT.TColor.GetColor('#964a8b'))
    run_e_plot.SetLineWidth(2)

    run_g_plot.SetLineColor(ROOT.TColor.GetColor('#e42536'))
    run_g_plot.SetLineWidth(2)

    run_h_plot.SetLineColor(ROOT.TColor.GetColor('#f89c20'))
    run_h_plot.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(run_c_plot, 'Run C', 'l')
    theLegend.AddEntry(run_d_plot, 'Run D', 'l')
    theLegend.AddEntry(run_e_plot, 'Run E', 'l')
    theLegend.AddEntry(run_g_plot, 'Run G', 'l')
    theLegend.AddEntry(run_h_plot, 'Run H', 'l')

    theLegend.Draw()

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )

def draw_data_only_npv_plot(
        run_c_plot,
        run_d_plot,
        run_e_plot,
        run_g_plot,
        run_h_plot,
        outputDir='DataOnlyNPVPlots',
):
    histoName = 'NPV_plot'
    outputPath = Path(f'ValidationPlots/{outputDir}/')
    outputPath.mkdir(parents=True, exist_ok=True)

    theCanvas = ROOT.TCanvas(histoName)

    run_c_plot = run_c_plot.GetValue()
    run_d_plot = run_d_plot.GetValue()
    run_e_plot = run_e_plot.GetValue()
    run_g_plot = run_g_plot.GetValue()
    run_h_plot = run_h_plot.GetValue()

    run_c_plot.Draw("HIST")
    run_d_plot.Draw("HIST SAME")
    run_e_plot.Draw("HIST SAME")
    run_g_plot.Draw("HIST SAME")
    run_h_plot.Draw("HIST SAME")

    for hist in [run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot]:
        hist.Scale(1.0/hist.Integral())

    run_c_plot.GetYaxis().SetRangeUser(
        0.0,
        1.2 * get_max_histogram_value([run_c_plot, run_d_plot, run_e_plot, run_g_plot, run_h_plot])
    )

    run_c_plot.SetTitle('')
    run_c_plot.GetXaxis().SetTitle("NPV")
    run_c_plot.GetYaxis().SetTitle("A.U.")
    run_c_plot.SetLineColor(ROOT.TColor.GetColor('#7a21dd'))
    run_c_plot.SetLineWidth(2)

    run_d_plot.SetLineColor(ROOT.TColor.GetColor('#9c9ca1'))
    run_d_plot.SetLineWidth(2)

    run_e_plot.SetLineColor(ROOT.TColor.GetColor('#964a8b'))
    run_e_plot.SetLineWidth(2)

    run_g_plot.SetLineColor(ROOT.TColor.GetColor('#e42536'))
    run_g_plot.SetLineWidth(2)

    run_h_plot.SetLineColor(ROOT.TColor.GetColor('#f89c20'))
    run_h_plot.SetLineWidth(2)

    theLegend=ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(run_c_plot, 'Run C', 'l')
    theLegend.AddEntry(run_d_plot, 'Run D', 'l')
    theLegend.AddEntry(run_e_plot, 'Run E', 'l')
    theLegend.AddEntry(run_g_plot, 'Run G', 'l')
    theLegend.AddEntry(run_h_plot, 'Run H', 'l')

    theLegend.Draw()

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/f'{histoName}.png')
    )  
    
def makeDataOnlyPlots(test=False):
    console.log("Data Only Plots")
    data_input_trees = ['l1EventTree/L1EventTree', 'CICADAInputNtuplizer/CICADAInputTree', 'npvNtuplizer/NPVTree', 'l1UpgradeTree/L1UpgradeTree']
    console.log('Making Sample: Run C')
    run_c_chain, run_c_df, run_c_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024'], data_input_trees, test=test)
    run_c_df = define_quantities(run_c_df)
    console.log(f'nFiles: {run_c_n_files}')
    
    console.log('Making Sample: Run D')
    run_d_chain, run_d_df, run_d_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024'], data_input_trees, test=test)
    run_d_df = define_quantities(run_d_df)
    console.log(f'nFiles: {run_d_n_files}')
    
    console.log('Making Sample: Run E')
    run_e_chain, run_e_df, run_e_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024'], data_input_trees, test=test)
    run_e_df = define_quantities(run_e_df)
    console.log(f'nFiles: {run_e_n_files}')

    console.log('Making Sample: Run G')
    run_g_chain, run_g_df, run_g_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024'], data_input_trees, test=test)
    run_g_df = define_quantities(run_g_df)
    console.log(f'nFiles: {run_g_n_files}')

    console.log('Making Sample: Run H')
    run_h_chain, run_h_df, run_h_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024'], data_input_trees, test=test)
    run_h_df = define_quantities(run_h_df)
    console.log(f'nFiles: {run_h_n_files}')

    run_c_inputs_booking = make_cicada_input_plot_booking(run_c_df, 'RunC')
    run_d_inputs_booking = make_cicada_input_plot_booking(run_d_df, 'RunD')
    run_e_inputs_booking = make_cicada_input_plot_booking(run_e_df, 'RunE')
    run_g_inputs_booking = make_cicada_input_plot_booking(run_g_df, 'RunG')
    run_h_inputs_booking = make_cicada_input_plot_booking(run_h_df, 'RunH')

    run_c_sum_booking = make_cicada_input_sum_plot_booking(run_c_df, 'RunC')
    run_d_sum_booking = make_cicada_input_sum_plot_booking(run_d_df, 'RunD')
    run_e_sum_booking = make_cicada_input_sum_plot_booking(run_e_df, 'RunE')
    run_g_sum_booking = make_cicada_input_sum_plot_booking(run_g_df, 'RunG')
    run_h_sum_booking = make_cicada_input_sum_plot_booking(run_h_df, 'RunH')

    run_c_npv_booking = make_npv_booking(run_c_df, 'RunC')
    run_d_npv_booking = make_npv_booking(run_d_df, 'RunD')
    run_e_npv_booking = make_npv_booking(run_e_df, 'RunE')
    run_g_npv_booking = make_npv_booking(run_g_df, 'RunG')
    run_h_npv_booking = make_npv_booking(run_h_df, 'RunH')

    plot_settings = {
        'ET': (20, 0.0, 1500.0),
        'HT': (20, 0.0, 500.0),
        'nEGs': (20, 0.0, 20.0),
        'nTaus': (20, 0.0, 20.0),
        'nJets': (20, 0.0, 20.0),
        'egEt': (20, 0.0, 100.0),
        'tauEt': (20, 0.0, 100.0),
        'jetEt': (20, 0.0, 200.0),
    }
    samples = ['RunC', 'RunD', 'RunE', 'RunG', 'RunH']
    dataframes = [run_c_df, run_d_df, run_e_df, run_g_df, run_h_df]

    plot_bookings = {}
    for variable in plot_settings:
        plot_bookings[variable] = {}
        for df, sample in zip(dataframes, samples):
            plot_bookings[variable][sample] = make_variable_booking(
                df,
                sample,
                variable,
                plot_settings[variable],
            )

    #Draw data only input plots
    console.log("Drawing Data Only Inputs Plot")
    draw_data_only_cicada_input_plot(
        run_c_inputs_booking,
        run_d_inputs_booking,
        run_e_inputs_booking,
        run_g_inputs_booking,
        run_h_inputs_booking,
    )
    console.log('[green]DONE:[/green] Data Only Inputs Plot')

    console.log("Drawing Data Only Inputs Sum Plot")
    draw_data_only_cicada_input_sum_plot(
        run_c_sum_booking,
        run_d_sum_booking,
        run_e_sum_booking,
        run_g_sum_booking,
        run_h_sum_booking,
    )
    console.log("[green]DONE:[/green] Data Only Inputs Sum Plot")

    console.log('Drawing Data Only NPV Plot')
    draw_data_only_npv_plot(
        run_c_npv_booking,
        run_d_npv_booking,
        run_e_npv_booking,
        run_g_npv_booking,
        run_h_npv_booking,
    )
    console.log("[green]DONE:[/green] Data Only NPV Plot")

    for variable in plot_bookings:
        console.log(f'Variable Draw: {variable}')
        draw_data_only_variable_booking(
            plot_bookings,
            variable,
        )
    console.log("[green]DONE:[/green] Data Only Object Plots")

def makeLowETOnlyPlot(test=False):
    console.log('Data Only Low ET Plots')

    data_input_trees = ['l1EventTree/L1EventTree', 'CICADAInputNtuplizer/CICADAInputTree', 'npvNtuplizer/NPVTree', 'l1UpgradeTree/L1UpgradeTree']
    console.log('Making Sample: Run C')
    run_c_chain, run_c_df, run_c_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024'], data_input_trees, test=test)
    run_c_df = define_quantities(run_c_df).Filter('cicadaInputSum < 300')
    console.log(f'nFiles: {run_c_n_files}')
    
    console.log('Making Sample: Run D')
    run_d_chain, run_d_df, run_d_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024'], data_input_trees, test=test)
    run_d_df = define_quantities(run_d_df).Filter('cicadaInputSum < 300')
    console.log(f'nFiles: {run_d_n_files}')
    
    console.log('Making Sample: Run E')
    run_e_chain, run_e_df, run_e_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024'], data_input_trees, test=test)
    run_e_df = define_quantities(run_e_df).Filter('cicadaInputSum < 300')
    console.log(f'nFiles: {run_e_n_files}')

    console.log('Making Sample: Run G')
    run_g_chain, run_g_df, run_g_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024'], data_input_trees, test=test)
    run_g_df = define_quantities(run_g_df).Filter('cicadaInputSum < 300')
    console.log(f'nFiles: {run_g_n_files}')

    console.log('Making Sample: Run H')
    run_h_chain, run_h_df, run_h_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024'], data_input_trees, test=test)
    run_h_df = define_quantities(run_h_df).Filter('cicadaInputSum < 300')
    console.log(f'nFiles: {run_h_n_files}')

    run_c_inputs_booking = make_cicada_input_plot_booking(run_c_df, 'RunC')
    run_d_inputs_booking = make_cicada_input_plot_booking(run_d_df, 'RunD')
    run_e_inputs_booking = make_cicada_input_plot_booking(run_e_df, 'RunE')
    run_g_inputs_booking = make_cicada_input_plot_booking(run_g_df, 'RunG')
    run_h_inputs_booking = make_cicada_input_plot_booking(run_h_df, 'RunH')

    run_c_sum_booking = make_cicada_input_sum_plot_booking(run_c_df, 'RunC')
    run_d_sum_booking = make_cicada_input_sum_plot_booking(run_d_df, 'RunD')
    run_e_sum_booking = make_cicada_input_sum_plot_booking(run_e_df, 'RunE')
    run_g_sum_booking = make_cicada_input_sum_plot_booking(run_g_df, 'RunG')
    run_h_sum_booking = make_cicada_input_sum_plot_booking(run_h_df, 'RunH')

    run_c_npv_booking = make_npv_booking(run_c_df, 'RunC')
    run_d_npv_booking = make_npv_booking(run_d_df, 'RunD')
    run_e_npv_booking = make_npv_booking(run_e_df, 'RunE')
    run_g_npv_booking = make_npv_booking(run_g_df, 'RunG')
    run_h_npv_booking = make_npv_booking(run_h_df, 'RunH')

    plot_settings = {
        'ET': (20, 0.0, 1500.0),
        'HT': (20, 0.0, 500.0),
        'nEGs': (20, 0.0, 20.0),
        'nTaus': (20, 0.0, 20.0),
        'nJets': (20, 0.0, 20.0),
        'egEt': (20, 0.0, 100.0),
        'tauEt': (20, 0.0, 100.0),
        'jetEt': (20, 0.0, 200.0),
    }
    samples = ['RunC', 'RunD', 'RunE', 'RunG', 'RunH']
    dataframes = [run_c_df, run_d_df, run_e_df, run_g_df, run_h_df]

    plot_bookings = {}
    for variable in plot_settings:
        plot_bookings[variable] = {}
        for df, sample in zip(dataframes, samples):
            plot_bookings[variable][sample] = make_variable_booking(
                df,
                sample,
                variable,
                plot_settings[variable],
            )

    #Draw data only input plots
    console.log("Drawing Low ET Data Only Inputs Plot")
    draw_data_only_cicada_input_plot(
        run_c_inputs_booking,
        run_d_inputs_booking,
        run_e_inputs_booking,
        run_g_inputs_booking,
        run_h_inputs_booking,
        'DataOnlyCICADAInputPlot_LowET'
    )
    console.log('[green]DONE:[/green] Low ET Data Only Inputs Plot')

    console.log("Drawing Low ET Data Only Inputs Sum Plot")
    draw_data_only_cicada_input_sum_plot(
        run_c_sum_booking,
        run_d_sum_booking,
        run_e_sum_booking,
        run_g_sum_booking,
        run_h_sum_booking,
        'DataOnlyCICADAInputPlot_LowET'
    )
    console.log("[green]DONE:[/green] Low ET Data Only Inputs Sum Plot")

    console.log('Drawing Data Only NPV Plot')
    draw_data_only_npv_plot(
        run_c_npv_booking,
        run_d_npv_booking,
        run_e_npv_booking,
        run_g_npv_booking,
        run_h_npv_booking,
        'DataOnlyNPVPlot_LowET'
    )
    console.log("[green]DONE:[/green] Low ET Data Only NPV Plot")

    for variable in plot_bookings:
        console.log(f'Variable Draw: {variable}')
        draw_data_only_variable_booking(
            plot_bookings,
            variable,
            'DataOnlyObjectPlots_LowET'
        )
    console.log("[green]DONE:[/green] Low ET Data Only Object Plots")

def makeNPVFilteredPlots(test=False):
    console.log('Data Only NPV Filtered Plots')

    data_input_trees = ['l1EventTree/L1EventTree', 'CICADAInputNtuplizer/CICADAInputTree', 'npvNtuplizer/NPVTree', 'l1UpgradeTree/L1UpgradeTree']
    console.log('Making Sample: Run C')
    run_c_chain, run_c_df, run_c_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024'], data_input_trees, test=test)
    run_c_df = define_quantities(run_c_df).Filter('npv > 1')
    console.log(f'nFiles: {run_c_n_files}')
    
    console.log('Making Sample: Run D')
    run_d_chain, run_d_df, run_d_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024'], data_input_trees, test=test)
    run_d_df = define_quantities(run_d_df).Filter('npv > 1')
    console.log(f'nFiles: {run_d_n_files}')
    
    console.log('Making Sample: Run E')
    run_e_chain, run_e_df, run_e_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024'], data_input_trees, test=test)
    run_e_df = define_quantities(run_e_df).Filter('npv > 1')
    console.log(f'nFiles: {run_e_n_files}')

    console.log('Making Sample: Run G')
    run_g_chain, run_g_df, run_g_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024'], data_input_trees, test=test)
    run_g_df = define_quantities(run_g_df).Filter('npv > 1')
    console.log(f'nFiles: {run_g_n_files}')

    console.log('Making Sample: Run H')
    run_h_chain, run_h_df, run_h_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024'], data_input_trees, test=test)
    run_h_df = define_quantities(run_h_df).Filter('npv > 1')
    console.log(f'nFiles: {run_h_n_files}')

    run_c_inputs_booking = make_cicada_input_plot_booking(run_c_df, 'RunC')
    run_d_inputs_booking = make_cicada_input_plot_booking(run_d_df, 'RunD')
    run_e_inputs_booking = make_cicada_input_plot_booking(run_e_df, 'RunE')
    run_g_inputs_booking = make_cicada_input_plot_booking(run_g_df, 'RunG')
    run_h_inputs_booking = make_cicada_input_plot_booking(run_h_df, 'RunH')

    run_c_sum_booking = make_cicada_input_sum_plot_booking(run_c_df, 'RunC')
    run_d_sum_booking = make_cicada_input_sum_plot_booking(run_d_df, 'RunD')
    run_e_sum_booking = make_cicada_input_sum_plot_booking(run_e_df, 'RunE')
    run_g_sum_booking = make_cicada_input_sum_plot_booking(run_g_df, 'RunG')
    run_h_sum_booking = make_cicada_input_sum_plot_booking(run_h_df, 'RunH')

    run_c_npv_booking = make_npv_booking(run_c_df, 'RunC')
    run_d_npv_booking = make_npv_booking(run_d_df, 'RunD')
    run_e_npv_booking = make_npv_booking(run_e_df, 'RunE')
    run_g_npv_booking = make_npv_booking(run_g_df, 'RunG')
    run_h_npv_booking = make_npv_booking(run_h_df, 'RunH')

    plot_settings = {
        'ET': (20, 0.0, 1500.0),
        'HT': (20, 0.0, 500.0),
        'nEGs': (20, 0.0, 20.0),
        'nTaus': (20, 0.0, 20.0),
        'nJets': (20, 0.0, 20.0),
        'egEt': (20, 0.0, 100.0),
        'tauEt': (20, 0.0, 100.0),
        'jetEt': (20, 0.0, 200.0),
    }
    samples = ['RunC', 'RunD', 'RunE', 'RunG', 'RunH']
    dataframes = [run_c_df, run_d_df, run_e_df, run_g_df, run_h_df]

    plot_bookings = {}
    for variable in plot_settings:
        plot_bookings[variable] = {}
        for df, sample in zip(dataframes, samples):
            plot_bookings[variable][sample] = make_variable_booking(
                df,
                sample,
                variable,
                plot_settings[variable],
            )

    #Draw data only input plots
    console.log("Drawing NPV Filtered Data Only Inputs Plot")
    draw_data_only_cicada_input_plot(
        run_c_inputs_booking,
        run_d_inputs_booking,
        run_e_inputs_booking,
        run_g_inputs_booking,
        run_h_inputs_booking,
        'DataOnlyCICADAInputPlot_NPVFiltered'
    )
    console.log('[green]DONE:[/green] NPV Filtered Data Only Inputs Plot')

    console.log("Drawing NPV Filtered Data Only Inputs Sum Plot")
    draw_data_only_cicada_input_sum_plot(
        run_c_sum_booking,
        run_d_sum_booking,
        run_e_sum_booking,
        run_g_sum_booking,
        run_h_sum_booking,
        'DataOnlyCICADAInputPlot_NPVFiltered'
    )
    console.log("[green]DONE:[/green] NPV Filtered Data Only Inputs Sum Plot")

    console.log('Drawing Data Only NPV Plot')
    draw_data_only_npv_plot(
        run_c_npv_booking,
        run_d_npv_booking,
        run_e_npv_booking,
        run_g_npv_booking,
        run_h_npv_booking,
        'DataOnlyNPVPlot_NPVFiltered'
    )
    console.log("[green]DONE:[/green] NPV Filtered Data Only NPV Plot")

    for variable in plot_bookings:
        console.log(f'Variable Draw: {variable}')
        draw_data_only_variable_booking(
            plot_bookings,
            variable,
            'DataOnlyObjectPlots_NPVFiltered'
        )
    console.log("[green]DONE:[/green] NPV Filtered Data Only Object Plots")    

def makeNPVSpikePlots(test=False):
    console.log('Data Only NPV Spike Plots')

    data_input_trees = ['l1EventTree/L1EventTree', 'CICADAInputNtuplizer/CICADAInputTree', 'npvNtuplizer/NPVTree', 'l1UpgradeTree/L1UpgradeTree']
    console.log('Making Sample: Run C')
    run_c_chain, run_c_df, run_c_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024'], data_input_trees, test=test)
    run_c_df = define_quantities(run_c_df).Filter('npv == 1')
    console.log(f'nFiles: {run_c_n_files}')
    
    console.log('Making Sample: Run D')
    run_d_chain, run_d_df, run_d_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024'], data_input_trees, test=test)
    run_d_df = define_quantities(run_d_df).Filter('npv == 1')
    console.log(f'nFiles: {run_d_n_files}')
    
    console.log('Making Sample: Run E')
    run_e_chain, run_e_df, run_e_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024'], data_input_trees, test=test)
    run_e_df = define_quantities(run_e_df).Filter('npv == 1')
    console.log(f'nFiles: {run_e_n_files}')

    console.log('Making Sample: Run G')
    run_g_chain, run_g_df, run_g_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024'], data_input_trees, test=test)
    run_g_df = define_quantities(run_g_df).Filter('npv == 1')
    console.log(f'nFiles: {run_g_n_files}')

    console.log('Making Sample: Run H')
    run_h_chain, run_h_df, run_h_n_files = build_sample(['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024'], data_input_trees, test=test)
    run_h_df = define_quantities(run_h_df).Filter('npv == 1')
    console.log(f'nFiles: {run_h_n_files}')

    run_c_inputs_booking = make_cicada_input_plot_booking(run_c_df, 'RunC')
    run_d_inputs_booking = make_cicada_input_plot_booking(run_d_df, 'RunD')
    run_e_inputs_booking = make_cicada_input_plot_booking(run_e_df, 'RunE')
    run_g_inputs_booking = make_cicada_input_plot_booking(run_g_df, 'RunG')
    run_h_inputs_booking = make_cicada_input_plot_booking(run_h_df, 'RunH')

    run_c_sum_booking = make_cicada_input_sum_plot_booking(run_c_df, 'RunC')
    run_d_sum_booking = make_cicada_input_sum_plot_booking(run_d_df, 'RunD')
    run_e_sum_booking = make_cicada_input_sum_plot_booking(run_e_df, 'RunE')
    run_g_sum_booking = make_cicada_input_sum_plot_booking(run_g_df, 'RunG')
    run_h_sum_booking = make_cicada_input_sum_plot_booking(run_h_df, 'RunH')

    run_c_npv_booking = make_npv_booking(run_c_df, 'RunC')
    run_d_npv_booking = make_npv_booking(run_d_df, 'RunD')
    run_e_npv_booking = make_npv_booking(run_e_df, 'RunE')
    run_g_npv_booking = make_npv_booking(run_g_df, 'RunG')
    run_h_npv_booking = make_npv_booking(run_h_df, 'RunH')

    plot_settings = {
        'ET': (20, 0.0, 1500.0),
        'HT': (20, 0.0, 500.0),
        'nEGs': (20, 0.0, 20.0),
        'nTaus': (20, 0.0, 20.0),
        'nJets': (20, 0.0, 20.0),
        'egEt': (20, 0.0, 100.0),
        'tauEt': (20, 0.0, 100.0),
        'jetEt': (20, 0.0, 200.0),
    }
    samples = ['RunC', 'RunD', 'RunE', 'RunG', 'RunH']
    dataframes = [run_c_df, run_d_df, run_e_df, run_g_df, run_h_df]

    plot_bookings = {}
    for variable in plot_settings:
        plot_bookings[variable] = {}
        for df, sample in zip(dataframes, samples):
            plot_bookings[variable][sample] = make_variable_booking(
                df,
                sample,
                variable,
                plot_settings[variable],
            )

    #Draw data only input plots
    console.log("Drawing NPV Spike Data Only Inputs Plot")
    draw_data_only_cicada_input_plot(
        run_c_inputs_booking,
        run_d_inputs_booking,
        run_e_inputs_booking,
        run_g_inputs_booking,
        run_h_inputs_booking,
        'DataOnlyCICADAInputPlot_NPVSpike'
    )
    console.log('[green]DONE:[/green] NPV Spike Data Only Inputs Plot')

    console.log("Drawing NPV Spike Data Only Inputs Sum Plot")
    draw_data_only_cicada_input_sum_plot(
        run_c_sum_booking,
        run_d_sum_booking,
        run_e_sum_booking,
        run_g_sum_booking,
        run_h_sum_booking,
        'DataOnlyCICADAInputPlot_NPVSpike'
    )
    console.log("[green]DONE:[/green] NPV Spike Data Only Inputs Sum Plot")

    console.log('Drawing Data Only NPV Plot')
    draw_data_only_npv_plot(
        run_c_npv_booking,
        run_d_npv_booking,
        run_e_npv_booking,
        run_g_npv_booking,
        run_h_npv_booking,
        'DataOnlyNPVPlot_NPVSpike'
    )
    console.log("[green]DONE:[/green] NPV Spike Data Only NPV Plot")

    for variable in plot_bookings:
        console.log(f'Variable Draw: {variable}')
        draw_data_only_variable_booking(
            plot_bookings,
            variable,
            'DataOnlyObjectPlots_NPVSpike'
        )
    console.log("[green]DONE:[/green] NPV Spike Data Only Object Plots")    
    
def main(args):
    ROOT.gStyle.SetOptStat(0)
    # Plots pertaining to CICADA's Inputs
    console.log('Making input plots')
    makeInputPlots(test=args.test)

    console.log('Making NPV Plots')
    makeNPVPlots(test=args.test)

    console.log('Making Object Plots')
    makeObjectPlots(test=args.test)

    console.log('Making Data Only Plots')
    makeDataOnlyPlots(test=args.test)

    console.log('Making Low ET Only Plots')
    makeLowETOnlyPlot(test=args.test)

    console.log('Making NPV > 1 plots')
    makeNPVFilteredPlots(test=args.test)

    console.log('Making NPV == 1 plots')
    makeNPVSpikePlots(test=args.test)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Validation Plot Making')

    parser.add_argument(
        '--test',
        action='store_true',
        help='Run with few files to quickly test script outputs'
    )

    args=parser.parse_args()

    main(args)
