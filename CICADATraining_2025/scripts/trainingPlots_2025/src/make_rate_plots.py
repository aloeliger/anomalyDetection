#!/usr/bin/env python3
#Core parts of scripts for making rate plots

import numpy
import ROOT
from .make_score_plots import make_score_plot_from_predictions, get_all_inputs
from .utils import convert_eff_to_rate, make_pure_event_variable, get_plot_dict_maximum, get_plot_dict_minimum, colors
from rich.console import Console
from rich.table import Table
import json

console = Console()

def get_npv(the_df):
    npv = the_df.AsNumpy(['npv'])['npv']

    return npv

def make_CDF(score_plot):
    cdf_plot = score_plot.Clone()
    cdf_plot.SetNameTitle('cdf', 'cdf')
    n_score_bins = score_plot.GetNbinsX()

    complete_integral = score_plot.Integral(1, n_score_bins)

    for bin_num in range(1, n_score_bins+1):
        fraction = score_plot.Integral(bin_num, n_score_bins) / complete_integral
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

def draw_rate_plot(
        rate_plots,
        output_dir
):
    ROOT.gStyle.SetOptStat(0)
    the_canvas = ROOT.TCanvas('score_plot')
    the_canvas.SetLogy()
        
    markers = [
        20,
        21,
        22,
        23,
        29,
        27,
    ]

    theLegend = ROOT.TLegend(0.6,0.6,0.9,0.9)
    theLegend.SetLineWidth(0)
    theLegend.SetFillStyle(0)

    for index, sample in enumerate(rate_plots):
        if index == 0:
            rate_plots[sample].Draw("L")
        else:
            rate_plots[sample].Draw("L SAME")
        rate_plots[sample].SetLineColor(colors[index])
        rate_plots[sample].SetLineWidth(2)
        rate_plots[sample].SetMarkerColor(colors[index])
        rate_plots[sample].SetMarkerStyle(markers[index])

        if index==0:
            rate_plots[sample].GetXaxis().SetTitle('CICADA Score')
            rate_plots[sample].GetYaxis().SetTitle('Rate (kHz)')
            rate_plots[sample].SetTitle('Rates')

            rate_plots[sample].GetYaxis().SetRangeUser(
                #get_plot_dict_minimum(rate_plots),
                max(get_plot_dict_minimum(rate_plots), 0.01),
                min(get_plot_dict_maximum(rate_plots), 100.0) * 10.0
            )

        theLegend.AddEntry(rate_plots[sample], sample, 'lp')
    theLegend.Draw()
    the_canvas.SaveAs(output_dir)


# We need to make pure rate plots
# And rates versus a secondary variable for a fixed threshold
# And they need to be efficient...
# EDIT: The pure rate plot should be largely handled from the define side
# How do we handle the rate versus secondary variable plot?
# Okay, assuming we know a threshold, we need the cicada scores
# then also the other inputs (npv, whatever else)
# we can do a mask on 

def get_secondary_inputs(the_df):
    inputs = the_df.AsNumpy(['npv'])['npv']

    return inputs

def make_masked_rate_plot(scores, secondary_variable, point):
    secondary_variable_mask = (secondary_variable > point[0]) & (secondary_variable <= point[1])
    #secondary_variable_mask = (secondary_variable > point[0])

    masked_scores = scores[secondary_variable_mask]
    mask_tag = f'{point[0]}_{point[1]}'

    masked_score_plot = make_score_plot_from_predictions(masked_scores, tag=mask_tag)

    masked_cdf_plot = make_CDF(masked_score_plot)
    masked_rate_plot = make_rate_plot(masked_cdf_plot)

    return masked_rate_plot

def make_rate_vs_variable_plot(
        scores,
        score_threshold,
        secondary_variable,
        secondary_variable_points,
):
    ROOT.gStyle.SetOptStat(0)
    result_graph = ROOT.TGraph()
    
    for index, point in enumerate(secondary_variable_points):
        masked_rate_plot = make_masked_rate_plot(scores, secondary_variable, point)

        #Okay, now we need to get the rate for our score threshold
        rate_at_threshold = masked_rate_plot.GetBinContent(
            masked_rate_plot.FindBin(score_threshold)
        )

        result_graph.AddPoint((point[0]+point[1])/2, rate_at_threshold)
    return result_graph

