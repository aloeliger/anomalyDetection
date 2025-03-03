import ROOT
import tensorflow.keras as keras
import os
from rich.console import Console
import numpy as np
import math
from pathlib import Path
import argparse

console = Console()

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

def make_df_for_runs(df, runs):
    filter_str = ''
    for run in runs:
        filter_str += f'run == {run} ||'
    filter_str = filter_str[:-3]
    filtered_df = df.Filter(filter_str)
    return filtered_df

def get_inputs(the_df):
    inputs = the_df.AsNumpy(['modelInput', 'iEta', 'iPhi'])

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
    
    return reshapedModelInput

def make_score_plot_comparison(
        pre_rate_spike_scores,
        rate_spike_scores,
        output_name,
):    

    pre_rate_spike_plot, rate_spike_plot = get_score_plots(
        rate_spike_scores,
        pre_rate_spike_scores,
    )

    the_canvas = ROOT.TCanvas('score_plot_comparison')
    the_canvas.Divide(1,2)
    main_plot_pad = the_canvas.GetPad(1)
    ratio_plot_pad = the_canvas.GetPad(2)

    main_plot_pad.SetPad(0.0, 0.5, 1.0, 1.0)
    ratio_plot_pad.SetPad(0.0, 0.0, 1.0, 0.5)

    main_plot_pad.SetBottomMargin(0.0)
    ratio_plot_pad.SetTopMargin(0.0)
    ratio_plot_pad.SetBottomMargin(0.25)

    main_plot_pad.SetLogy()
    ratio_plot_pad.SetLogy()

    main_plot_pad.cd()

    pre_rate_spike_plot.Scale(1.0/ pre_rate_spike_plot.Integral())
    rate_spike_plot.Scale(1.0/rate_spike_plot.Integral())

    pre_rate_spike_plot.Draw('HIST')
    rate_spike_plot.Draw('HIST SAME')

    pre_rate_spike_plot.SetLineColor(
        ROOT.TColor.GetColor('#87CEEB')
    )
    pre_rate_spike_plot.SetLineWidth(2)
    pre_rate_spike_plot.SetFillColorAlpha(
        ROOT.TColor.GetColor('#87CEEB'),
        0.3
    )
    
    rate_spike_plot.SetLineColor(
        ROOT.TColor.GetColor('#FFA500')
    )
    rate_spike_plot.SetLineWidth(2)
    rate_spike_plot.SetFillColorAlpha(
        ROOT.TColor.GetColor('#FFA500'),
        0.3
    )

    pre_rate_spike_plot.GetXaxis().SetTitle('')
    pre_rate_spike_plot.GetXaxis().SetTickSize(0.0)
    pre_rate_spike_plot.GetYaxis().SetTitle('A.U')
    pre_rate_spike_plot.GetYaxis().CenterTitle()
    pre_rate_spike_plot.GetYaxis().SetTitleSize(0.08)
    pre_rate_spike_plot.GetYaxis().SetTitleOffset(0.6)
    pre_rate_spike_plot.GetYaxis().SetLabelSize(0.08)
    pre_rate_spike_plot.SetTitle('')
    #pre_rate_spike_plot.SetTitleSize(0.08)

    the_legend = ROOT.TLegend(0.6, 0.6, 0.9, 0.9)
    the_legend.SetFillStyle(0)
    the_legend.SetLineWidth(0)
    the_legend.AddEntry(pre_rate_spike_plot, 'Pre Rate Spike', 'lf')
    the_legend.AddEntry(rate_spike_plot, 'Rate Spike', 'lf')

    the_legend.Draw()

    ratio_plot_pad.cd()
    ratio_plot_pad.SetGridy()

    ratio_plot = rate_spike_plot.Clone()
    ratio_plot.Divide(pre_rate_spike_plot)

    ratio_plot.SetLineColor(ROOT.kBlack)
    ratio_plot.SetLineWidth(2)
    ratio_plot.SetMarkerStyle(20)
    ratio_plot.SetMarkerColor(ROOT.kBlack)

    ratio_plot.Draw("E")
    ratio_plot.GetXaxis().SetTitle('CICADA Score')
    ratio_plot.GetXaxis().SetTitleSize(0.08)
    ratio_plot.GetXaxis().SetTitleOffset(0.8)
    ratio_plot.GetXaxis().SetLabelSize(0.08)
    ratio_plot.GetYaxis().SetTitle("Rate Spike / Previous")
    ratio_plot.GetYaxis().CenterTitle()
    ratio_plot.GetYaxis().SetTitleSize(0.08)
    ratio_plot.GetYaxis().SetTitleOffset(0.6)
    ratio_plot.GetYaxis().SetRangeUser(0.1, 10.0)
    ratio_plot.GetYaxis().SetNdivisions(3,0,0)
    ratio_plot.GetYaxis().SetLabelSize(0.08)
    ratio_plot.SetTitle('')

    the_canvas.SaveAs(output_name)

