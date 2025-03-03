import matplotlib.pyplot as plt
import tensorflow.keras as keras
import numpy as np
import os
from pathlib import Path
import h5py
from rich.console import Console
from sklearn.metrics import mean_squared_error
from sklearn.dummy import DummyRegressor

console = Console()

def make_teacher_score_plot(
        scores,
        output_dir,
        title='',
):
    the_hist = plt.hist(
        scores,
        bins=256,
        range=(0,256),
        density=True,
        histtype='stepfilled',
        log=True,
        alpha=0.3,
        color='red',
        label='Scores'
    )

    plt.xlabel('Student targets')
    plt.ylabel('A.U.')
    plt.title(title)
    plt.legend(loc='upper right')
    plt.savefig(output_dir)
    plt.close()

def make_teacher_student_plot(
        teacher_scores,
        student_scores,
        output_dir,
        title='',
):
    teacher_hist = plt.hist(
        teacher_scores,
        bins=256,
        range=(0,256),
        density=True,
        histtype='stepfilled',
        log=True,
        alpha=0.3,
        color='red',
        label='Teacher scores'
    )

    student_hist = plt.hist(
        student_scores,
        bins=256,
        range=(0,256),
        density=True,
        histtype='stepfilled',
        log=True,
        alpha=0.3,
        color='skyblue',
        label='Student scores'
    )

    plt.xlabel('Scores')
    plt.ylabel('A.U.')
    plt.title(title)
    plt.legend(loc='upper right')
    plt.savefig(output_dir)
    plt.close()

def make_error_scatter(
        student_error,
        x_values,
        output_dir,
        title='',
        xaxis_name='Teacher Score'
):
    fig = plt.figure(figsize=(8,8))
    gs = fig.add_gridspec(
        2,
        2,
        width_ratios=(7,2),
        height_ratios=(2,7),
        left=0.1,
        right=0.9,
        bottom=0.1,
        top=0.9,
        wspace=0.1,
        hspace=0.1
    )

    ax_main = fig.add_subplot(gs[1,0])
    ax_main.scatter(x_values, student_error, marker='.', alpha=0.3, color='blue')
    ax_main.set(xlabel=xaxis_name, ylabel='Student Errors')

    x_hist, x_bins = np.histogram(x_values, bins=30)
    mean_vals = []
    for i in range(len(x_bins)-1):
        mask = (x_values >= x_bins[i]) & (x_values < x_bins[i+1])
        mean_vals.append(
            np.mean(student_error[mask])
        )
    ax_main.plot(x_bins[:-1], mean_vals, linestyle='-', c='red', label='mean error')
    ax_main.legend(loc='upper left')

    ax_x_profile = fig.add_subplot(gs[0, 0], sharex=ax_main)
    ax_x_profile.hist(x_values, bins=30, density=True)
    #ax_x_profile.axis('off')

    ax_y_profile = fig.add_subplot(gs[1,1], sharey=ax_main)
    ax_y_profile.hist(student_error, bins=30, orientation='horizontal', density=True)
    #ax_y_profile.axis('off')

    plt.setp(ax_x_profile.get_xticklabels(), visible=False)
    plt.setp(ax_y_profile.get_yticklabels(), visible=False)

    plt.savefig(output_dir)
    
def quantize_scores(arr, precision: tuple = (16,8)):
    word, int_ = precision
    decimal = word - int_
    step = 1 / 2**decimal
    max_ = 2**int_ - step
    arrq = step * np.round(arr / step)
    arrc = np.clip(arrq, 0, max_)
    return arrc

    
