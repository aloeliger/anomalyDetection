import pytest
from newPaperEffortScripts.src.definitions import *
import re

from .test_samples import singleNeutrinoSample, dataSample

def test_add_cicada_input_sum(dataSample):
    add_cicada_input_sum(dataSample)
    all_columns = dataSample.df.GetColumnNames()
    assert('cicadaInputSum' in all_columns)

def test_add_all_values(dataSample):
    add_all_values(dataSample)
    all_columns = dataSample.df.GetColumnNames()
    assert('cicadaInputSum' in all_columns)
    assert('pure_event' in all_columns)

def test_get_unprescaled_trigger_list():
    unprescaled_trigger_list = get_unprescaled_trigger_list()
    assert(isinstance(unprescaled_trigger_list, list))
    for item in unprescaled_trigger_list:
        assert(re.match(r'L1_', item) is not None)

def test_make_pure_event_fitler_string():
    unprescaled_trigger_list = get_unprescaled_trigger_list()
    filter_string = make_pure_event_filter_string(unprescaled_trigger_list)
    assert(re.match(r'(L1_\w* == 0 &&\s?)+', filter_string) is not None)

def test_add_pure_event_variable(dataSample):
    add_pure_event_variable(dataSample)
    all_columns = dataSample.df.GetColumnNames()
    assert('pure_event' in all_columns)

def test_add_eg_sum_variable(dataSample):
    add_eg_sum_variable(dataSample)
    all_columns = dataSample.df.GetColumnNames()
    assert('eg_pt_sum' in all_columns)
