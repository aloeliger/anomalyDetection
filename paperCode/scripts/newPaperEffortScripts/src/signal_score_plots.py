import ROOT
from .samples import construct_data_samples, construct_mc_samples
from .definitions import add_all_values
from .histogram_utilities import draw_cms_latex
from pathlib import Path
from rich.console import Console

console = Console()

def book_score_plots(
        sample,
        sample_name,
        score_name,
        bins,
        min_val,
        max_val,
):
    total_score_plot = sample.df.Histo1D(
        (
            f'{score_name}_total_score',
            f'{score_name}_total_score',
            bins,
            min_val,
            max_val
        ),
        score_name
    )

    pure_score_plot = sample.df.Filter('pure_events == 1').Histo1D(
        (
            f'{score_name}_pure_score',
            f'{score_name}_pure_score',
            bins,
            min_val,
            max_val
        )
    )

    return total_score_plot, pure_score_plot


