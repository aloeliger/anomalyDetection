#!/usr/bin/env python3
#A script to make validation plots about CICADA input stuff from various samples
#

import ROOT
from .samples import construct_data_samples, construct_mc_samples
from .definitions import add_all_values
from .histogram_utilities import normalize_histogram_list
from pathlib import Path
from rich.console import Console

console = Console()

# make bookings for a data sample and signal sample
# Should be an overall CICADA Input plot
# As well as eta bins
def book_cicada_input_plots(
        data_sample,
        single_neutrino_sample,
        data_sample_name = 'Data',
        single_neutrino_name='SingleNeutrino'
):

    plots = {}

    eta_bins = {
        'iEta0': 'iEta == 6 || iEta == 7',
        'iEta1': 'iEta == 5 || iEta == 8',
        'iEta2': 'iEta == 4 || iEta == 9',
        'iEta3': 'iEta == 3 || iEta == 10',
        'iEta4': 'iEta == 2 || iEta == 11',
        'iEta5': 'iEta == 1 || iEta == 12',
        'iEta6': 'iEta == 0 || iEta == 13',
    }
    
    for name, sample in [
            (data_sample_name, data_sample),
            (single_neutrino_name, single_neutrino_sample)
    ]:
        plots[name] = {}
        plots[name]['overall'] = sample.df.Histo1D(
            (
                f'{name}_inputs',
                f'{name}_inputs',
                20,
                0.0,
                20.0,
            ),
            'modelInput'
        )
        for eta_bin in eta_bins:
            cicada_input_name = f'modelInput_{eta_bin}'
            sample.df = sample.df.Define(f'{eta_bin}_mask', eta_bins[eta_bin])
            sample.df = sample.df.Define(cicada_input_name, f'modelInput[{eta_bin}_mask]')
            plots[name][eta_bin] = sample.df.Histo1D(
                (
                    f'{name}_{eta_bin}_inputs',
                    f'{name}_{eta_bin}_inputs',
                    20,
                    0.0,
                    20.0,
                ),
                cicada_input_name,
            )
    return plots

def style_data_cicada_input_plot(data_plot):
    data_plot.SetLineColor(ROOT.kBlack)
    data_plot.SetMarkerStyle(20)
    data_plot.SetLineWidth(2)

    return data_plot

def style_neutrino_cicada_input_plot(neutrino_plot):
    neutrino_plot.SetLineColor(ROOT.kRed)
    neutrino_plot.SetLineWidth(2)
    neutrino_plot.SetFillColorAlpha(
        ROOT.kRed,
        0.3
    )

    return neutrino_plot

def set_data_plot_axes(data_plot):
    data_plot.SetTitle('')
    data_plot.GetXaxis().SetTitle('')
    data_plot.GetYaxis().SetTitle('A.U.')

    return data_plot

def set_ratio_plot_axes(ratio_plot, x_axis=''):
    ratio_plot.SetTitle('')
    ratio_plot.GetXaxis().SetTitle(x_axis)
    ratio_plot.GetYaxis().SetTitle('Data/Simulation')
    
    return ratio_plot

def setup_ratio_canvas(the_canvas):
    the_canvas.Divide(1,2)

    top_pad = the_canvas.GetPad(1)
    bottom_pad = the_canvas.GetPad(2)

    top_pad.SetPad(0.0, 0.4, 1.0, 1.0)
    bottom_pad.SetPad(0.0, 0.0, 1.0, 0.4)

    top_pad.SetBottomMargin(0.0)
    #bottom_pad.SetBottomMargin(0.1)
    bottom_pad.SetTopMargin(0.0)

    return the_canvas, top_pad, bottom_pad

def draw_cicada_input_plots(
        data_booking,
        single_neutrino_booking,
        outputPath,
        histName,
):
    theCanvas = ROOT.TCanvas(f'data_single_neutrino_cicada_input')
    data_plot = data_booking.GetValue()
    single_neutrino_plot = single_neutrino_booking.GetValue()

    data_plot = style_data_cicada_input_plot(data_plot)
    single_neutrino_plot = style_neutrino_cicada_input_plot(single_neutrino_plot)

    normalize_histogram_list([data_plot, single_neutrino_plot])
    
    theCanvas, topPad, bottomPad = setup_ratio_canvas(theCanvas)

    topPad.cd()
    
    data_plot.Draw('E1')
    single_neutrino_plot.Draw('HIST SAME')

    data_plot = set_data_plot_axes(data_plot)

    theLegend = ROOT.TLegend(0.6, 0.6, 0.9, 0.9)
    theLegend.AddEntry(data_plot, 'Data', 'lp')
    theLegend.AddEntry(single_neutrino_plot, 'Single Neutrino', 'lf')
    theLegend.Draw()

    bottomPad.cd()
    ratio_plot = data_plot.Clone()
    ratio_plot.Divide(single_neutrino_plot)

    ratio_plot.Draw('HIST')

    set_ratio_plot_axes(ratio_plot, x_axis='CICADA Inputs (GeV)')

    theCanvas.SaveAs(
        f'{str(outputPath)}/{histName}.png'
    )

    return theCanvas
    
def main(args):
    ROOT.gStyle.SetOptStat(0)
    
    # 1.) Get samples
    console.log('Getting samples')
    data_samples = construct_data_samples()
    mc_samples = construct_mc_samples()
    
    # 1.5) Define quantities
    # We will want CICADA Input sums
    console.log('Defining quantities')
    add_all_values(data_samples['Data'])
    add_all_values(mc_samples['SingleNeutrino'])
    
    # 2.) Book actions
    console.log('Booking plots')
    cicada_input_plots = book_cicada_input_plots(data_samples['Data'], mc_samples['SingleNeutrino'])
    
    # 3.) Trigger Actions & Draw results
    console.log('Performing draw')
    outputLocation = Path('PaperPlots/CICADA_Input_Plots')
    outputLocation.mkdir(exist_ok=True, parents=True)
    cicada_input_canvases = {}
    for plot in [
            'overall',
            'iEta0',
            'iEta1',
            'iEta2',
            'iEta3',
            'iEta4',
            'iEta5',
            'iEta6',
    ]:
        theCanvas = draw_cicada_input_plots(
            cicada_input_plots['Data'][plot],
            cicada_input_plots['SingleNeutrino'][plot],
            outputLocation,
            plot,
        )
        cicada_input_canvases[plot] = theCanvas
    console.log('Done')
