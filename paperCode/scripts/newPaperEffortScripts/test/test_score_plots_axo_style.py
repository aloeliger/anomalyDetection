import pytest
import ROOT
import newPaperEffortScripts.src.score_plots_axo_style as test_script
from newPaperEffortScripts.src.definitions import add_all_values

import tempfile

from .test_samples import lowStatData

def test_book_CICADA_score_plots(lowStatData):
    add_all_values(lowStatData)
    bookings = test_script.book_CICADA_score_plots(lowStatData, 'dummy', 'CICADA_v2p1p2', 5.0)

    assert(bookings is not None)

def test_draw_cicada_input_plots(lowStatData):
    add_all_values(lowStatData)
    bookings = test_script.book_CICADA_score_plots(lowStatData, 'dummy', 'CICADA_v2p1p2', 5.0)

    with tempfile.TemporaryDirectory() as tempdir:
        test_script.draw_axo_style_score_plot(
            *bookings,
            'CICADA_v2p1p2',
            tempdir,
        )
