import ROOT
from pathlib import Path
from .samples import construct_data_samples
from .definitions import add_all_values
from .histogram_utilities import draw_cms_latex

from rich.console import Console
import cmsstyle

console = Console()

#Okay, we need a plot of L1 Jet HT Sum
#We need pt miss
#And we need the sum of EG PT, to match axol1tl
def book_base_plots(
        data_sample,
        score_name,
        working_point
):
    #Let's start by getting the HT Sum Plot
    total_HT_booking = data_sample.df.Histo1D(
        (
            'Event_HT_all',
            'Event_HT_all',
            13,
            0.0,
            1300.0,
        ),
        'eventHT'
    )

    working_point_HT_booking = data_sample.df.Filter(f'{score_name} > {working_point}').Histo1D(
        (
            f'Event_HT_{score_name}',
            f'Event_HT_{score_name}',
            13,
            0.0,
            1300.0,
        ),
        'eventHT',
    )

    #Then the same for the MET
    total_MET_booking = data_sample.df.Histo1D(
        (
            f'Event_MET_all',
            f'Event_MET_all',
            25,
            0.0,
            250.0,
        ),
        'eventMET',
    )

    working_point_MET_booking = data_sample.df.Filter(f'{score_name} > {working_point}').Histo1D(
        (
            f'Event_MET_{score_name}',
            f'Event_MET_{score_name}',
            25,
            0.0,
            250.0,
        ),
        'eventMET',
    )

    #EG PT sum bookings
    total_eg_sum_booking = data_sample.df.Histo1D(
        (
            f'Event_egSum_all',
            f'Event_egSum_all',
            10,
            0.0,
            1000.0
        ),
        'eg_pt_sum',
    )

    working_point_eg_sum_booking = data_sample.df.Filter(f'{score_name} > {working_point}').Histo1D(
        (
            f'Event_egSum_{score_name}',
            f'Event_egSum_{score_name}',
            10,
          0.0,
            1000.0,
        ),
        'eg_pt_sum',
    )

    bookings = [
        total_HT_booking,
        working_point_HT_booking,
        total_MET_booking,
        working_point_MET_booking,
        total_eg_sum_booking,
        working_point_eg_sum_booking,
    ]

    return bookings

def book_object_plots(
        data_sample,
        score_name,
        working_point        
):
    total_L1_Jets = data_sample.df.Histo1D(
        (
            'Event_L1_Jets',
            'Event_L1_Jets',
            14,
            0.0,
            14.0,
        ),
        'nJets',
    )

    working_point_L1_Jets = data_sample.df.Filter(f'{score_name} > {working_point}').Histo1D(
        (
            f'Event_L1_Jets_{score_name}',
            f'Event_L1_Jets_{score_name}',
            14,
            0.0,
            14.0,
        ),
        'nJets'
    )

    total_L1_Muons = data_sample.df.Histo1D(
        (
            'Event_L1_Muons',
            'Event_L1_Muons',
            14,
            0.0,
            14.0,
        ),
        'nMuons',
    )

    working_point_L1_Muons = data_sample.df.Filter(f'{score_name} > {working_point}').Histo1D(
        (
            f'Event_L1_Muons_{score_name}',
            f'Event_L1_Muons_{score_name}',
            14,
            0.0,
            14.0,
        ),
        'nMuons'
    )

    total_L1_EGs = data_sample.df.Histo1D(
        (
            'Event_L1_EGs',
            'Event_L1_EGs',
            12,
            0.0,
            12.0,
        ),
        'nEGs',
    )

    working_point_L1_EGs = data_sample.df.Filter(f'{score_name} > {working_point}').Histo1D(
        (
            f'Event_L1_EGs_{score_name}',
            f'Event_L1_EGs_{score_name}',
            12,
            0.0,
            12.0,
        ),
        'nEGs'
    )

    total_L1_Taus = data_sample.df.Histo1D(
        (
            'Event_L1_Taus',
            'Event_L1_Taus',
            12,
            0.0,
            12.0,
        ),
        'nTaus',
    )

    working_point_L1_Taus = data_sample.df.Filter(f'{score_name} > {working_point}').Histo1D(
        (
            f'Event_L1_Taus_{score_name}',
            f'Event_L1_Taus_{score_name}',
            12,
            0.0,
            12.0,
        ),
        'nTaus'
    )

    bookings = [
        total_L1_Jets,
        working_point_L1_Jets,
        total_L1_Muons,
        working_point_L1_Muons,
        total_L1_EGs,
        working_point_L1_EGs,
        total_L1_Taus,
        working_point_L1_Taus,
    ]

    return bookings

