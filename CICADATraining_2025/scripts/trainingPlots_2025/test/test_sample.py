import pytest

from ..src.sample import Sample, GroupedSample
from ..src.utils import *
from .test_utils import unprescaled_triggers
import ROOT

@pytest.fixture
def sample_paths():
    return [
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
    ]

@pytest.fixture
def trees():
    return [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        'npvNtuplizer/NPVTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits'
    ]

def test_build_sample(sample_paths, trees):
    chain, df, nFiles = Sample.build_sample(sample_paths, trees)
    assert(isinstance(chain, ROOT.TChain))
    assert(isinstance(df, ROOT.RDataFrame))
    assert(nFiles > 0)

def test_sample_class(sample_paths, trees):
    theSample = Sample(sample_paths, trees)
    assert(isinstance(theSample, Sample))
    assert(theSample.nFiles > 0)
    assert(isinstance(theSample.chain, ROOT.TChain))
    assert(isinstance(theSample.df, ROOT.RDataFrame))


@pytest.fixture
def data_sample(sample_paths, trees):
    return Sample(sample_paths, trees)

@pytest.fixture
def low_stat_data_sample(sample_paths, trees, unprescaled_triggers):
    the_sample = Sample(sample_paths, trees, limit_files=1)
    the_sample.df = filter_bad_events(the_sample.df)
    the_sample.df = define_cicada_average_variable(the_sample.df)
    the_sample.df = make_pure_event_variable_from_list(the_sample.df, unprescaled_triggers)
    return the_sample

def test_low_stat_data_sample(low_stat_data_sample):
    assert(low_stat_data_sample.nFiles == 1)

def test_modulus_acceptance_sample(sample_paths, trees):
    bigSample = Sample(sample_paths, trees)
    sample = Sample(sample_paths, trees, modulus_acceptance=20)

    assert (sample.nFiles < bigSample.nFiles)

def test_grouped_sample_class(sample_paths, trees):
    grouped_sample = GroupedSample(
        name='dummy',
        nGroups=4,
        list_of_paths=sample_paths,
        list_of_trees=trees
    )
    assert(grouped_sample.name=='dummy')
    assert(len(grouped_sample.grouped_files) == grouped_sample.nGroups)

@pytest.fixture
def grouped_sample_fixture(sample_paths, trees, unprescaled_triggers):
    the_sample = GroupedSample(
        name='dummy',
        nGroups = 100,
        list_of_paths = sample_paths,
        list_of_trees = trees
    )
    for i in range(100):
        the_sample.grouped_dfs[i] = filter_bad_events(the_sample.grouped_dfs[i])
        the_sample.grouped_dfs[i] = define_cicada_average_variable(the_sample.grouped_dfs[i])
        the_sample.grouped_dfs[i] = make_pure_event_variable_from_list(the_sample.grouped_dfs[i], unprescaled_triggers)
    return the_sample
