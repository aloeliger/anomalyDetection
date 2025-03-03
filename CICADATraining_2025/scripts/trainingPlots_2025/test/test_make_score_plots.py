import pytest
import tensorflow.keras as keras
import numpy as np
import os
import tempfile
from pathlib import Path

from .test_sample import sample_paths, trees, low_stat_data_sample, grouped_sample_fixture
from .test_setup import unit_test_plot_dir
from .test_utils import unprescaled_triggers
from ..src.make_score_plots import *

def test_get_all_inputs(low_stat_data_sample):
    cicada_inputs, _, _, _ = get_all_inputs(low_stat_data_sample.df)

    assert(cicada_inputs.shape[1] == 252)
    assert(len(cicada_inputs) != 0)

    the_df = low_stat_data_sample.df
    inputs = the_df.AsNumpy(['modelInput', 'iEta', 'iPhi'])

    modelInput = list(inputs['modelInput'])
    modelInput = [ list(x) for x in modelInput]
    modelInput = np.array(modelInput)#.reshape((-1, 18, 14))

    iEta = list(inputs['iEta'])
    iEta = [ list(x) for x in iEta]
    iEta = np.array(iEta)
    
    iPhi = list(inputs['iPhi'])
    iPhi = [list(x) for x in iPhi]
    iPhi = np.array(iPhi)

    reshaped_inputs = cicada_inputs.reshape((-1,18,14))
    for i in range(252):
        assert(reshaped_inputs[0, iPhi[0, i], iEta[0, i]] == modelInput[0, i])

@pytest.fixture
def low_stat_cicada_inputs(low_stat_data_sample):
    return get_all_inputs(low_stat_data_sample.df)[0]

@pytest.fixture
def student_model():
    cmssw_path = os.getenv('CMSSW_BASE')
    model_path = f'{cmssw_path}/src/anomalyDetection/CICADATraining_2025/metadata/teacher_score_only_student'
    the_model = keras.models.load_model(model_path)
    return the_model

def test_make_score_plot_from_predictions(low_stat_cicada_inputs, student_model):
    predictions = student_model.predict(low_stat_cicada_inputs, verbose=0)
    the_score_plot = make_score_plot_from_predictions(predictions, 'dummy')

    assert(isinstance(the_score_plot, ROOT.TH1))
    assert(the_score_plot.Integral() != 0)

def test_make_score_plot(low_stat_cicada_inputs, student_model):
    the_plot = make_score_plot(low_stat_cicada_inputs, student_model)

    assert(isinstance(the_plot, ROOT.TH1D))
    assert(the_plot.Integral() > 0.0)

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

def test_draw_score_plot(random_score_plot, unit_test_plot_dir):
    temp_file = f'{unit_test_plot_dir}/dummy_score_plot.png'
    draw_score_plot(
        {
            'Data': random_score_plot.Clone()
        },
        temp_file,
    )

    assert(os.path.exists(temp_file))

def test_make_score_plot_from_group(grouped_sample_fixture, student_model):
    with tempfile.TemporaryDirectory() as temp_dir:
        file_name = f'{temp_dir}/dummy_file_1.root'
        histogram_name = f'score_plot_1.root'
        cicada_inputs, pure_event, npvs, cicada_averages = get_all_inputs(grouped_sample_fixture.grouped_dfs[0])
        predictions = student_model.predict(cicada_inputs).reshape((-1,))
        make_score_plot_from_group(
            predictions,
            histogram_name,
            file_name
        )

        assert(os.path.exists(file_name))
        the_file = ROOT.TFile(file_name)
        the_plot = the_file.Get(histogram_name)
        assert(isinstance(the_plot, ROOT.TH1))
