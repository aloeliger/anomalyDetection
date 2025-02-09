import pytest
from .test_make_score_plots import low_stat_cicada_inputs, student_model, random_score_plot
from .test_sample import sample_paths, trees, low_stat_data_sample
from ..src.make_rate_plots import *
from .test_setup import unit_test_plot_dir
from .test_utils import unprescaled_triggers
import os
import tempfile

def test_npv(low_stat_data_sample):
    npv = get_npv(low_stat_data_sample.df)

    assert(npv is not None)
    assert(len(npv.shape)==1)
    assert(len(npv) == low_stat_data_sample.df.Count().GetValue())

def test_make_CDF(random_score_plot):
    cdf_plot = make_CDF(random_score_plot)
    nBins = cdf_plot.GetNbinsX()
    assert(isinstance(cdf_plot, ROOT.TH1))
    assert(cdf_plot.GetBinContent(1) == 1.0)

@pytest.fixture
def simple_cdf_plot(random_score_plot):
    return make_CDF(random_score_plot)

def test_make_rate_plot(simple_cdf_plot):
    rate_plot = make_rate_plot(simple_cdf_plot)

    assert(isinstance(rate_plot, ROOT.TH1))

@pytest.fixture
def simple_rate_plot(simple_cdf_plot):
    return make_rate_plot(simple_cdf_plot)

def test_draw_rate_plot(simple_rate_plot, unit_test_plot_dir):
    temp_file = f'{unit_test_plot_dir}/dummy_rate_plot.png'
    draw_rate_plot(
        {'Model One': simple_rate_plot},
        temp_file
    )
    assert(os.path.exists(temp_file))

def test_get_secondary_inputs(low_stat_data_sample):
    npv = get_secondary_inputs(low_stat_data_sample.df)

    assert(len(npv) == low_stat_data_sample.df.Count().GetValue())

def test_make_masked_rate_plot(low_stat_data_sample, low_stat_cicada_inputs, student_model):
    predictions = student_model.predict(low_stat_cicada_inputs).reshape((-1,))
    npv = get_secondary_inputs(low_stat_data_sample.df)

    masked_rate_plot = make_masked_rate_plot(
        predictions,
        npv,
        (40, 50),
    )

    assert(masked_rate_plot.Integral() > 0.0)
    assert(masked_rate_plot.GetBinContent(1) >= 28.3)
    
def test_make_rate_vs_variable_plot(low_stat_data_sample,low_stat_cicada_inputs, student_model):
    predictions = student_model.predict(low_stat_cicada_inputs).reshape((-1,))
    npv = get_secondary_inputs(low_stat_data_sample.df)

    the_graph = make_rate_vs_variable_plot(
        predictions,
        5.0,
        npv,
        [
            (30, 40),
            (40, 50),
            (50, 60),
            (60, 70),
        ]
    )

    assert(isinstance(the_graph, ROOT.TGraph))
    assert(the_graph.GetN() == 4)
    assert(the_graph.GetPointX(0) == 35)
    assert(the_graph.GetPointY(0) != 0.0)

def test_draw_rate_vs_variable_plot(low_stat_data_sample, low_stat_cicada_inputs, student_model, unit_test_plot_dir):

    predictions = student_model.predict(low_stat_cicada_inputs).reshape((-1,))
    npv = get_secondary_inputs(low_stat_data_sample.df)

    the_graph = make_rate_vs_variable_plot(
        predictions,
        5.0,
        npv,
        [
            (30,40),
            (40,50),
            (50,60),
            (60,70),
        ]
    )

    temp_file = f'{unit_test_plot_dir}/dummy_rate_vs_npv.png'

    draw_rate_vs_variable_plot(
        {
            'Model One': the_graph,
        },
        'nPV',
        5.0,
        temp_file,
    )

    assert(os.path.exists(temp_file))
    
def test_get_threshold_for_rate(simple_rate_plot):
    high_rate_threshold, _ = get_threshold_for_rate(40e3, simple_rate_plot)
    assert(high_rate_threshold == 0.0)

    zero_rate_threshold, _ = get_threshold_for_rate(0.0, simple_rate_plot)
    assert(zero_rate_threshold > 0.0)

def test_dump_rate_table(simple_rate_plot):
    simple_pure_rate_plot = simple_rate_plot.Clone()
    dump_rate_table(
        simple_rate_plot,
        simple_pure_rate_plot,
        [
            1.0,
            0.5,
            0.25,
            0.1,
            0.05,
        ],
        'dummy'
    )

def test_dump_complete_rate_table(
        simple_rate_plot
):
    simple_pure_rate_plot = simple_rate_plot.Clone()
    with tempfile.TemporaryDirectory() as temp_dir:
        dump_complete_rate_tables(
            simple_rate_plot,
            simple_pure_rate_plot,
            'dummy',
            temp_dir
        )

        assert(os.path.exists(f'{temp_dir}/dummy_rates.json'))
