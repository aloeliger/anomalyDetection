#!/usr/bin/env python3

#Stuff for making phase space plots
#One of the first things we need is a way to add the CICADA scores back
#into the df that we're working on

import array
import ROOT
from .utils import get_plot_dict_minimum, get_plot_dict_maximum, colors

from .make_score_plots import get_all_inputs

def make_score_tree(scores, score_name):
    theTree = ROOT.TTree(f'{score_name}_tree', f'{score_name}_tree')
    score_array = array.array('f', [0.])
    theBranch = theTree.Branch(f'{score_name}', score_array, f'{score_name}/F')
    for score in scores:
        score_array[0] = score
        theTree.Fill()
    return theTree, theBranch, score_array

def add_score_to_sample(sample, scores, score_name):
    score_tree, score_branch, score_array = make_score_tree(scores, score_name)
    setattr(sample, f'{score_name}_tree', score_tree)
    setattr(sample, f'{score_name}_tree_branch', score_branch)
    setattr(sample, f'{score_name}_tree_branch_array', score_array)
    sample.chain.AddFriend(
       getattr(sample, f'{score_name}_tree')
    )
    sample.df = ROOT.RDataFrame(sample.chain)
    return sample

def add_score_to_sample_with_model(sample, model, score_name):
    inputs, _, _, _ = get_all_inputs(sample.df)
    setattr(
        sample,
        f'{score_name}_inputs',
        inputs
    )
    predictions = model.predict(inputs)
    setattr(
        sample,
        f'{score_name}_predictions',
        predictions
    )

    sample = add_score_to_sample(sample, predictions, score_name)
    return sample

#Okay, we need to make all the bookings here
def make_all_phase_space_bookings(sample, overall_rate_table, pure_rate_table, score_name):
    #First we need to define a set of rate thresholds we want to investigate
    rates = [
        1.0,
        0.5,
        0.25,
        0.1,
        0.05,
    ]

    thresholds = [
        get_threshold_from_rate_table(pure_rate_table, x)[0] for x in rates
    ]

    threshold_rate_dict = dict(zip(thresholds, rates))
    physics_vars = [
        (
            'nEGs',
            (
                'nEGs;nEGs;A.U.',
                'nEGs;nEGs;A.U.',
                40,
                0.0,
                40.0
            )
        ),
        (
            'egEt',
            (
                'egEt;EG ET;A.U.',
                'egEt;EG ET;A.U.',
                40,
                0.0,
                200.0,
            )
        ),
        (
            'egEta',
            (
                'egEta;EG Eta;A.U.',
                'egEta;EG Eta;A.U.',
                40,
                -3.0,
                3.0,
            )
        ),
        (
            'nTaus',
            (
                'nTaus;nTaus;A.U.',
                'nTaus;nTaus;A.U.',
                40,
                0.0,
                40.0
            )
        ),
        (
            'tauEt',
            (
                'tauEt;Tau ET;A.U.',
                'tauEt;Tau ET;A.U.',
                40,
                0.0,
                200.0,
            )
        ),
        (
            'tauEta',
            (
                'tauEta;Tau Eta;A.U.',
                'tauEta;Tau Eta;A.U.',
                40,
                -3.0,
                3.0,
            )
        ),
        (
            'nJets',
            (
                'nJets;nJets;A.U.',
                'nJets;nJets;A.U.',
                40,
                0.0,
                40.0
            )
        ),
        (
            'jetEt',
            (
                'jetEt;Jet ET;A.U.',
                'jetEt;Jet ET;A.U.',
                40,
                0.0,
                200.0,
            )
        ),
        (
            'jetEta',
            (
                'jetEta;Jet Eta;A.U.',
                'jetEta;Jet Eta;A.U.',
                40,
                -3.0,
                3.0,
            )
        ),
        (
            'nMuons',
            (
                'nMuons;nMuons;A.U.',
                'nMuons;nMuons;A.U.',
                40,
                0.0,
                40.0
            )
        ),
        (
            'muonEt',
            (
                'muonEt;Muon ET;A.U.',
                'muonEt;Muon ET;A.U.',
                40,
                0.0,
                200.0,
            )
        ),
        (
            'muonEta',
            (
                'muonEta;Muon Eta;A.U.',
                'muonEta;Muon Eta;A.U.',
                40,
                -3.0,
                3.0,
            )
        ),
    ]
    bookings = {}
    #We book kinematics for each physics var
    sample.filter_storage = []
    for physics_var, histo_model in physics_vars:
        bookings[physics_var] = {}
        for threshold in threshold_rate_dict:
            #Then per rate thresholds
            hz_rate = int(threshold_rate_dict[threshold] * 1000.0)
            rate_str = f'{hz_rate}Hz'
            sample_filter = sample.df.Filter(
                f'{score_name} >= {threshold}'
            )
            bookings[physics_var][rate_str] = sample_filter.Histo1D(
                histo_model,
                physics_var,
            )
            sample.filter_storage.append(sample_filter)
            
    #We should also have threshold less bookings
    for physics_var, histo_model in physics_vars:
        bookings[physics_var]['ZeroBias'] = sample.df.Histo1D(
            histo_model,
            physics_var,
        )
    #Final booking dict from this function will be [physics var][rate]
    return bookings

def draw_phase_space_booking(
        booking_rate_dict,
        model_name,
        physics_var,
        output_dir,
):
    ROOT.gStyle.SetOptStat(0)
    the_canvas = ROOT.TCanvas(f'{physics_var}')

    theLegend = ROOT.TLegend(0.6, 0.6, 0.9, 0.9)
    theLegend.SetFillStyle(0)
    theLegend.SetLineWidth(0)

    scaled_plots = {}
    for rate in booking_rate_dict:
        booking_rate_dict[rate] = booking_rate_dict[rate].GetValue()
        try:
            booking_rate_dict[rate].Scale(1.0/booking_rate_dict[rate].Integral())
        except ZeroDivisionError:
            pass

    for index, rate in enumerate(booking_rate_dict):
        if index == 0:
            booking_rate_dict[rate].Draw('E')
        else:
            booking_rate_dict[rate].Draw('E SAME')

        booking_rate_dict[rate].SetLineColor(colors[index])
        booking_rate_dict[rate].SetMarkerColor(colors[index])
        booking_rate_dict[rate].SetMarkerStyle(20)

        if index == 0:
            booking_rate_dict[rate].GetYaxis().SetRangeUser(
                get_plot_dict_minimum(booking_rate_dict),
                get_plot_dict_maximum(booking_rate_dict) * 1.2
            )

        theLegend.AddEntry(booking_rate_dict[rate], rate, 'lp')
    theLegend.Draw()
    the_canvas.SaveAs(f'{output_dir}/{model_name}_{physics_var}.png')

def draw_phase_space_bookings(
        booking_dict,
        model_name,
        output_dir,
):
    for physics_var in booking_dict:
        draw_phase_space_booking(
            booking_dict[physics_var],
            model_name,
            physics_var,
            output_dir,
        )