def draw_overall_plot(
        total_plot,
        working_point_plot,
        x_axis_label,
        plot_name,
        output_path,
):
    total_plot = total_plot.GetValue()
    working_point_plot = working_point_plot.GetValue()

    # the_canvas = ROOT.TCanvas(
    #     f'{plot_name}',
    #     f'{plot_name}',
    #     800,
    #     600,
    # )

    # the_canvas.SetLogy()
    # the_canvas.SetTicks()
    cmsstyle.SetLumi(11.47)
    cmsstyle.SetEnergy(13.6)
    max_val = total_plot.GetMaximum()
    the_canvas = cmsstyle.cmsCanvas(
        f'{plot_name}',
        x_min = total_plot.GetXaxis().GetXmin(),
        x_max = total_plot.GetXaxis().GetXmax(),
        y_min = 1.0,
        y_max = max_val*1000.0,
        nameXaxis = f'{x_axis_label}',
        nameYaxis = 'Events',
        yTitOffset = 1.25,
        extraSpace=0.05,
    )
    the_canvas.SetLogy()

    # total_plot.Draw('HIST MIN0')
    # total_plot.SetLineColor(
    #     ROOT.TColor.GetColor('#5790FCFF')
    # )
    # total_plot.SetLineWidth(2)
    # total_plot.GetYaxis().SetRangeUser(1.0, max_val*100.0)
    # total_plot.GetYaxis().SetTitle('Events')
    # total_plot.SetTitle('')
    # total_plot.GetXaxis().SetTitle(x_axis_label)
    cmsstyle.cmsDraw(
        h=total_plot,
        style='HIST E',
        lcolor = ROOT.TColor.GetColor('#5790FCFF'),
        lwidth = 3,
        fstyle=0,
        msize=0.0,
    )

    # working_point_plot.Draw('HIST SAME')
    # working_point_plot.SetLineColor(
    #     ROOT.TColor.GetColor('#F89C20FF')
    # )
    # working_point_plot.SetLineWidth(2)
    cmsstyle.cmsDraw(
        h=working_point_plot,
        style='HIST SAME E',
        lcolor = ROOT.TColor.GetColor('#FFA90EFF'),
        lwidth=3,
        fstyle=0,
        msize=0.0,
    )

    # the_legend = ROOT.TLegend(
    #     0.55,
    #     0.7,
    #     0.9,
    #     0.9,
    # )
    # the_legend.SetFillStyle(0)
    # the_legend.SetLineWidth(0)
    the_legend = cmsstyle.cmsLeg(
        0.50,
        0.7,
        0.85,
        0.9
    )
    the_legend.AddEntry(total_plot, 'All Zero Bias', 'l')
    the_legend.AddEntry(working_point_plot, 'CICADA Nominal', 'l')
    the_legend.Draw()

    cmsstyle.cmsHeader(the_legend, 'Zero Bias Triggered Events')

    # draw_cms_latex()
    # lumi_latex = ROOT.TLatex()
    # lumi_latex.SetTextSize(0.05)
    # lumi_latex.SetNDC(True)
    # lumi_latex.SetTextAlign(32)
    # lumi_latex.DrawLatex(0.9, 0.92, "#font[42]{2024I (13.6 TeV)}")

    the_canvas.SaveAs(
        f'{output_path}/{plot_name}.png'
    )

    the_canvas.SaveAs(
        f'{output_path}/{plot_name}.pdf'
    )

