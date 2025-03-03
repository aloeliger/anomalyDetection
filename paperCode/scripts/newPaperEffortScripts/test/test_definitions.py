import pytest
from newPaperEffortScripts.src.definitions import *

from .test_samples import singleNeutrinoSample

def test_add_cicada_input_sum(singleNeutrinoSample):
    add_cicada_input_sum(singleNeutrinoSample)
    all_columns = singleNeutrinoSample.df.GetColumnNames()
    assert('cicadaInputSum' in all_columns)

def test_add_all_values(singleNeutrinoSample):
    add_all_values(singleNeutrinoSample)
    all_columns = singleNeutrinoSample.df.GetColumnNames()
    assert('cicadaInputSum' in all_columns)