def draw_rate_vs_variable_plot(
        plot_dict,
        variable_name,
        cicada_threshold,
        output_dir,
):
    ROOT.gStyle.SetOptStat(0)
    the_canvas = ROOT.TCanvas('rate_vs_{variable_name}')
    #the_canvas.SetLogy()

    theLegend = ROOT.TLegend(0.1, 0.6, 0.4, 0.9)
    theLegend.SetLineWidth(0)
    theLegend.SetFillStyle(0)

    for index, sample in enumerate(plot_dict):
        if index == 0:
            plot_dict[sample].Draw('AL')
        else:
            plot_dict[sample].Draw('L')
        plot_dict[sample].SetLineColor(colors[index])
        plot_dict[sample].SetLineWidth(2)

        if index==0:
            plot_dict[sample].GetXaxis().SetTitle(variable_name)
            plot_dict[sample].GetYaxis().SetTitle('Rate (kHz)')

            # plot_dict[sample].GetYaxis().SetRangeUser(
            #     max(get_plot_dict_minimum(plot_dict), 0.01),
            #     min(get_plot_dict_maximum(plot_dict), 100.0 ) * 10,
            # )
            plot_dict[sample].GetYaxis().SetRangeUser(
                0.01,
                10.0 * 1.2,
            )

        theLegend.AddEntry(plot_dict[sample], sample, 'l')
    theLegend.Draw()

    #Mention the CICADA Threshold
    cicada_latex = ROOT.TLatex()
    cicada_latex.SetNDC(True)
    cicada_latex.SetTextAlign(31)
    #cicada_latex.SetTextSize(0.025)
    cicada_latex.DrawLatex(0.9, 0.91, f'{cicada_threshold} kHz CICADA')
    
    the_canvas.SaveAs(output_dir)

#Utility for searching a rate plot for the relevant threshold
def get_threshold_for_rate(rate, rate_plot):
    low_bin = 1
    high_bin = rate_plot.GetNbinsX()

    prev_low_bin = low_bin
    prev_high_bin = high_bin
    prev_search_bin = None
    while low_bin != high_bin:
        search_bin = (low_bin + high_bin) // 2
        if search_bin  == prev_search_bin:  #if we're looking in the same spot, we're done
            break
        search_rate = rate_plot.GetBinContent(search_bin)
        if rate > search_rate: #need to search a lower bin/ higher rate
            prev_high_bin = high_bin
            high_bin = search_bin
        else: #need to search a higher bin/lower rate
            prev_low_bin = low_bin
            low_bin = search_bin

        # just to prevent any problems in rounding
        #check explicitly to see if the search window has stalled out
        # and assert the window is shrinking the right way
        assert(low_bin >= prev_low_bin), "Low bin search going the wrong direction!"
        assert(high_bin <= prev_high_bin), "High bin search going the wrong direction!"
        if high_bin == prev_high_bin and low_bin == prev_low_bin:
            break
        prev_search_bin = search_bin

    genuine_rate = rate_plot.GetBinContent(search_bin)
    threshold = rate_plot.GetBinLowEdge(search_bin)
    return threshold, genuine_rate
    
def dump_rate_table(rate_plot, pure_rate_plot, rates, name):
    table = Table(title=name)
    table.add_column('CICADA Threshold')
    table.add_column('Overall Rate')
    table.add_column('Pure Rate')

    for rate in rates:
        threshold, true_pure_rate = get_threshold_for_rate(rate, pure_rate_plot)
        overall_rate = rate_plot.GetBinContent(
            rate_plot.FindBin(threshold)
        )
        table.add_row(
            f'{threshold:.2f}',
            f'{overall_rate:.6f}',
            f'{true_pure_rate:.6f}',
        )
    console.print(table)

def dump_complete_rate_tables(rate_plot, pure_rate_plot, model_name, output_dir):
    overall_rate_dict = {}
    pure_rate_dict = {}
    for bin_num in range(1, rate_plot.GetNbinsX()+1):
        threshold = rate_plot.GetBinLowEdge(bin_num)
        rate = rate_plot.GetBinContent(bin_num)
        overall_rate_dict[threshold] = rate
    for bin_num in range(1, pure_rate_plot.GetNbinsX()+1):
        threshold = pure_rate_plot.GetBinLowEdge(bin_num)
        rate = pure_rate_plot.GetBinContent(bin_num)
        pure_rate_dict[threshold] = rate
    final_dict = {
        'pure': pure_rate_dict,
        'overall': overall_rate_dict,
    }

    with open(f'{output_dir}/{model_name}_rates.json', 'w') as theFile:
        json.dump(final_dict, theFile)