def draw_eff_plot(
        total_plot,
        working_point_plot,
        x_axis_label,
        plot_name,
        output_path,
        scale_y_axis=None,
        extra_space=False
):
    cmsstyle.SetLumi(11.47)
    cmsstyle.SetEnergy(13.6)

    total_plot = total_plot.GetValue()
    working_point_plot = working_point_plot.GetValue()

    dummy_plot = ROOT.TH1D(
        'dummy',
        'dummy',
        total_plot.GetNbinsX(),
        total_plot.GetXaxis().GetXmin(),
        total_plot.GetXaxis().GetXmax(),
    )

    
    # the_canvas = ROOT.TCanvas(
    #     f'{plot_name}',
    #     f'{plot_name}',
    #     800,
    #     600,
    # )
    # #the_canvas.SetLogy()
    # the_canvas.SetTicks()
    if scale_y_axis is None:
        y_max = 140.0
    else:
        y_max = scale_y_axis

    if extra_space:
        the_canvas = cmsstyle.cmsCanvas(
            f'{plot_name}',
            x_min = dummy_plot.GetXaxis().GetXmin(),
            x_max = dummy_plot.GetXaxis().GetXmax(),
            y_min = 0.0,
            y_max = y_max,
            nameXaxis = f'{x_axis_label}',
            nameYaxis = f'Acceptance [%]',
            yTitOffset=1.9,
            extraSpace=0.1,
        )
    else:
        the_canvas = cmsstyle.cmsCanvas(
            f'{plot_name}',
            x_min = dummy_plot.GetXaxis().GetXmin(),
            x_max = dummy_plot.GetXaxis().GetXmax(),
            y_min = 0.0,
            y_max = y_max,
            nameXaxis = f'{x_axis_label}',
            nameYaxis = f'Acceptance [%]',
            yTitOffset=1.12,
        )
    #the_canvas.SetGridx()
    #the_canvas.SetGridy()

    ratio_plot = working_point_plot.Clone()
    ratio_plot.Divide(total_plot)
    ratio_plot.Scale(100.0)

    ratio_graph = ROOT.TGraphAsymmErrors()
    max_point_val = None
    console.log(f'{plot_name}')
    for bin_num in range(1, ratio_plot.GetNbinsX()+1):
        point_num = bin_num
        low_edge = ratio_plot.GetXaxis().GetBinLowEdge(bin_num)
        value = ratio_plot.GetBinContent(bin_num)
        if max_point_val is None or value > max_point_val:
            max_point_val = value

        console.log(f'{low_edge}: {value}. {working_point_plot.GetBinContent(bin_num)}/{total_plot.GetBinContent(bin_num)}')
        ratio_graph.AddPoint(low_edge, value)

        error_up = working_point_plot.GetBinError(bin_num)
        try:
            error_up = (error_up / total_plot.GetBinContent(bin_num))*100.0
        except ZeroDivisionError:
            error_up = 0.0
        # error_up = ratio_plot.GetBinError(bin_num)
        if value + error_up > 100.0:
            error_up = 100.0 - value
        error_down = working_point_plot.GetBinError(bin_num)
        try:
            error_down = (error_down / total_plot.GetBinContent(bin_num))*100.0
        except ZeroDivisionError:
            error_down = 0.0
        #error_down = ratio_plot.GetBinError(bin_num)
        if value - error_down < 0.0:
            error_down = value

        ratio_graph.SetPointEYhigh(point_num, error_up)
        ratio_graph.SetPointEYlow(point_num, error_down)

    cmsstyle.cmsDraw(
        dummy_plot,
        style='hist',
    )
        
    ratio_graph.Draw('L')
    ratio_graph.SetLineWidth(2)
    ratio_graph.SetLineColor(
        ROOT.TColor.GetColor('#F89C20FF')
    )
    
    x_1 = ratio_plot.GetXaxis().GetBinLowEdge(1)
    x_2 = ratio_plot.GetXaxis().GetBinUpEdge(ratio_plot.GetNbinsX())
    the_line = ROOT.TLine(x_1, 100.0, x_2, 100.0)
    #the_line.SetLineWidth(2)
    #the_line.SetLineStyle(2)
    #the_line.SetLineColor(ROOT.kBlack)
    #the_line.Draw()
    cmsstyle.cmsDrawLine(
        the_line,
        lcolor=ROOT.kBlack,
        lstyle=2,
        lwidth=2,
    )

    #the_legend = ROOT.TLegend(0.6, 0.7, 0.9, 0.9)
    # legendOffset = 0.0
    # if extra_space:
    #     legendOffset += 0.1
    the_legend = cmsstyle.cmsLeg(
        0.52,
        0.8,
        0.77,
        0.9,
    )
    the_legend.AddEntry(ratio_graph, "CICADA Nominal", 'l')
    the_legend.Draw()

    cmsstyle.cmsHeader(the_legend, 'Zero Bias Triggered Events')

    #the_legend.SetFillStyle(0)
    #the_legend.SetLineWidth(0)

    # draw_cms_latex()
    # lumi_latex = ROOT.TLatex()
    # lumi_latex.SetTextSize(0.05)
    # lumi_latex.SetNDC(True)
    # lumi_latex.SetTextAlign(32)
    # lumi_latex.DrawLatex(0.9, 0.92, "#font[42]{2024I (13.6 TeV)}")
    
    the_canvas.SaveAs(
        f'{output_path}/{plot_name}.png'
    )

    the_canvas.SaveAs(
        f'{output_path}/{plot_name}.pdf'
    )