def make_cdf_plot(score_plot):
    cdf_plot = score_plot.Clone()
    cdf_plot.SetNameTitle('cdf', 'cdf')
    n_score_bins = score_plot.GetNbinsX()

    complete_integral = score_plot.Integral(1, n_score_bins)

    for bin_num in range(1, n_score_bins+1):
        try:
            fraction = score_plot.Integral(bin_num, n_score_bins) / complete_integral
        except ZeroDivisionError:
            fraction = 0.0
        cdf_plot.SetBinContent(bin_num, fraction)

    return cdf_plot

def make_rate_plot(cdf_plot):
    rate_plot = cdf_plot.Clone()
    rate_plot.SetNameTitle('rate', 'rate')

    rate_plot_bins = cdf_plot.GetNbinsX()
    for i in range(1, rate_plot_bins+1):
        rate_plot.SetBinContent(
            i,
            convert_eff_to_rate(
                rate_plot.GetBinContent(i)
            ),
        )
    return rate_plot

def convert_eff_to_rate(eff, n_bunches=2544):
    return eff * (float(n_bunches) * 11425e-3) #11425e-3 is the kHz orbit frequency

def convert_rate_to_eff(rate, n_bunches=2544):
    return rate / (float(n_bunches) * 11425e-3)

def make_rate_plot_comparison(
        pre_rate_spike_plot,
        rate_spike_plot,
        output_name,

):
    pre_rate_spike_rate_plot = make_rate_plot(
        make_cdf_plot(
            pre_rate_spike_plot
        )
    )

    rate_spike_rate_plot = make_rate_plot(
        make_cdf_plot(
            rate_spike_plot
        )
    )

    the_canvas = ROOT.TCanvas('rate_plot_comparison')
    the_canvas.Divide(1,2)
    main_plot_pad = the_canvas.GetPad(1)
    ratio_plot_pad = the_canvas.GetPad(2)
    
    main_plot_pad.SetPad(0.0, 0.5, 1.0, 1.0)
    ratio_plot_pad.SetPad(0.0, 0.0, 1.0, 0.5)

    main_plot_pad.SetBottomMargin(0.0)
    ratio_plot_pad.SetTopMargin(0.0)
    ratio_plot_pad.SetBottomMargin(0.25)

    main_plot_pad.SetLogy()
    ratio_plot_pad.SetLogy()

    main_plot_pad.cd()

    pre_rate_spike_rate_plot.Draw('E')
    rate_spike_rate_plot.Draw('E SAME')

    pre_rate_spike_rate_plot.SetLineColor(
        ROOT.TColor.GetColor('#87CEEB')
    )
    pre_rate_spike_rate_plot.SetLineWidth(2)
    pre_rate_spike_rate_plot.SetMarkerColor(
        ROOT.TColor.GetColor('#87CEEB')
    )
    pre_rate_spike_rate_plot.SetMarkerStyle(20)
    
    rate_spike_rate_plot.SetLineColor(
        ROOT.TColor.GetColor('#FFA500')
    )
    rate_spike_rate_plot.SetLineWidth(2)
    rate_spike_rate_plot.SetMarkerColor(
        ROOT.TColor.GetColor('#FFA500')
    )
    rate_spike_rate_plot.SetMarkerStyle(20)

    pre_rate_spike_rate_plot.GetXaxis().SetTitle('')
    pre_rate_spike_rate_plot.GetXaxis().SetTickSize(0.0)
    pre_rate_spike_rate_plot.GetYaxis().SetTitle('Overall Rate (kHz)')
    pre_rate_spike_rate_plot.GetYaxis().CenterTitle()
    pre_rate_spike_rate_plot.GetYaxis().SetTitleSize(0.08)
    pre_rate_spike_rate_plot.GetYaxis().SetTitleOffset(0.6)
    pre_rate_spike_rate_plot.GetYaxis().SetLabelSize(0.08)
    pre_rate_spike_rate_plot.GetYaxis().SetRangeUser(
        0.01,
        100.0
    )
    pre_rate_spike_rate_plot.SetTitle('')
    #pre_rate_spike_plot.SetTitleSize(0.08)

    the_legend = ROOT.TLegend(0.6, 0.6, 0.9, 0.9)
    the_legend.SetFillStyle(0)
    the_legend.SetLineWidth(0)
    the_legend.AddEntry(pre_rate_spike_rate_plot, 'Pre Rate Spike', 'lp')
    the_legend.AddEntry(rate_spike_rate_plot, 'Rate Spike', 'lp')

    the_legend.Draw()

    ratio_plot_pad.cd()
    ratio_plot_pad.SetGridy()

    ratio_plot = rate_spike_rate_plot.Clone()
    ratio_plot.Divide(pre_rate_spike_rate_plot)

    ratio_plot.SetLineColor(ROOT.kBlack)
    ratio_plot.SetLineWidth(2)
    ratio_plot.SetMarkerStyle(20)
    ratio_plot.SetMarkerColor(ROOT.kBlack)

    ratio_plot.Draw("E")
    ratio_plot.GetXaxis().SetTitle('CICADA Score')
    ratio_plot.GetXaxis().SetTitleSize(0.08)
    ratio_plot.GetXaxis().SetTitleOffset(0.8)
    ratio_plot.GetXaxis().SetLabelSize(0.08)
    ratio_plot.GetYaxis().SetTitle("Rate Spike / Previous")
    ratio_plot.GetYaxis().CenterTitle()
    ratio_plot.GetYaxis().SetTitleSize(0.08)
    ratio_plot.GetYaxis().SetTitleOffset(0.6)
    ratio_plot.GetYaxis().SetRangeUser(0.1, 10.0)
    ratio_plot.GetYaxis().SetNdivisions(3,0,0)
    ratio_plot.GetYaxis().SetLabelSize(0.08)
    ratio_plot.SetTitle('')

    the_canvas.SaveAs(output_name)
    
