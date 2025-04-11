#!/usr/bin/env/python3
#A script to make a variant of AXO's score plot on Scouting/Zero Bias

import ROOT
from .samples import construct_data_samples
from .definitions import add_all_values
from .histogram_utilities import draw_cms_latex
from pathlib import Path
from rich.console import Console
import cmsstyle

console = Console()

def book_CICADA_score_plots(
        data_sample,
        sample_name,
        score_name,
        working_point,
):
    total_score_plot = data_sample.df.Histo1D(
        (
            f'{score_name}_total_score',
            f'{score_name}_total_score',
            90,
            0.0,
            180.0
        ),
        score_name
    )

    working_point_df = data_sample.df.Filter(f'{score_name} > {working_point}')
    pure_score_plot = working_point_df.Filter('pure_event == 1').Histo1D(
        (
            f'{score_name}_pure_score',
            f'{score_name}_pure_score',
            90,
            0.0,
            180.0,
        ),
        score_name
    )

    working_point_plot = working_point_df.Histo1D(
        (
            f'{score_name}_working_point_score',
            f'{score_name}_working_point_score',
            90,
            0.0,
            180.0,
        ),
        score_name
    )

    return total_score_plot, pure_score_plot, working_point_plot

def draw_axo_style_score_plot(
        total_score_plot,
        pure_score_plot,
        working_point_plot,
        score_name,
        output_path
):
    total_score_plot = total_score_plot.GetValue()
    working_point_plot = working_point_plot.GetValue()
    pure_score_plot = pure_score_plot.GetValue()

    cmsstyle.SetLumi(
        2.42,
    )
    cmsstyle.SetEnergy(
        13.6,
    )

    cmsstyle.AppendAdditionalInfo('2024I Zero Bias')
    cmsstyle.AppendAdditionalInfo('Runs 386594,386604,386618,')
    cmsstyle.AppendAdditionalInfo('386640,386661 & 386668')
    
    the_canvas = cmsstyle.cmsCanvas(
        f'{score_name}_canvas',
        x_min = total_score_plot.GetXaxis().GetXmin(),
        x_max = total_score_plot.GetXaxis().GetXmax(),
        y_min = 1.0,
        y_max = total_score_plot.GetMaximum()*1000,
        nameXaxis = "Emulated CIADA Score",
        nameYaxis = "Events",
    )
    #the_canvas = ROOT.TCanvas(f'{score_name}_canvas',f'{score_name}_canvas')
    the_canvas.SetLogy()
    #the_canvas.SetTicks()
    
    #total_score_plot.Draw('HIST MIN0')
    #total_score_plot.SetLineColor(
    #    ROOT.TColor.GetColor('#3F90DAFF')
    #)
    #total_score_plot.SetLineWidth(2)
    #max_val = total_score_plot.GetMaximum()
    #total_score_plot.GetYaxis().SetRangeUser(1.0, max_val*3)
    #total_score_plot.SetTitle('')
    cmsstyle.cmsDraw(
        h=total_score_plot,
        style='HIST',
        lcolor = ROOT.TColor.GetColor('#3F90DAFF'),
        lwidth=3,
        fstyle=0
    )

    #working_point_plot.Draw('HIST SAME MIN0')
    #working_point_plot.SetLineColor(
    #    ROOT.TColor.GetColor('#FFA90EFF')
    #)
    #working_point_plot.SetLineWidth(2)
    cmsstyle.cmsDraw(
        h=working_point_plot,
        style='HIST SAME',
        lcolor = ROOT.TColor.GetColor('#FFA90EFF'),
        lwidth=3,
        fstyle=0,
    )

    #pure_score_plot.Draw('HIST SAME MIN0')
    #pure_score_plot.SetLineColor(
    #    ROOT.TColor.GetColor('#BD1F01FF')
    #)
    #pure_score_plot.SetLineWidth(2)
    #pure_score_plot.SetLineStyle(2)
    cmsstyle.cmsDraw(
        h=pure_score_plot,
        style='HIST SAME',
        lcolor = ROOT.TColor.GetColor('#BD1F01FF'),
        lstyle=2,
        lwidth=3,
        fstyle=0,
    )

    the_legend = cmsstyle.cmsLeg(
        0.6,
        0.4,
        0.9,
        0.7,
    )
    #the_legend.SetFillStyle(0)
    #the_legend.SetLineWidth(0)
    the_legend.AddEntry(total_score_plot, 'All Zero Bias', 'l')
    the_legend.AddEntry(working_point_plot, 'CICADA Nominal', 'l')
    the_legend.AddEntry(pure_score_plot, 'CICADA Pure', 'l')
    the_legend.Draw()
    
    #draw_cms_latex()

    #TODO Replace with Header
    # run_latex = ROOT.TLatex()
    # run_latex.SetTextSize(0.0375)
    # run_latex.SetNDC(True)
    # run_latex.SetTextAlign(11)
    # #run_latex.DrawLatex(0.85, 0.85, '#font[42]{Runs 386594,386604,386618,386640,386661 & 386668}')
    # run_latex.DrawLatex(0.635, 0.83, '#font[42]{Runs 386594, 386604}')
    # run_latex.DrawLatex(0.635, 0.8, '#font[42]{386618, 386640}')
    # run_latex.DrawLatex(0.635, 0.77, '#font[42]{386661 & 386668}')

    # cmsstyle.cmsHeader(
    #    leg = the_legend,
    #    legTitle = "Runs 386594,386604,386618,386640,386661 & 386668",
    # )

    # Run 386594: 335.306 pb^-1
    # Run 386604: 843.800 pb^-1
    # Run 386618: 378.949 pb^-1
    # Run 386640: 519.429 pb^-1
    # Run 386661: 188.446 pb^-1
    # Run 386668: 149.928 pb^-1
    
    #lumi_latex = ROOT.TLatex()
    #lumi_latex.SetTextSize(0.05)
    #lumi_latex.SetNDC(True)
    #lumi_latex.SetTextAlign(32)
    #lumi_latex.DrawLatex(0.9, 0.93, '#font[42]{2.42 fb^{-1}}')
    
    the_canvas.SaveAs(
        f'{output_path}/score_{score_name}.png'
    )
    the_canvas.SaveAs(
        f'{output_path}/score_{score_name}.pdf'
    )

def main(args):
    #ROOT.gStyle.SetOptStat(0)
    cmsstyle.setCMSStyle(force=ROOT.kTRUE)

    console.log('Getting samples')
    data_samples = construct_data_samples()

    console.log('Defining quantities')
    add_all_values(data_samples['RunI_SpecificRuns'])

    console.log('Booking plots')
    CICADA_v2p1p2_score_plots = book_CICADA_score_plots(
        data_samples['RunI_SpecificRuns'],
        'Data_SpecificRuns',
        'CICADA_v2p1p2',
        121.0,
    )

    CICADA_v2p2p0_score_plots = book_CICADA_score_plots(
        data_samples['RunI_SpecificRuns'],
        'Data_SpecificRuns',
        'CICADA_v2p2p0',
        80.0
    )

    console.log('Performing Draw')
    outputLocation = Path('PaperPlots/CICADA_AXO_Style_Score_Plots')
    outputLocation.mkdir(exist_ok=True, parents=True)

    draw_axo_style_score_plot(
        *CICADA_v2p1p2_score_plots,
        'CICADA_v2p1p2',
        outputLocation,
    )

    draw_axo_style_score_plot(
        *CICADA_v2p2p0_score_plots,
        'CICADA_v2p2p0',
        outputLocation,
    )

    console.log('Done')
