import pytest
import json
import copy
import os

from .test_setup import unit_test_plot_dir
from .test_make_score_plots import low_stat_cicada_inputs, student_model
from .test_sample import sample_paths, trees, low_stat_data_sample
from .test_utils import unprescaled_triggers

from ..src.make_phase_space_plots import *
from ..src.sample import Sample
from ..src.utils import *

def test_make_score_tree(low_stat_cicada_inputs, student_model):
    predictions = student_model.predict(low_stat_cicada_inputs).reshape((-1,))
    theTree, _, _ = make_score_tree(predictions, 'dummy_score')

    assert(theTree.GetEntries() == len(predictions))

def test_add_score_to_sample(low_stat_data_sample, student_model, low_stat_cicada_inputs):
    predictions = student_model.predict(low_stat_cicada_inputs).reshape((-1,))
    low_stat_data_sample = add_score_to_sample(low_stat_data_sample, predictions, 'dummy_score')

    list_of_columns = low_stat_data_sample.df.GetColumnNames()
    list_of_columns = [str(x) for x in list_of_columns]
    assert('dummy_score_tree.dummy_score' in list_of_columns)

def test_add_score_to_sample_with_model(low_stat_data_sample, student_model):
    low_stat_data_sample = add_score_to_sample_with_model(low_stat_data_sample, student_model, 'dummy_score')

    list_of_columns = low_stat_data_sample.df.GetColumnNames()
    list_of_columns = [str(x) for x in list_of_columns]
    assert('dummy_score_tree.dummy_score' in list_of_columns)

@pytest.fixture
def dummy_rate_table():
    return {
        20.0: 1.0,
        40.0: 0.5,
        60.0: 0.25,
        80.0: 0.1,
        100.0: 0.05,
    }

def test_get_threshold_from_rate_table(dummy_rate_table):
    threshold, _ = get_threshold_from_rate_table(dummy_rate_table, 0.5)
    assert(threshold == 40.0)

    threshold_two, true_rate = get_threshold_from_rate_table(dummy_rate_table, 0.75)
    assert(threshold_two == 20.0)
    assert(true_rate == 1.0)

@pytest.fixture
def low_stat_ps_sample():
    trees = [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        'npvNtuplizer/NPVTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits',
        'l1UpgradeTree/L1UpgradeTree',
    ]
    sample = Sample(
        [
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
            '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
        ],
        trees,
        limit_files = 1,
    )
    return sample

@pytest.fixture
def unprescaled_trigger_list():
    cmssw_base = os.getenv('CMSSW_BASE')
    json_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'
    with open(json_location) as theFile:
        unprescaled_trigger_list = json.load(theFile)
    return unprescaled_trigger_list

@pytest.fixture
def booking_ready_sample(low_stat_ps_sample, student_model, unprescaled_triggers):
    the_sample = low_stat_ps_sample
    the_sample.df = filter_bad_events(the_sample.df)
    the_sample.df = define_cicada_average_variable(the_sample.df)
    the_sample.df = make_pure_event_variable_from_list(the_sample.df, unprescaled_triggers)
    the_sample = add_score_to_sample_with_model(low_stat_ps_sample, student_model, 'dummy_score')
    #sample = make_pure_event_variable_from_list(sample, unprescaled_trigger_list)
    
    return the_sample

def test_make_all_phase_space_bookings(booking_ready_sample, dummy_rate_table):
    dummy_pure_rate_table = copy.deepcopy(dummy_rate_table)

    bookings = make_all_phase_space_bookings(
        booking_ready_sample,
        dummy_rate_table,
        dummy_pure_rate_table,
        'dummy_score'
    )
    
    bookings_keys = list(bookings.keys())
    assert('nJets' in bookings_keys)
    bookings_rate_keys = list(bookings['nJets'].keys())
    assert('ZeroBias' in bookings_rate_keys)
    assert('250Hz' in bookings_rate_keys)

def test_draw_phase_space_booking(booking_ready_sample, dummy_rate_table, unit_test_plot_dir):

    bookings = make_all_phase_space_bookings(
        booking_ready_sample,
        dummy_rate_table,
        dummy_rate_table,
        'dummy_score'
    )

    output_dir = f'{unit_test_plot_dir}/'

    draw_phase_space_booking(
        bookings['nEGs'],
        'dummy_model',
        'nEGs',
        output_dir,
    )
    assert(os.path.exists(f'{output_dir}/dummy_model_nEGs.png'))
    
def test_draw_phase_space_bookings(booking_ready_sample, dummy_rate_table, unit_test_plot_dir):

    dummy_pure_rate_table = copy.deepcopy(dummy_rate_table)

    bookings = make_all_phase_space_bookings(
        booking_ready_sample,
        dummy_rate_table,
        dummy_pure_rate_table,
        'dummy_score'
    )

    output_dir = f'{unit_test_plot_dir}/'

    draw_phase_space_bookings(
        bookings,
        'dummy_model',
        output_dir,
    )

    assert(os.path.exists(f'{output_dir}/dummy_model_nEGs.png'))
    assert(os.path.exists(f'{output_dir}/dummy_model_nJets.png'))
