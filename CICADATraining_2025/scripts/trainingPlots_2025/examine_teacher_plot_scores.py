import ROOT
import h5py
import tensorflow.keras as keras
from rich.console import Console
import numpy as np
import os
from pathlib import Path
from src.utils import convert_eff_to_rate

console = Console()

def make_teacher_errors(predictions, inputs):
    return np.mean(
        (predictions - inputs)**2,
        axis=(1,2,3)
    )

def make_teacher_error_plot(errors):
    the_plot = ROOT.TH1D(
        'teacher_errors',
        'teacher_errors',
        100,
        0.0,
        10.0,
    )

    for error in errors:
        the_plot.Fill(error)
    return the_plot

def make_target_score_plot(target_scores):
    the_plot = ROOT.TH1D(
        'target_scores',
        'target_scores',
        256,
        0.0,
        256.0
    )

    for score in target_scores:
        the_plot.Fill(score)
    return the_plot

def make_rate_plot(score_plot):
    rate_plot = score_plot.Clone()
    n_score_bins = score_plot.GetNbinsX()

    complete_integral = score_plot.Integral(1, n_score_bins)

    for bin_num in range(1, n_score_bins+1):
        try:
            fraction = score_plot.Integral(bin_num, n_score_bins) / complete_integral
        except ZeroDivisionError:
            fraction = 0.0
        rate_plot.SetBinContent(
            bin_num,
            convert_eff_to_rate(fraction)
        )
    return rate_plot

def draw_rate_plot(
        the_plot,
        histo_name,
        xaxis_name='Score'
):
    the_canvas = ROOT.TCanvas('rate plot')
    the_plot.Draw('L')
    the_plot.SetLineColor(ROOT.kRed)
    the_plot.SetLineWidth(2)

    the_plot.GetXaxis().SetLineColor(xaxis_name)
    the_plot.GetYaxis().SetLineColor('Rate')

    the_canvas.SaveAs(histo_name)

def draw_teacher_plot(
        the_plot,
        output_name,
        xaxis_name='TeacherErrors'
):
    the_canvas = ROOT.TCanvas('teacher plot')
    the_plot.Scale(1.0/the_plot.Integral())

    the_plot.Draw('HIST')
    the_plot.SetLineColor(ROOT.kRed)
    the_plot.SetLineWidth(2)
    the_plot.SetFillColorAlpha(ROOT.kRed, 0.3)

    the_plot.GetXaxis().SetTitle(xaxis_name)
    the_plot.GetYaxis().SetTitle('A.U.')
    the_plot.SetTitle(xaxis_name)

    the_canvas.SaveAs(output_name)

def make_npv_dependency_graph(
        scores,
        npvs,
        histo_name,
        threshold=100.0
):
    rate_histo = ROOT.TH1D(
        'rate_histo',
        'rate_histo',
        30,
        30.0,
        60.0,
    )
    
    for npv in range(30,60):
        relevant_scores = scores[npvs == npv]
        the_score_plot = make_target_score_plot(relevant_scores)
        the_rate_plot = make_rate_plot(the_score_plot)
        rate_at_threshold = the_rate_plot.GetBinContent(
            the_rate_plot.FindBin(
                threshold
            )
        )
        rate_histo.SetBinContent(
            rate_histo.FindBin(npv),
            rate_at_threshold
        )
    draw_rate_plot(
        rate_histo,
        histo_name,
        xaxis_name='NPV'
    )
    
def main():
    console.log('Getting all the inputs')
    inputs = None
    purity = None
    npvs = None
    cicada_averages = None

    runs = [
        'RunC',
        'RunD',
        'RunE',
        'RunG',
        'RunH',
        'RunI',
    ]

    for run in runs:
        with h5py.File(f'PlotH5Files/{run}.h5') as theFile:
            if inputs is None:
                inputs = np.array(theFile['inputs'])
            else:
                inputs = np.append(
                    inputs,
                    np.array(theFile['inputs']),
                    axis=0
                )

            if purity is None:
                purity = np.array(theFile['purity'])
            else:
                purity = np.append(
                    purity,
                    np.array(theFile['purity']),
                    axis=0
                )

            if npvs is None:
                npvs = np.array(theFile['npvs'])
            else:
                npvs = np.append(
                    npvs,
                    np.array(theFile['npvs']),
                    axis=0
                )

            if cicada_averages is None:
                cicada_averages = np.array(theFile['cicada_averages'])
            else:
                cicada_averages = np.append(
                    cicada_averages,
                    np.array(theFile['cicada_averages']),
                    axis=0
                )

        console.print(inputs.shape)
    inputs = inputs.reshape((-1, 18, 14, 1))
    #Make teacher predictions
    cmssw_base = os.getenv('CMSSW_BASE')
    model_path = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/data/teachers/best-mse-trained/'
    the_teacher = keras.models.load_model(model_path)

    predictions = the_teacher.predict(inputs)
    teacher_errors = make_teacher_errors(predictions, inputs)

    #console.print(teacher_errors)
    output_path = Path('TeacherPlots')
    output_path.mkdir(exist_ok=True, parents=True)
    teacher_error_plot = make_teacher_error_plot(teacher_errors)
    histo_name = output_path/'teacher_errors.png'
    draw_teacher_plot(
        teacher_error_plot,
        str(histo_name)
    )

    #normal teacher adjustment
    normal_teacher_scores = np.log(teacher_errors) * 32
    normal_teacher_score_plot = make_target_score_plot(normal_teacher_scores)
    histo_name = output_path/'teacher_scores.png'
    draw_teacher_plot(
        normal_teacher_score_plot,
        str(histo_name),
    )

    normal_rate_plot = make_rate_plot(normal_teacher_score_plot)
    histo_name = output_path/'teacher_rates.png'
    draw_rate_plot(
        normal_rate_plot,
        str(histo_name)
    )

    #look at npv dependency
    histo_name = output_path/'teacher_rates_vs_npv.png'
    make_npv_dependency_graph(
        normal_teacher_scores,
        npvs,
        str(histo_name)
    )
    

if __name__ == '__main__':
    main()
