import h5py
import argparse
import ROOT
import os

import numpy as np

from tensorflow import keras
from rich.console import Console
#from rich.progress import track
from tqdm import tqdm
from sklearn.model_selection import train_test_split
from pathlib import Path
from time import perf_counter

from makeCICADATeacherAndEvaluate import randomPhiRotations, randomEtaReflections
from anomalyDetection.anomalyTriggerSkunkworks.plotSettings.utilities import convertEffToRate
from makeCICADATeacherAndEvaluate import L1Normalization

console = Console()

def main(args):
    start_time = perf_counter()
    ROOT.gStyle.SetOptStat(0)
    workPath = Path(args.workPath)
    inputFileName = workPath / 'teacherTrainingFile.h5'
    with h5py.File(str(inputFileName)) as theFile:
        theDataset = np.array(theFile['modelInputs'])
        npvs = np.array(theFile['npvs'])

    theDataset = randomPhiRotations(theDataset)
    theDataset = randomEtaReflections(theDataset)

    #theDataset[theDataset < 1] = 0

    console.print(theDataset.shape)
    inputDataset = theDataset.reshape((-1, 18*14))
    outputDataset = theDataset.reshape((-1,18,14,1))

    console.print(inputDataset.shape)
    console.print(outputDataset.shape)

    trainval_inputData, test_inputData, trainval_outputData,  test_outputData, trainval_npvs, test_npvs = train_test_split(inputDataset, outputDataset, npvs, test_size=0.4, random_state=42)
    inputData, valInput, outputData, valOutput, train_npvs, val_npvs = train_test_split(trainval_inputData, trainval_outputData, trainval_npvs, test_size=0.1/(0.6), random_state=42)

    console.print(inputData.shape)
    console.print(valInput.shape)
    console.print(test_inputData.shape)

    #layerNormer = keras.layers.LayerNormalization(axis=(1,2,3))
    #layerNormer = keras.layers.UnitNormalization(axis=(1,2,3))
    layerNormer = L1Normalization(axis=(1,2,3))
    
    normed_outputData = layerNormer(outputData)
    normed_valOutput = layerNormer(valOutput)
    normed_testOutputData = layerNormer(test_outputData)

    ae_model = keras.models.load_model(f'{args.workPath}/teacherModel')

    model_predictions = ae_model.predict(test_inputData)
    unnormed_scores = np.mean((model_predictions - normed_testOutputData)**2, axis=(1,2,3))
    #console.print(unnormed_scores.shape)

    correlation_to_npv = np.corrcoef(unnormed_scores, test_npvs)[0, 1]

    console.print(f'Score correlation to NPV: {correlation_to_npv:.4g}')

    #Adjustment to the bit space
    new_max = 256.0
    new_min = 0.0
    old_max = np.max(unnormed_scores)
    old_min = np.min(unnormed_scores)

    new_coef = (new_max - new_min) / (old_max - old_min)
    new_bias = new_min - new_coef*old_min
    
    normed_scores = new_coef * unnormed_scores + new_bias
    normed_correlation_to_npv = np.corrcoef(normed_scores, test_npvs)[0,1]
    console.print(f"New scaling to student target: {new_coef:.4g} * score + {new_bias:.4g}")
    console.print(f'Normed score correlation to NPV: {normed_correlation_to_npv:.4g}')
    end_time = perf_counter()
    console.print(f'Full evaluation in {end_time-start_time:.3g} seconds')

    CICADA_Input_Sum = np.sum(test_inputData, axis=(1))
    correlation_to_CICADA_Input = np.corrcoef(normed_scores, CICADA_Input_Sum)[0, 1]
    console.print(f'Score correlation to CICADA Input Sum: {correlation_to_CICADA_Input:.4g}')

    reshaped_test_input = test_inputData.reshape((-1,18,14,1))
    endcapSums = np.sum(reshaped_test_input[:, :, 0, 0]+reshaped_test_input[:, :, 13, 0], axis=1)

    correlation_to_endcap_sums = np.corrcoef(normed_scores, endcapSums)[0, 1]
    console.log(f'Score correlation to CICADA Endcap Energies: {correlation_to_endcap_sums:.4g}')

    barrelSums = np.sum(reshaped_test_input[:, :, 6, 0]+reshaped_test_input[:, :, 7, 0], axis=1)
    correlation_to_barrel_sums = np.corrcoef(normed_scores, barrelSums)[0, 1]
    console.log(f'Score correlation to CICADA Barrel Energies: {correlation_to_barrel_sums:.4g}')
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='')
    parser.add_argument(
        'workPath',
        nargs='?',
        help='Directory containing the model experiments',
    )

    args = parser.parse_args()

    main(args)
