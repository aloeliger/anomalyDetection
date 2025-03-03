import pytest
from ..src.utils import *
from ..src.sample import Sample
import re
import json
import ROOT
import numpy as np
import os

@pytest.fixture
def random_score_plot():
    score_plot = ROOT.TH1D(
        'dummy_score_plot',
        'dummy_score_plot',
        100,
        0.0,
        256.0
    )

    nprng = np.random.default_rng(42)
    random_scores = nprng.random(size=1000) * 256.0

    for i in range(len(random_scores)):
        score_plot.Fill(random_scores[i])
    return score_plot

def test_convert_eff_to_rate():
    assert(
        convert_eff_to_rate(0.0) == 0.0
    )

    assert(
        convert_eff_to_rate(1.0) >= 28300.0
    )

def test_convert_rate_to_eff():
    assert(
        convert_rate_to_eff(0.0) == 0.0
    )

    assert(
        convert_rate_to_eff(28300.0) > 0.9
    )

@pytest.fixture
def zb_c_sample():
    return Sample(
        list_of_paths=[
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        ],
        list_of_trees = [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'npvNtuplizer/NPVTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits'
        ],
        limit_files=1,
    )

def test_get_list_of_triggers(zb_c_sample):
    list_of_triggers = get_list_of_triggers(zb_c_sample)

    assert('L1_SingleMu22' in list_of_triggers)

@pytest.fixture
def zb_c_triggers(zb_c_sample):
    return get_list_of_triggers(zb_c_sample)
    
def test_filter_technical_triggers(zb_c_triggers):
    assert('L1_AlwaysTrue' in zb_c_triggers)
    filtered_triggers = filter_technical_triggers(zb_c_triggers)
    assert('L1_AlwaysTrue' not in filtered_triggers)

def test_get_list_of_unprescaled_triggers(zb_c_sample):
    unprescaled_triggers = get_list_of_unprescaled_triggers(zb_c_sample)

    assert('L1_SingleMu22' in unprescaled_triggers)
    assert('L1_AlwaysTrue' not in unprescaled_triggers)
    assert('L1_SingleJet180' in unprescaled_triggers)

@pytest.fixture
def zb_c_unprescaled_triggers(zb_c_sample):
    return get_list_of_unprescaled_triggers(zb_c_sample)
    
def test_make_pure_event_filter_string(zb_c_unprescaled_triggers):
    filter_string = make_pure_event_filter_string(zb_c_unprescaled_triggers)
    filter_match = re.match(r'(L1_\w+ == 0 && )+L1_\w+ == 0', filter_string)
    assert(filter_match is not None)
    
def test_make_pure_event_variable(zb_c_sample):
    zb_c_sample = make_pure_event_variable(zb_c_sample)

    list_of_columns = zb_c_sample.df.GetColumnNames()
    list_of_columns = [str(x) for x in list_of_columns]
    assert('pure_event' in list_of_columns)

def test_get_plot_dict_minimum(random_score_plot):
    minimum = get_plot_dict_minimum(
        {
            'random': random_score_plot
        }
    )

    assert(minimum == random_score_plot.GetMinimum())

def test_get_plot_dict_maximum(random_score_plot):
    maximum = get_plot_dict_maximum(
        {
            'random': random_score_plot
        }
    )

def test_define_cicada_average_variable(zb_c_sample):
    zb_c_sample.df = define_cicada_average_variable(zb_c_sample.df)

    list_of_columns = zb_c_sample.df.GetColumnNames()
    list_of_columns = [str(x) for x in list_of_columns]
    assert('cicada_input_average' in list_of_columns)

@pytest.fixture
def unprescaled_triggers():
    cmssw_base = os.getenv('CMSSW_BASE')
    json_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'
    with open(json_location) as theFile:
        unprescaled_trigger_list = json.load(theFile)
    return unprescaled_trigger_list

def test_get_threshold_from_rate_table(dummy_rate_table):
    threshold, _ = get_threshold_from_rate_table(dummy_rate_table, 0.5)
    assert(threshold == 40.0)

    threshold_two, true_rate = get_threshold_from_rate_table(dummy_rate_table, 0.75)
    assert(threshold_two == 20.0)
    assert(true_rate == 1.0)
