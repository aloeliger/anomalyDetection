import pytest
import ROOT
import newPaperEffortScripts.src.paper_validation_plots as test_script
import tempfile

from .test_samples import singleNeutrinoSample, dataSample, lowStatSingleNeutrino, lowStatData

def test_book_CICADA_input_plots(singleNeutrinoSample, dataSample):
    bookings = test_script.book_cicada_input_plots(
        dataSample,
        singleNeutrinoSample
    )

    assert(bookings is not None)
    assert(type(bookings) == type(dict()))

    for variable_name in bookings:
        assert('overall' in bookings[variable_name])
        for eta_bin in range(7):
            assert(bookings[variable_name][f'iEta{eta_bin}'] is not None)

@pytest.fixture
def dummy_1d_histogram():
    theHist = ROOT.TH1D('dummy', 'dummy', 3, 1.0, 4.0)
    theHist.Fill(1.0, 1.0)
    theHist.Fill(2.0, 2.0)
    theHist.Fill(3.0, 3.0)
    return theHist

def test_style_data_plot(dummy_1d_histogram):
    thePlot = test_script.style_data_cicada_input_plot(dummy_1d_histogram)
    assert(thePlot is not None)

def test_style_neutrino_plot(dummy_1d_histogram):
    thePlot = test_script.style_neutrino_cicada_input_plot(dummy_1d_histogram)
    assert(thePlot is not None)

def test_setup_ratio_canvas():
    theCanvas = ROOT.TCanvas()
    theCanvas, topPad, bottomPad = test_script.setup_ratio_canvas(theCanvas)
    assert(theCanvas is not None)
    assert(topPad is not None)
    assert(bottomPad is not None)

def test_set_data_plot_axes(dummy_1d_histogram):
    data_plot = test_script.set_data_plot_axes(dummy_1d_histogram)
    assert(data_plot.GetTitle() == '')
    assert(data_plot.GetXaxis().GetTitle() == '')
    assert(data_plot.GetYaxis().GetTitle() == 'A.U.')

def test_set_ratio_plot_axes(dummy_1d_histogram):
    ratio_plot = test_script.set_ratio_plot_axes(dummy_1d_histogram, x_axis='dummy')
    assert(ratio_plot.GetTitle() == '')
    assert(ratio_plot.GetXaxis().GetTitle() == 'dummy')
    assert(ratio_plot.GetYaxis().GetTitle() == 'Data/Simulation')

def test_draw_cicada_input_plots(lowStatData, lowStatSingleNeutrino):
    cicada_input_plots = test_script.book_cicada_input_plots(lowStatData, lowStatSingleNeutrino)
    with tempfile.TemporaryDirectory() as tempdir:
        test_script.draw_cicada_input_plots(
            cicada_input_plots['Data']['overall'],
            cicada_input_plots['SingleNeutrino']['overall'],
            tempdir,
            'dummy'
        )
    