def main(args):
    ROOT.gStyle.SetOptStat(0)

    cmsstyle.setCMSStyle(True)
    
    console.log('Getting Samples')
    data_samples = construct_data_samples()

    console.log('Defining quantities')
    add_all_values(data_samples['RunI'])

    if args.debug:
        data_samples['RunI'].df = data_samples['RunI'].df.Range(10000)

    console.log('Booking plots')
    cicada_v2024_bookings = book_base_plots(
        data_samples['RunI'],
        'CICADA_v2p1p2',
        121.0,
    )

    cicada_v2024_object_bookings = book_object_plots(
        data_samples['RunI'],
        'CICADA_v2p1p2',
        121.0
    )

    cicada_v2025_bookings = book_base_plots(
        data_samples['RunI'],
        'CICADA_v2p2p0',
        80.0,
    )

    cicada_v2025_object_bookings = book_object_plots(
        data_samples['RunI'],
        'CICADA_v2p2p0',
        80.0,
    )

    console.log('Performing Draw')
    output_location = Path('PaperPlots/Eff_Plots')
    output_location.mkdir(exist_ok=True, parents=True)

    #2024 draw overall plots
    draw_overall_plot(
        cicada_v2024_bookings[0],
        cicada_v2024_bookings[1],
        'L1 Jet H_{T} [GeV]',
        'CICADA_v2024_L1JetHT',
        output_location
    )

    draw_overall_plot(
        cicada_v2024_bookings[2],
        cicada_v2024_bookings[3],
        'L1 p_{T}^{miss} [GeV]',
        'CICADA_v2024_L1MET',
        output_location
    )

    draw_overall_plot(
        cicada_v2024_bookings[4],
        cicada_v2024_bookings[5],
        'L1EG #Sigma p_{T} [GeV]',
        'CICADA_v2024_EGPTSum',
        output_location
    )

    # 2024 draw overall object plots
    draw_overall_plot(
        cicada_v2024_object_bookings[0],
        cicada_v2024_object_bookings[1],
        'N_{L1 Jets}',
        'CICADA_v2024_NL1Jets',
        output_location
    )

    draw_overall_plot(
        cicada_v2024_object_bookings[2],
        cicada_v2024_object_bookings[3],
        'N_{L1 Mus}',
        'CICADA_v2024_NL1Mus',
        output_location
    )

    draw_overall_plot(
        cicada_v2024_object_bookings[4],
        cicada_v2024_object_bookings[5],
        'N_{L1 EGs}',
        'CICADA_v2024_NL1EGs',
        output_location
    )

    draw_overall_plot(
        cicada_v2024_object_bookings[6],
        cicada_v2024_object_bookings[7],
        'N_{L1 Taus}',
        'CICADA_v2024_NL1Taus',
        output_location
    )

    #2025 draw overall plots
    draw_overall_plot(
        cicada_v2025_bookings[0],
        cicada_v2025_bookings[1],
        'L1 Jet H_{T} [GeV]',
        'CICADA_v2025_L1JetHT',
        output_location
    )

    draw_overall_plot(
        cicada_v2025_bookings[2],
        cicada_v2025_bookings[3],
        'L1 p_{T}^{miss} [GeV]',
        'CICADA_v2025_L1MET',
        output_location
    )

    draw_overall_plot(
        cicada_v2025_bookings[4],
        cicada_v2025_bookings[5],
        'L1EG #Sigma p_{T} [GeV]',
        'CICADA_v2025_EGPTSum',
        output_location
    )

    # 2025 draw overall object bookings
    draw_overall_plot(
        cicada_v2025_object_bookings[0],
        cicada_v2025_object_bookings[1],
        'N_{L1 Jets}',
        'CICADA_v2025_NL1Jets',
        output_location
    )

    draw_overall_plot(
        cicada_v2025_object_bookings[2],
        cicada_v2025_object_bookings[3],
        'N_{L1 Mus}',
        'CICADA_v2025_NL1Mus',
        output_location
    )

    draw_overall_plot(
        cicada_v2025_object_bookings[4],
        cicada_v2025_object_bookings[5],
        'N_{L1 EGs}',
        'CICADA_v2025_NL1EGs',
        output_location
    )

    draw_overall_plot(
        cicada_v2025_object_bookings[6],
        cicada_v2025_object_bookings[7],
        'N_{L1 Taus}',
        'CICADA_v2025_NL1Taus',
        output_location
    )

