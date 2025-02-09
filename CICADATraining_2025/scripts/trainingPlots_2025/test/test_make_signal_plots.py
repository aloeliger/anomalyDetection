import pytest
import h5py
from ..src.sample import Sample
from ..src.utils import make_pure_event_variable_from_list, filter_bad_events
from ..src.make_score_plots import get_all_inputs
from .test_make_score_plots import student_model
from .test_make_phase_space_plots import dummy_rate_table
from .test_utils import unprescaled_triggers
import json
import os

from ..src.make_signal_plots import *

@pytest.fixture
def lino_weighted_zb_h5():
    return '/hdfs/store/user/ligerlac/CICAD2025Training/ZB-2024-sampled-like-mc.h5'

@pytest.fixture
def mc_like_calo_inputs(lino_weighted_zb_h5):
    with h5py.File(lino_weighted_zb_h5) as theFile:
        inputs = np.array(theFile['CaloRegions'])[:10000].reshape((-1, 252))
    return inputs

@pytest.fixture
def mc_like_purity(lino_weighted_zb_h5):
    with h5py.File(lino_weighted_zb_h5) as theFile:
        purity = np.array(theFile['is_pure'])[:10000]
    return purity

@pytest.fixture
def mc_like_npv(lino_weighted_zb_h5):
    with h5py.File(lino_weighted_zb_h5) as theFile:
        npv = np.array(theFile['npv'])[:10000]
    return npv

@pytest.fixture
def htolonglived_sample():
    cmssw_base = os.getenv('CMSSW_BASE')
    theSample = Sample(
        [
          '/hdfs/store/user/aloelige/HTo2LongLivedTo4b_MH-125_MFF-12_CTau-900mm_TuneCP5_13p6TeV_pythia8/CICADATraining2025_HTo2LongLivedTo4b_Run3Winter24_10Jan2025/'
        ],
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'npvNtuplizer/NPVTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits'
        ],
        limit_files = 1,
    )
    json_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'
    with open(json_location) as theFile:
        unprescaled_trigger_list = json.load(theFile)
    theSample = make_pure_event_variable_from_list(
        theSample,
        unprescaled_trigger_list,
    )

def test_get_rate_with_nonexact_threshold(dummy_rate_table):
    rate, threshold = get_rate_with_nonexact_threshold(dummy_rate_table, 35.0)
    assert(rate == 1.0)
    assert(threshold == 20.0)

    rate_2, threshold_2 = get_rate_with_nonexact_threshold(dummy_rate_table, 80.0)
    assert(rate_2 == 0.1)
    assert(threshold_2 == 80.0)
    
def test_make_signal_acceptance_plot(htolonglived_sample, mc_like_calo_inputs, mc_like_purity):
    assert(False)
    # pure_mc_inputs = get_all_inputs(htolonglived_sample.df.Filter('pure_event == 1.0'))
    # pure_mc_scores = 
    
