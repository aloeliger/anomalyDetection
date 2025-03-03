#Some utility functions for drawing histograms
import ROOT

def normalize_histogram_list(list_of_histograms: list[ROOT.TH1]):
    for hist in list_of_histograms:
        hist.Scale(1.0/hist.Integral())
    return list_of_histograms
