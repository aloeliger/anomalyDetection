import pytest
import ROOT
import tempfile
import newPaperEffortScripts.src.eff_plots as test_script
from newPaperEffortScripts.src.definitions import *

from .test_samples import lowStatData

def test_book_base_plots(lowStatData):
    add_all_values(lowStatData)
    bookings = test_script.book_base_plots(lowStatData, 'CICADA_v2p1p2', 5.0)

    assert(bookings is not None)

def test_book_object_plots(lowStatData):
    add_all_values(lowStatData)
    bookings = test_script.book_object_plots(lowStatData, 'CICADA_v2p1p2', 5.0)

    assert(bookings is not None)
    
def test_draw_overall_plot(lowStatData):
    add_all_values(lowStatData)
    bookings = test_script.book_base_plots(
        lowStatData,
        'CICADA_v2p1p2',
        5.0
    )

    with tempfile.TemporaryDirectory() as tempdir:
        test_script.draw_overall_plot(
            bookings[0],
            bookings[1],
            'dummy',
            'dummy',
            tempdir,
        )
        
def test_draw_eff_plot(lowStatData):
    add_all_values(lowStatData)
    bookings = test_script.book_base_plots(
        lowStatData,
        'CICADA_v2p1p2',
        5.0
    )

    with tempfile.TemporaryDirectory() as tempdir:
        test_script.draw_eff_plot(
            bookings[0],
            bookings[1],
            'dummy',
            'dummy',
            tempdir,
        )
