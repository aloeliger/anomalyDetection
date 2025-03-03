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
from makeCICADAStudentAndEvaluate import normalizeScores, quantizeScores
from performDetailedTeacherEvaluation import makeCICADAInputGridFromTowers, makeGenericScorePlot, makeTotalScorePlot, makeDataScorePlot

console = Console()

nprng = np.random.default_rng(42)

def makeScoresForSample(
        samplePath,
        teacherModel,
        normCoef,
        normBias,
        studentModel,
):
    theChain = ROOT.TChain("l1CaloTowerEmuTree/L1CaloTowerTree")
    for root, dirs, files in os.walk(samplePath):
        for fileName in files:
            theFile = f'{root}/{fileName}'
            theChain.Add(theFile)

    nEntries = theChain.GetEntries()
    inputGrids = []
    for entry in tqdm(range(nEntries)):
        #if entry % 100 != 0:
        #    continue
        theChain.GetEntry(entry)
        inputGrids.append(
            makeCICADAInputGridFromTowers(theChain)
        )

    inputData = np.array(inputGrids)
    #console.print(inputData.shape)

    layerNormer = keras.layers.LayerNormalization(axis=(1,2,3))
    #layerNormer = keras.layers.UnitNormalization(axis=(1,2,3))
    #layerNormer = L1Normalization(axis=(1,2,3))
    
    normed_outputData = layerNormer(inputData)

    model_predictions = teacherModel.predict(inputData)

    unnormed_scores = np.mean((model_predictions - normed_outputData)**2, axis=(1,2,3))

    normed_scores = normCoef * unnormed_scores + normBias
    studentScores = studentModel.predict(inputData).reshape((-1,))

    return normed_scores, studentScores, inputData

def main(args):
    start_time = perf_counter()

    ROOT.gStyle.SetOptStat(0)
    workPath = Path(args.workPath)
    ae_model = keras.models.load_model(f'{args.workPath}/teacherModel')
    inputFileName = workPath / 'teacherTrainingFile.h5'
    with h5py.File(str(inputFileName)) as theFile:
        theDataset = np.array(theFile['modelInputs'])
        npvs = np.array(theFile['npvs'])

    theDataset = randomPhiRotations(theDataset)
    theDataset = randomEtaReflections(theDataset)

    alreadyUsedData, untouchedData, alreadyUsedNPVs, untouchedNPVs = train_test_split(
        theDataset, npvs, random_state=42
    )

    inputDataset = untouchedData.reshape((-1, 18*14))
    outputDataset = untouchedData.reshape((-1,18,14,1))

    layerNormer = keras.layers.LayerNormalization(axis=(1,2,3))
    #layerNormer = keras.layers.UnitNormalization(axis=(1,2,3))
    #layerNormer = L1Normalization(axis=(1,2,3))
    normedTeacherOutputDataset = layerNormer(outputDataset)

    teacherPredictions = ae_model.predict(inputDataset)
    teacherScores = np.mean((teacherPredictions - normedTeacherOutputDataset)**2, axis=(1,2,3))
    normedTeacherScores = normalizeScores(teacherScores, linearCoef=args.linearCoef, bias=args.linearBias)
    quantizedNormedTeacherScores = quantizeScores(normedTeacherScores)

    studentModel = keras.models.load_model(f'{args.workPath}/studentModel')

    trainval_inputData, test_inputData, trainval_scores, test_scores, trainval_npvs, test_npvs = train_test_split( 
        inputDataset, quantizedNormedTeacherScores, untouchedNPVs,
        random_state=42,
        test_size=0.4,
    )
    train_inputData, val_inputData, train_scores, val_scores, train_npvs, val_npvs = train_test_split(
        trainval_inputData, trainval_scores, trainval_npvs,
        random_state=42,
        test_size=0.1/(0.6)
    )

    studentScores = studentModel.predict(test_inputData).reshape((-1,))

    makeDataScorePlot(
        studentScores,
        workPath,
        "studentScores",
        "Student Scores;Student Score;A.U.",
        0.0,
        256.0,
    )

    #Okay, now we need to make score plots with a bunch of signals
    MC_Path = Path('/hdfs/store/user/aloeliger/suppressionSamples/')
    HToLongLived_Path = MC_Path / "L1Ntuples_HToLongLived_2023_27Jul2023_0949/"
    SUEP_Path = MC_Path / "L1Ntuples_SUEP_2023_28Jul2023_1034"
    SUSYGGBBH_Path = MC_Path / "L1Ntuples_SUSYGGBBH_2023_27Jul2023_0949"
    TT_Path = MC_Path / "L1Ntuples_TT_2023_27Jul2023_0950"
    VBFHto2C_Path = MC_Path / "L1Ntuples_VBFHto2C_2023_27Jul2023_0950"

    teacher_HToLongLived, student_HToLongLived, HToLongLived_Inputs = makeScoresForSample(
        HToLongLived_Path,
        ae_model,
        args.linearCoef,
        args.linearBias,
        studentModel
    )
    teacher_SUEP, student_SUEP, SUEP_Inputs = makeScoresForSample(
        SUEP_Path,
        ae_model,
        args.linearCoef,
        args.linearBias,
        studentModel
    )
    teacher_SUSYGGBBH, student_SUSYGGBBH, SUSYGGBBH_Inputs = makeScoresForSample(
        SUSYGGBBH_Path,
        ae_model,
        args.linearCoef,
        args.linearBias,
        studentModel
    )
    teacher_TT, student_TT, TT_Inputs = makeScoresForSample(
        TT_Path,
        ae_model,
        args.linearCoef,
        args.linearBias,
        studentModel,
    )
    teacher_VBFHto2C, student_VBFHto2C, VBFHto2C_Inputs = makeScoresForSample(
        VBFHto2C_Path,
        ae_model,
        args.linearCoef,
        args.linearBias,
        studentModel,
    )

    makeTotalScorePlot(
        studentScores,
        student_HToLongLived,
        student_SUEP,
        student_SUSYGGBBH,
        student_TT,
        student_VBFHto2C,
        "Student Scores;Student Score;A.U",
        'totalStudentScores',
        0.0,
        256.0,
        workPath,
    )
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='')
    parser.add_argument(
        'workPath',
        nargs='?',
        help='Directory containing training file',
    )

    parser.add_argument(
        '--linearCoef',
        nargs='?',
        type=float,
        help='Normalizing linear coefficient',
        required=True,
    )
    parser.add_argument(
        '--linearBias',
        nargs='?',
        type=float,
        help='Normalizing linear bias',
        required=True,
    )

    args = parser.parse_args()

    main(args)
