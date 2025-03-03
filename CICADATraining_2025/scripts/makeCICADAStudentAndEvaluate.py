import h5py
import argparse

import numpy as np

from tensorflow import keras
#from qkeras import QActivation, QConv2D, QDense, QDenseBatchnorm, quantized_bits
import qkeras

from rich.console import Console

from sklearn.model_selection import train_test_split

from pathlib import Path

from makeCICADATeacherAndEvaluate import randomPhiRotations, randomEtaReflections
from makeCICADATeacherAndEvaluate import L1Normalization

console = Console()

nprng = np.random.default_rng(42)

def normalizeScores(scores, linearCoef = 202.2, bias = -13.05):
    return linearCoef * scores + bias

def quantizeScores(scores, precision = (16, 8)):
    word, int_ = precision
    decimal = word - int_
    step = 1 / (2**decimal)
    max_ = 2**int_ - step
    arrq = step * np.round(scores/step)
    arrc = np.clip(arrq, 0, max_)
    return arrc

def main(args):
    ae_model = keras.models.load_model(f'{args.workPath}/teacherModel')

    inputFileName = Path(args.workPath) / 'teacherTrainingFile.h5'
    with h5py.File(str(inputFileName)) as theFile:
        theDataset = np.array(theFile['modelInputs'])
        npvs = np.array(theFile['npvs'])

    theDataset = randomPhiRotations(theDataset)
    theDataset = randomEtaReflections(theDataset)

    console.print(theDataset.shape)

    alreadyUsedData, untouchedData, alreadyUsedNPVs, untouchedNPVs = train_test_split(
        theDataset, npvs, random_state=42
    )

    inputData = untouchedData.reshape((-1, 18*14))
    teacherOutputDataset = untouchedData.reshape((-1,18,14,1))

    #layerNormer = keras.layers.LayerNormalization(axis=(1,2,3))
    #layerNormer = keras.layers.UnitNormalization(axis=(1,2,3))
    layerNormer = L1Normalization(axis=(1,2,3))
    
    normedTeacherOutputDataset = layerNormer(teacherOutputDataset)

    teacherPredictions = ae_model.predict(inputData)
    teacherScores = np.mean((teacherPredictions - normedTeacherOutputDataset)**2, axis=(1,2,3))

    normedTeacherScores = normalizeScores(teacherScores, linearCoef=args.linearCoef, bias=args.linearBias)
    quantizedNormedTeacherScores = quantizeScores(normedTeacherScores)

    # console.print(teacherScores)
    # console.print(normedTeacherScores)
    # console.print(quantizedNormedTeacherScores)

    console.print(inputData.shape)
    console.print(quantizedNormedTeacherScores.shape)

    trainval_inputData, test_inputData, trainval_scores, test_scores, trainval_npvs, test_npvs = train_test_split( 
        inputData, quantizedNormedTeacherScores, untouchedNPVs,
        random_state=42,
        test_size=0.4,
    )
    train_inputData, val_inputData, train_scores, val_scores, train_npvs, val_npvs = train_test_split(
        trainval_inputData, trainval_scores, trainval_npvs,
        random_state=42,
        test_size=0.1/(0.6)
    )

    console.print(train_inputData.shape)
    console.print(val_inputData.shape)
    console.print(test_inputData.shape)
    console.print(train_scores.shape)
    console.print(val_scores.shape)
    console.print(test_scores.shape)
    console.print(train_npvs.shape)
    console.print(val_npvs.shape)
    console.print(test_npvs.shape)

    studentModel = keras.models.Sequential([
        keras.layers.Input(shape=inputData.shape[1:], name='inputs_'),
        keras.layers.Reshape((18, 14, 1), name='reshape'),
        qkeras.QConv2D(
            4,
            (2,2),
            strides=2,
            padding='valid',
            use_bias=False,
            kernel_quantizer=qkeras.quantized_bits(12, 3, 1, alpha=1.0),
            name='conv',
        ),
        qkeras.QActivation("quantized_relu(10, 6)", name="relu0"),
        keras.layers.Flatten(name="flatten"),
        keras.layers.Dropout(1/9),
        qkeras.QDenseBatchnorm(
            16,
            kernel_quantizer=qkeras.quantized_bits(8, 1, 1, alpha=1.0),
            bias_quantizer=qkeras.quantized_bits(8, 3, 1, alpha=1.0),
            name="dense1",
        ),
        qkeras.QActivation(
            "quantized_relu(10, 6)",
            name="relu1",
        ),
        keras.layers.Dropout(1/8),
        qkeras.QDense(
            1,
            kernel_quantizer=qkeras.quantized_bits(12, 3, 1, alpha=1.0),
            use_bias=False,
            name="dense2",
        ),
        qkeras.QActivation("quantized_relu(16, 8)", name="outputs"),
    ])

    studentModel.compile(
        loss='mse',
        metrics = [
            keras.metrics.MeanAbsoluteError(),
            keras.metrics.RootMeanSquaredError(),
        ],
        optimizer=keras.optimizers.Adam(learning_rate=0.001)
    )

    studentBestModel = keras.callbacks.ModelCheckpoint(
        f'{args.workPath}/studentModel', save_best_only=True
    )
    studentLog = keras.callbacks.CSVLogger(
        f'{args.workPath}/studentTraining.log', append=False,
    )

    studentModel.summary()

    studentModel.fit(
        x=train_inputData,
        y=train_scores,
        validation_data=(val_inputData, val_scores),
        epochs=100,
        callbacks=[
            studentBestModel,
            studentLog
        ],
        batch_size=512,
    )

    studentModel = keras.models.load_model(f'{args.workPath}/studentModel')
    console.rule("evaluation")
    studentModel.evaluate(
        x=test_inputData,
        y=test_scores,
    )

    scores = studentModel.predict(test_inputData).reshape((-1,))
    correlation_to_npv = np.corrcoef(scores, test_npvs)[0, 1]

    console.log(f'Score correlation to NPV: {correlation_to_npv:.4g}')

    CICADA_Input_Sum = np.sum(test_inputData, axis=(1))
    correlation_to_CICADA_Input = np.corrcoef(scores, CICADA_Input_Sum)[0, 1]
    console.log(f'Score correlation to CICADA Input Sum: {correlation_to_CICADA_Input:.4g}')
    
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
