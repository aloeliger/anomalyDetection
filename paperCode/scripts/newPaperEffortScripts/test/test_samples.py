import pytest
from newPaperEffortScripts.src.samples import Sample
from newPaperEffortScripts.src.samples import construct_data_samples
from newPaperEffortScripts.src.samples import construct_mc_samples

@pytest.fixture
def sample_paths():
    return ['/hdfs/store/user/aloelige/SingleNeutrino_E-10-gun/Paper_Ntuples_22Jan2025']

@pytest.fixture
def trees():
    return ['L1EventTree/l1EventTree']
    
def test_build_sample(sample_paths, trees):    
    df, chain, nFiles = Sample.build_sample(sample_paths, trees)
    assert(nFiles == 1758)
    assert(chain is not None)
    assert(df is not None)
    
def test_sample_class(sample_paths, trees):
    theSample=Sample(sample_paths, trees)
    assert(theSample is not None)
    assert(theSample.nFiles == 1758)
    assert(theSample.chain is not None)
    assert(theSample.df is not None)

def test_construct_data_samples():
    data_sample_collection = construct_data_samples()
    assert(data_sample_collection is not None)
    assert(type(data_sample_collection) == type(dict()))

    for sample in ['Data']:
        assert(data_sample_collection[sample] is not None)
        assert(data_sample_collection[sample].nFiles != 0)

def test_construct_mc_samples():
    mc_sample_collection=construct_mc_samples()
    assert(mc_sample_collection is not None)
    assert(type(mc_sample_collection) == type(dict()))

    assert(mc_sample_collection['SingleNeutrino'] is not None)
    assert(mc_sample_collection['SingleNeutrino'].nFiles != 0)

@pytest.fixture
def singleNeutrinoSample():
    return construct_mc_samples()['SingleNeutrino']

@pytest.fixture
def dataSample():
    return construct_data_samples()['Data']

@pytest.fixture
def lowStatSingleNeutrino():
    return construct_mc_samples(limit_files=1)['SingleNeutrino']

@pytest.fixture
def lowStatData():
    return construct_data_samples(limit_files=1)['Data']

def test_limit_file_samples(lowStatSingleNeutrino):
    assert(lowStatSingleNeutrino.nFiles == 1)
