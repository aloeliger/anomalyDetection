#!/usr/bin/env python3
#Core parts of a script to make a simple score plot for a given model
#And sample

import numpy as np
import ROOT
from .utils import get_plot_dict_minimum, get_plot_dict_maximum, colors
import os

def get_all_inputs(the_df):
    inputs = the_df.AsNumpy(['modelInput', 'iEta', 'iPhi', 'pure_event', 'npv', 'cicada_input_average'])

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

    
    return reshapedModelInput, inputs['pure_event'], inputs['npv'], inputs['cicada_input_average']

def make_score_plot_from_predictions(predictions, tag=None, histogram_name=None):
    if tag != None:
        name = f'{tag}_score_plot'
    else:
        name = 'score_plot'

    if histogram_name is not None:
        name = histogram_name
        
    the_plot = ROOT.TH1D(
        name,
        name,
        256,
        0.0,
        256.0
    )
    
    for i in range(len(predictions)):
        the_plot.Fill(predictions[i])
    return the_plot


def make_score_plot(cicada_inputs, model, tag=None, histogram_name=None):
    predictions = model.predict(cicada_inputs, verbose=0)
    predictions.reshape((-1,))

    return make_score_plot_from_predictions(predictions, tag, histogram_name)
        
def draw_score_plot(
        plots,
        output_dir,
        y_axis_range:tuple[int] = None,
        x_axis_range:tuple[int] = None,
):
    ROOT.gStyle.SetOptStat(0)
    the_canvas = ROOT.TCanvas('score_plot')
    the_canvas.SetLogy()
    
    theLegend = ROOT.TLegend(0.6,0.6,0.9,0.9)
    theLegend.SetFillStyle(0)
    theLegend.SetLineWidth(0)
    
    scaled_plots = {}
    for sample in plots:
        scaled_plots[sample] = plots[sample].Clone()
        scaled_plots[sample].Scale(1.0/scaled_plots[sample].Integral())
    
    for index, sample in enumerate(scaled_plots):
        if index == 0:
            scaled_plots[sample].Draw('HIST')
        else:
            scaled_plots[sample].Draw('HIST SAME')

        scaled_plots[sample].SetLineColor(colors[index])
        scaled_plots[sample].SetLineWidth(2)
        scaled_plots[sample].SetFillColorAlpha(colors[index], 0.3)

        if index==0:
            scaled_plots[sample].GetXaxis().SetTitle('CICADA Score')
            scaled_plots[sample].GetYaxis().SetTitle('A.U.')
            scaled_plots[sample].SetTitle('CICADA Score')

            if y_axis_range is not None:
                pass
            else:
                scaled_plots[sample].GetYaxis().SetRangeUser(
                    max(get_plot_dict_minimum(scaled_plots), 0.001),
                    get_plot_dict_maximum(scaled_plots) * 1.2,
                )

            if x_axis_range is not None:
                scaled_plots[sample].GetXaxis().SetRangeUser(
                    x_axis_range[0],
                    x_axis_range[1],
                )

        theLegend.AddEntry(scaled_plots[sample], sample, 'lf')
    theLegend.Draw()

    the_canvas.SaveAs(output_dir)

#Expect that score groups will be structured
# GroupScores/<Sample>/<Model>/<Pure or Overall>/score_file_<instance>.root
#Histograms should be named score_plot_<instance>
def make_score_plot_from_group(model_predictions, histogram_name, output_file_name):
    score_plot = make_score_plot_from_predictions(model_predictions, histogram_name = histogram_name)

    the_file = ROOT.TFile(output_file_name, 'RECREATE')
    the_file.cd()
    score_plot.Write()