def main():
    cmssw_base = Path(os.getenv('CMSSW_BASE'))

    et_model = keras.models.load_model(str(cmssw_base/'src/anomalyDetection/CICADATraining_2025/metadata/best-et-scaled'))
    npv_model = keras.models.load_model(str(cmssw_base/'src/anomalyDetection/CICADATraining_2025/metadata/best-npv-scaled'))

    #Get the training file I have sitting around
    training_file = '/cms/aloeliger/anomalyTriggerWork/training/2025_training/CMSSW_15_0_0_pre2/src/personalCICADAScripts/CICADA_2025/scripts/training_output/student_training.h5'
    with h5py.File(training_file, 'r') as theFile:
        inputs = np.array(theFile['cicada_inputs']).reshape((-1,252))
        teacher_errors = np.array(theFile['teacher_errors'])
        cicada_average = np.array(theFile['cicada_averages'])
        npvs = np.array(theFile['npvs'])

    et_weighted_term = 2*np.mean(cicada_average)/(cicada_average+np.mean(cicada_average))
    np_weighted_term = 2*np.mean(npvs)/(npvs+np.mean(npvs))

    output_dir = Path('TeacherStudentEvalutions')
    output_dir.mkdir(exist_ok=True, parents=True)

    console.log('Logging Teacher targets')
    
    teacher_et_scores = np.log(teacher_errors * et_weighted_term) * 32
    teacher_et_scores = quantize_scores(teacher_et_scores)
    make_teacher_score_plot(
        teacher_et_scores,
        str(
            output_dir/'et_weighted_teacher_scores.png'
        ),
        title='ET Weighted Teacher Scores'
    )
    
    teacher_npv_scores = np.log(teacher_errors * np_weighted_term) * 32
    teacher_npv_scores = quantize_scores(teacher_npv_scores)
    make_teacher_score_plot(
        teacher_npv_scores,
        str(
            output_dir/'npv_weighted_teacher_scores.png'
        ),
        title='NPV Weighted Teacher Scores',
    )

    #Let's get some predictions
    console.log("Making student predictions")
    et_model_predictions = et_model.predict(inputs).reshape((-1,))
    npv_model_predictions = npv_model.predict(inputs).reshape((-1,))

    et_model_mse = mean_squared_error(et_model_predictions, teacher_et_scores)
    npv_model_mse = mean_squared_error(npv_model_predictions, teacher_npv_scores)
    
    console.log(f'ET Model MSE: {et_model_mse:.3f}')
    console.log(f'NPV Model MSE: {npv_model_mse:.3f}')

    et_dummy_model = DummyRegressor()
    npv_dummy_model = DummyRegressor()
    et_dummy_model.fit(inputs, teacher_et_scores)
    npv_dummy_model.fit(inputs, teacher_npv_scores)

    dummy_et_predictions = et_dummy_model.predict(inputs)
    dummy_npv_predictions = npv_dummy_model.predict(inputs)
    dummy_et_mse = mean_squared_error(dummy_et_predictions, teacher_et_scores)
    dummy_npv_mse = mean_squared_error(dummy_npv_predictions, teacher_npv_scores)

    console.log(f'Dummy ET Model MSE: {dummy_et_mse}')
    console.log(f'Dummy NPV Model MSE: {dummy_npv_mse}')
    
    console.log('Making teacher student comparisons: Score hists')
    make_teacher_student_plot(
        teacher_et_scores,
        et_model_predictions,
        str(output_dir/'teacher_student_et_comparison.png'),
        title='ET Weighted Anomaly Scores'
    )
    make_teacher_student_plot(
        teacher_npv_scores,
        npv_model_predictions,
        str(output_dir/'teacher_student_npv_comparison.png'),
        title='NPV Weighted Anomaly Scores'
    )

    console.log('Making teacher student comparisons: error vs teacher')
    et_student_errors = et_model_predictions - teacher_et_scores
    npv_student_errors = npv_model_predictions - teacher_npv_scores
    make_error_scatter(
        et_student_errors,
        teacher_et_scores,
        str(output_dir/'et_student_teacher_errors.png')
    )
    make_error_scatter(
        npv_student_errors,
        teacher_npv_scores,
        str(output_dir/'npv_student_teacher_errors.png')
    )

    console.log('Making teacher student comparisons: error vs cicada average')
    make_error_scatter(
        et_student_errors,
        cicada_average,
        str(output_dir/'et_student_cicada_average_errors.png'),
        xaxis_name='Average CICADA Input'
    )
    make_error_scatter(
        npv_student_errors,
        cicada_average,
        str(output_dir/'npv_student_cicada_average_errors.png'),
        xaxis_name='Average CICADA Input'
    )

    console.log('Making teacher student comparisons: error vs npv')
    make_error_scatter(
        et_student_errors,
        npvs,
        str(output_dir/'et_student_npv_errors.png'),
        xaxis_name='nPV',
    )
    make_error_scatter(
        npv_student_errors,
        npvs,
        str(output_dir/'npv_student_npv_errors.png'),
        xaxis_name='nPV',
    )
    
    console.log('Done!')
    

if __name__ == '__main__':
    main()
