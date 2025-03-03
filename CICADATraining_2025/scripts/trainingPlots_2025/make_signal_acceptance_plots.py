#!/usr/bin/env python3
#Script for making the cicada physics case plots

import ROOT
import src.make_signal_plots as msp
from src.sample import Sample
from src.utils import *
from rich.Console import Console
import tensorflow.keras as keras
import h5py

console = Console()

def main(args):

    #Let's get the models we need to evaluate things for
    models = {
        'AndrewTeacherOnly': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/teacher_score_only_student/',
        'LegacyMethod': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-legacy-method/',
        'NPVScaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-npv-scaled/',
        'ETScaled': f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/best-et-scaled/',
    }
    for model in models:
        models[model] = keras.models.load_model(models[model])
    
    #Let's start with ROC plots, which are at least relatively simple
    #We need the dedicated data sample,
    data_sample_location = '/hdfs/store/user/ligerlac/CICAD2025Training/resampled/ZB-2024-npv-gauss-50.h5'
    with h5.py.File(data_sample_location) as theFile:
        zb_inputs = theFile['CaloRegions'][:int(1e7)]

    #We can start with the stuff I made for training, then we might
    #move to the samples we used last time
    #get those, and get their inputs

if __name__ == '__main__':
    main()
