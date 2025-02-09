import pytest
from pathlib import Path

@pytest.fixture
def unit_test_plot_dir():
    unit_test_plot_dir = Path('./UnitTestPlots/')
    unit_test_plot_dir.mkdir(exist_ok=True)
    return unit_test_plot_dir