#2024 draw eff plots
    draw_eff_plot(
        cicada_v2024_bookings[0],
        cicada_v2024_bookings[1],
        'L1 Jet H_{T} [GeV]',
        'CICADA_v2024_L1JetHT_eff',
        output_location
    )

    draw_eff_plot(
        cicada_v2024_bookings[2],
        cicada_v2024_bookings[3],
        'L1 p_{T}^{miss} [GeV]',
        'CICADA_v2024_L1MET_eff',
        output_location
    )

    draw_eff_plot(
        cicada_v2024_bookings[4],
        cicada_v2024_bookings[5],
        'L1EG #Sigma p_{T} [GeV]',
        'CICADA_v2024_EGPTSum_eff',
        output_location
    )

    cmsstyle.cmsGrid(True)
    
    #2024 object eff plots
    draw_eff_plot(
        cicada_v2024_object_bookings[0],
        cicada_v2024_object_bookings[1],
        'N_{L1 Jets}',
        'CICADA_v2024_NL1Jets_eff',
        output_location,
        scale_y_axis=8.0,
    )

    draw_eff_plot(
        cicada_v2024_object_bookings[2],
        cicada_v2024_object_bookings[3],
        'N_{L1 Mus}',
        'CICADA_v2024_NL1Mus_eff',
        output_location,
        scale_y_axis=0.05,
        extra_space=True,
    )

    draw_eff_plot(
        cicada_v2024_object_bookings[4],
        cicada_v2024_object_bookings[5],
        'N_{L1 EGs}',
        'CICADA_v2024_NL1EGs_eff',
        output_location,
        scale_y_axis=0.05,
        extra_space=True,
    )

    draw_eff_plot(
        cicada_v2024_object_bookings[6],
        cicada_v2024_object_bookings[7],
        'N_{L1 Taus}',
        'CICADA_v2024_NL1Taus_eff',
        output_location,
        scale_y_axis=0.001,
        extra_space=True,
    )
    
    #2025 draw eff plots
    draw_eff_plot(
        cicada_v2025_bookings[0],
        cicada_v2025_bookings[1],
        'L1 Jet H_{T} [GeV]',
        'CICADA_v2025_L1JetHT_eff',
        output_location
    )

    draw_eff_plot(
        cicada_v2025_bookings[2],
        cicada_v2025_bookings[3],
        'L1 p_{T}^{miss} [GeV]',
        'CICADA_v2025_L1MET_eff',
        output_location
    )

    draw_eff_plot(
        cicada_v2025_bookings[4],
        cicada_v2025_bookings[5],
        'L1EG #Sigma p_{T} [GeV]',
        'CICADA_v2025_EGPTSum_eff',
        output_location
    )

    #2025 object eff plots
    draw_eff_plot(
        cicada_v2025_object_bookings[0],
        cicada_v2025_object_bookings[1],
        'N_{L1 Jets}',
        'CICADA_v2025_NL1Jets_eff',
        output_location,
        scale_y_axis=8.0,
    )

    draw_eff_plot(
        cicada_v2025_object_bookings[2],
        cicada_v2025_object_bookings[3],
        'N_{L1 Mus}',
        'CICADA_v2025_NL1Mus_eff',
        output_location,
        scale_y_axis=0.05,
        extra_space=True,
    )

    draw_eff_plot(
        cicada_v2025_object_bookings[4],
        cicada_v2025_object_bookings[5],
        'N_{L1 EGs}',
        'CICADA_v2025_NL1EGs_eff',
        output_location,
        scale_y_axis=0.05,
        extra_space=True,
    )

    draw_eff_plot(
        cicada_v2025_object_bookings[6],
        cicada_v2025_object_bookings[7],
        'N_{L1 Taus}',
        'CICADA_v2025_NL1Taus_eff',
        output_location,
        scale_y_axis=0.001,
        extra_space=True,
    )
    console.log('Done')
