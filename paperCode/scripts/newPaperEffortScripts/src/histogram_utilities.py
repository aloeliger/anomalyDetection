#Some utility functions for drawing histograms
import ROOT

def normalize_histogram_list(list_of_histograms: list[ROOT.TH1]):
    for hist in list_of_histograms:
        hist.Scale(1.0/hist.Integral())
    return list_of_histograms

def draw_cms_latex():
    the_latex = ROOT.TLatex()
    the_latex.SetTextSize(0.05)
    the_latex.SetNDC(True)
    the_latex.SetTextAlign(12)
    the_latex.DrawLatex(0.1, 0.92, "#font[62]{CMS} #font[52]{Preliminary}")