def get_score_plots(
        rate_spike_scores,
        pre_rate_spike_scores,
):
    pre_rate_spike_plot = ROOT.TH1D(
        'pre_rate_spike_score_plot',
        'pre_rate_spike_score_plot',
        40,
        0.0,
        200.0,
    )

    rate_spike_plot = ROOT.TH1D(
        'rate_spike_score_plot',
        'rate_spike_score_plot',
        40,
        0.0,
        200.0,
    )

    for score in pre_rate_spike_scores:
        pre_rate_spike_plot.Fill(score)
    for score in rate_spike_scores:
        rate_spike_plot.Fill(score)

    return pre_rate_spike_plot, rate_spike_plot
    

def make_rate_ratio_comparison(
        pre_rate_spike_predictions,
        rate_spike_predictions,
        pre_rate_spike_original_predictions,
        rate_spike_original_predictions,
        output_name
):
    pre_rate_spike_score_plot, rate_spike_score_plot = get_score_plots(
        rate_spike_predictions,
        pre_rate_spike_predictions,
    )
    pre_rate_spike_original_score_plot, rate_spike_original_score_plot = get_score_plots(
        rate_spike_original_predictions,
        pre_rate_spike_original_predictions,
    )

    pre_rate_spike_rate_plot = make_rate_plot(
        make_cdf_plot(
            pre_rate_spike_score_plot
        )
    )
    rate_spike_rate_plot = make_rate_plot(
        make_cdf_plot(
            rate_spike_score_plot
        )
    )

    pre_rate_spike_original_rate_plot = make_rate_plot(
        make_cdf_plot(
            pre_rate_spike_original_score_plot
        )
    )

    rate_spike_original_rate_plot = make_rate_plot(
        make_cdf_plot(
            rate_spike_original_score_plot
        )
    )

    rate_ratio_plot = rate_spike_rate_plot.Clone()
    rate_ratio_plot.Divide(pre_rate_spike_rate_plot)

    original_rate_ratio_plot = rate_spike_original_rate_plot.Clone()
    original_rate_ratio_plot.Divide(pre_rate_spike_original_rate_plot)

    the_canvas = ROOT.TCanvas('rate_ratio_plot')
    #the_canvas.Divide(1,2)
    #main_plot_pad = the_canvas.GetPad(1)
    #ratio_plot_pad = the_canvas.GetPad(2)
    
    #main_plot_pad.SetPad(0.0, 0.5, 1.0, 1.0)
    #ratio_plot_pad.SetPad(0.0, 0.0, 1.0, 0.5)

    #main_plot_pad.SetBottomMargin(0.0)
    #ratio_plot_pad.SetTopMargin(0.0)
    #ratio_plot_pad.SetBottomMargin(0.25)

    #main_plot_pad.SetLogy()
    #ratio_plot_pad.SetLogy()

    #main_plot_pad.cd()

    rate_ratio_plot.Draw("E")
    original_rate_ratio_plot.Draw("E SAME")

    rate_ratio_plot.SetLineColor(ROOT.TColor.GetColor('#87CEEB'))
    rate_ratio_plot.SetLineWidth(2)
    rate_ratio_plot.SetMarkerColor(ROOT.TColor.GetColor('#87CEEB'))
    rate_ratio_plot.SetMarkerStyle(20)

    original_rate_ratio_plot.SetLineColor(ROOT.TColor.GetColor('#FFA500'))
    original_rate_ratio_plot.SetLineWidth(2)
    original_rate_ratio_plot.SetMarkerColor(ROOT.TColor.GetColor('#FFA500'))
    original_rate_ratio_plot.SetMarkerStyle(20)

    rate_ratio_plot.GetXaxis().SetTitle('CICADA Scores')
    #rate_ratio_plot.GetXaxis().SetTitleSize(0.08)
    #rate_ratio_plot.GetXaxis().SetTitleOffset(0.6)
    #rate_ratio_plot.GetXaxis().SetLabelSize(0.08)
    #rate_ratio_plot.GetXaxis().SetTickSize(0.0)
    rate_ratio_plot.GetYaxis().SetTitle('Rate During Rate Spike/Before')
    rate_ratio_plot.GetYaxis().CenterTitle()
    #rate_ratio_plot.GetYaxis().SetTitleSize(0.08)
    #rate_ratio_plot.GetYaxis().SetTitleOffset(0.6)
    #rate_ratio_plot.GetYaxis().SetLabelSize(0.08)
    rate_ratio_plot.GetYaxis().SetRangeUser(
        0.0,
        max(
            rate_ratio_plot.GetMaximum(),
            original_rate_ratio_plot.GetMaximum()
        ) * 1.2
    )

    rate_ratio_plot.SetTitle('')

    the_legend = ROOT.TLegend(0.6, 0.6, 0.9, 0.9)
    the_legend.SetFillStyle(0)
    the_legend.SetLineWidth(0)
    the_legend.AddEntry(rate_ratio_plot, 'New Model', 'lp')
    the_legend.AddEntry(original_rate_ratio_plot, 'Original CICADA Model', 'lp')

    the_legend.Draw()

    # ratio_plot_pad.cd()
    # ratio_plot_pad.SetGridy()

    # ratio_plot = rate_ratio_plot.Clone()
    # ratio_plot.Divide(original_rate_ratio_plot)

    # ratio_plot.SetLineColor(ROOT.kBlack)
    # ratio_plot.SetLineWidth(2)
    # ratio_plot.SetMarkerStyle(20)
    # ratio_plot.SetMarkerColor(ROOT.kBlack)

    # ratio_plot.Draw("E")
    # ratio_plot.GetXaxis().SetTitle('CICADA Score')
    # ratio_plot.GetXaxis().SetTitleSize(0.08)
    # ratio_plot.GetXaxis().SetTitleOffset(0.8)
    # ratio_plot.GetXaxis().SetLabelSize(0.08)
    # ratio_plot.GetYaxis().SetTitle("New Model/Old Model")
    # ratio_plot.GetYaxis().CenterTitle()
    # ratio_plot.GetYaxis().SetTitleSize(0.08)
    # ratio_plot.GetYaxis().SetTitleOffset(0.6)
    # ratio_plot.GetYaxis().SetRangeUser(0.1, 10.0)
    # ratio_plot.GetYaxis().SetNdivisions(3,0,0)
    # ratio_plot.GetYaxis().SetLabelSize(0.08)
    # ratio_plot.SetTitle('')

    the_canvas.SaveAs(output_name)

