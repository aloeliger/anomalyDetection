import matplotlib.pyplot as plt
import h5py
import tensorflow.keras as keras
from rich.console import Console
from pathlib import Path
import argparse
import numpy as np
import os

console = Console()            

def get_mean_npv_predictions(predictions, npvs):
    npv_bins = []
    prediction_means = []
    for npv in range(min(npvs),max(npvs)):
        npv_bins.append(npv)
        prediction_means.append(
            np.mean(
                predictions[npvs==npv]
            )
        )
    return npv_bins, prediction_means
        

def make_score_npvs_scatter(predictions, npvs, model_long_name, model_short_name, output_dir):
    fig = plt.figure(figsize=(8, 8))
    gs = fig.add_gridspec(2, 2,  width_ratios=(7, 2), height_ratios=(2, 7),
                          left=0.1, right=0.9, bottom=0.1, top=0.9,
                          wspace=0.1, hspace=0.1)
    # Main scatter plot
    ax_main = fig.add_subplot(gs[1, 0])
    ax_main.scatter(npvs, predictions, marker='.')
    #ax_main.plot(npvs, predictions, linestyle='-')

    npv_bins, prediction_means = get_mean_npv_predictions(predictions, npvs)
    ax_main.plot(npv_bins, prediction_means, linestyle='-', c='red')
    
    ax_main.set(xlabel='NPVS', ylabel='Student Scores')

    # X-axis profile plot
    ax_x_profile = fig.add_subplot(gs[0, 0], sharex=ax_main)
    ax_x_profile.hist(npvs, bins=30)
    ax_x_profile.axis('off')

    # Y-axis profile plot
    ax_y_profile = fig.add_subplot(gs[1, 1], sharey=ax_main)
    ax_y_profile.hist(predictions, bins=30, orientation='horizontal')
    ax_y_profile.axis('off')

    # Remove overlapping ticks and labels
    plt.setp(ax_x_profile.get_xticklabels(), visible=False)
    plt.setp(ax_y_profile.get_yticklabels(), visible=False)

    # Show the plot
    #plt.show()
    plt.savefig(f'{output_dir}/{model_short_name}.pdf')
    plt.savefig(f'{output_dir}/{model_short_name}.png')

def make_score_plot(
        predictions,
        model_long_name,
        model_short_name,
        output_dir
):
    fig = plt.figure(figsize=(8,8))

    for sample in predictions:
        plt.hist(
            predictions[sample][model_long_name],
            bins=40,
            alpha=0.3,
            label=f'{sample}',
            density=True
        )
    plt.xlabel('CICADA Score')
    plt.ylabel('A.U.')
    plt.title(model_long_name)

    plt.legend(loc='upper right')

    plt.savefig(f'{output_dir}/{model_short_name}.pdf')
    plt.savefig(f'{output_dir}/{model_short_name}.png')
    
def main(args):
    base_path = Path(args.input_dir)
    
    samples = [
        'RunC',
        'RunD',
        'RunE',
        'RunG',
        'RunH',
        'RunI',
    ]

    cmssw_base = os.getenv('CMSSW_BASE')
    models = {
        'Teacher Score Only (Weighted)': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/teacher_score_only_student/',
        'Legacy Method': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/',
        'NPV Scaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-npv-scaled/',
        'ET scaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-et-scaled/',
        'Andrew ET scaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/cicada_average_weighted_student/',
        'Andrew NPV scaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/npv_weighted_student/',
    }
    for model in models:
        models[model] = keras.models.load_model(models[model])

    condensed_names = {
        'Teacher Score Only (Weighted)': 'AndrewTeacherOnly',
        'Legacy Method': 'LegacyMethod',
        'NPV Scaled': 'NPVScaled',
        'ET scaled': 'ETScaled',
        'Andrew ET scaled': 'AndrewETScaled',
        'Andrew NPV scaled': 'AndrewNPVScaled',
    }

    #Let's get all the stuff we need
    inputs = {}
    purity = {}
    npvs = {}
    cicada_average = {}
    model_predictions = {}
    console.log("Making predictions")
    for sample in samples:
        console.log(f'\tSample: {sample}')
        console.log('\tFile:')
        file_path = base_path/f'{sample}.h5'
        console.log(f'\t{file_path}')
        with h5py.File(file_path) as theFile:
            inputs[sample] = np.array(theFile['inputs'])
            purity[sample] = np.array(theFile['purity'])
            npvs[sample] = np.array(theFile['npvs'])
            cicada_average[sample] = np.array(theFile['cicada_averages'])

        model_predictions[sample] = {}
        for model in models:
            console.log(f'\t\t{model}')
            model_predictions[sample][model] = models[model].predict(inputs[sample], verbose=0).reshape((-1,))

    console.log('Making score scatters')
    output_dir = Path('./MatplotlibPlots')
    for model in models:
        plot_dir = output_dir/'Student_score_npv_scatters'
        plot_dir.mkdir(exist_ok=True, parents=True)
        make_score_npvs_scatter(
            model_predictions['RunI'][model],
            npvs['RunI'],
            model,
            condensed_names[model],
            plot_dir,
        )

    console.log('Making Pure Score Plots')
    for model in models:
        plot_dir = output_dir/'Pure_score_plots'
        plot_dir.mkdir(exist_ok=True, parents=True)
        make_score_plot(
            model_predictions,
            model,
            condensed_names[model],
            plot_dir
        )
        
if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument(
        '--input_dir',
        default='PlotH5Files',
        nargs='?'
    )

    args = parser.parse_args()
    
    main(args)
