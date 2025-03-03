import pytest
import ROOT

from .test_paper_validation_plots import dummy_1d_histogram
from newPaperEffortScripts.src.histogram_utilities import *

def test_normalize_histogram_list(dummy_1d_histogram):
    hists = normalize_histogram_list([dummy_1d_histogram])

    for hist in hists:
        assert(hist.Integral() == 1.0)