def main(args):
    ROOT.gStyle.SetOptStat(0)
    
    sample_path = '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/'

    console.log("Making dataframe")
    df, chain = make_df(
        sample_path,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
        ],
    )

    original_cicada_df, original_cicada_chain = make_df(
        sample_path,
        [
            'l1EventTree/L1EventTree',
            'l1CaloSummaryEmuTree/L1CaloSummaryTree',
        ],
    )

    pre_rate_spike_runs = [
        386640,
        386661,
        386668,
    ]
    #rate spike runs
    rate_spike_runs = [
        386673,
        386679,
        386694,
    ]
    #post rate spike runs
    # post_rate_spike_runs = [
    #     386945,
    #     386951,
    # ]

    pre_rate_spike_df = make_df_for_runs(df, pre_rate_spike_runs)
    pre_rate_spike_original_df = make_df_for_runs(original_cicada_df, pre_rate_spike_runs)
    rate_spike_df = make_df_for_runs(df, rate_spike_runs)
    rate_spike_original_df = make_df_for_runs(original_cicada_df, rate_spike_runs)
    # post_rate_spike_df = make_df_for_runs(df, post_rate_spike_runs)

    #DEBUG
    #pre_rate_spike_df = pre_rate_spike_df.Range(50000)
    #rate_spike_df = rate_spike_df.Range(50000)
    #pre_rate_spike_original_df = pre_rate_spike_original_df.Range(50000)
    #rate_spike_original_df = rate_spike_original_df.Range(50000)

    console.log("Total event counts:")
    pre_rate_spike_count = pre_rate_spike_df.Count()
    rate_spike_count = rate_spike_df.Count()
    # post_rate_spike_count = post_rate_spike_df.Count()
    console.log(f'Pre rate spike: {pre_rate_spike_count.GetValue()}')
    console.log(f'Rate spike: {rate_spike_count.GetValue()}')
    # console.log(f'Post rate spike: {post_rate_spike_count.GetValue()}')

    #Let's start out by getting inputs
    #Then we can take a look at getting scores on our new model for both periods
    console.log('New Scores')
    pre_rate_spike_inputs = get_inputs(pre_rate_spike_df)
    rate_spike_inputs = get_inputs(rate_spike_df)

    cmssw_base = os.getenv('CMSSW_BASE')
    #model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/'
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-et-scaled/'
    new_model = keras.models.load_model(model_path)

    pre_rate_spike_predictions = new_model.predict(pre_rate_spike_inputs)
    rate_spike_predictions = new_model.predict(rate_spike_inputs)

    #Let's get the original CICACA scores
    console.log('Original scores')
    pre_rate_spike_original_predictions = pre_rate_spike_original_df.AsNumpy(["CICADAScore"])['CICADAScore']
    rate_spike_original_predictions = rate_spike_original_df.AsNumpy(['CICADAScore'])['CICADAScore']

    #plot_output_dir = Path('RateSpikeEvaluationPlots')
    plot_output_dir = Path(args.output_dir)
    plot_output_dir.mkdir(exist_ok=True, parents=True)

    console.log('Score Plots')
    make_score_plot_comparison(
        pre_rate_spike_predictions,
        rate_spike_predictions,
        str(plot_output_dir/'new_model_scores.png')
    )

    make_score_plot_comparison(
        pre_rate_spike_original_predictions,
        rate_spike_original_predictions,
        str(plot_output_dir/'old_model_scores.png')
    )
    
    console.log('Rate Plots')
    pre_rate_spike_score_plot, rate_spike_score_plot = get_score_plots(
        rate_spike_predictions,
        pre_rate_spike_predictions
    )

    pre_rate_spike_original_score_plot, rate_spike_original_score_plot = get_score_plots(
        rate_spike_original_predictions,
        pre_rate_spike_original_predictions,
    )

    make_rate_plot_comparison(
        pre_rate_spike_score_plot,
        rate_spike_score_plot,
        str(plot_output_dir/'new_model_rates.png')
    )

    make_rate_plot_comparison(
        pre_rate_spike_original_score_plot,
        rate_spike_original_score_plot,
        str(plot_output_dir/'old_model_rates.png')
    )

    console.log('Ratio of Rate Ratios Plot')
    make_rate_ratio_comparison(
        pre_rate_spike_predictions,
        rate_spike_predictions,
        pre_rate_spike_original_predictions,
        rate_spike_original_predictions,
        str(plot_output_dir/'rate_ratios.png')
    )

    console.log('Done!')
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument(
        '--output_dir',
        default='RateSpikeEvaluationPlots'
    )

    args = parser.parse_args()
    
    main(args)
