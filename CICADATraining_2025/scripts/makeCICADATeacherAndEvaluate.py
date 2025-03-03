import h5py
import argparse

import numpy as np
import tensorflow as tf

from tensorflow import keras
from rich.console import Console

from sklearn.model_selection import train_test_split

from pathlib import Path

#from examinePileupVersusCICADA import makeSuppressedCICADAInputs

console = Console()

nprng = np.random.default_rng(42)

def randomPhiRotations(theDataset, maxShift=9):
    newExamples = []
    for example in theDataset:
        shiftValue = nprng.integers(-maxShift, maxShift+1)
        phiShiftedExample = np.roll(example, axis=0, shift = shiftValue)
        newExamples.append(phiShiftedExample)
    newExamples = np.array(newExamples)
    return newExamples

def randomEtaReflections(theDataset):
    newExamples = []
    for example in theDataset:
        if nprng.random() >= 0.5:
            newExample = example[:, ::-1]
        else:
            newExample = example
        newExamples.append(newExample)
    newExamples = np.array(newExamples)
    return newExamples

class L1Normalization(keras.layers.Layer):
    def __init__(self, axis=-1, **kwargs):
        super(L1Normalization, self).__init__(**kwargs)
        self.axis_ = axis
        
    def call(self, inputs):
        l1_norm = tf.reduce_sum(tf.abs(inputs), axis=self.axis_, keepdims=True)
        return inputs / (l1_norm + tf.keras.backend.epsilon())

def main(args):
    inputFileName = Path(args.workPath) / 'teacherTrainingFile.h5'
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

    #inputData = makeSuppressedCICADAInputs(inputData)
    #valInput = makeSuppressedCICADAInputs(valInput)
    #test_inputData = makeSuppressedCICADAInputs(test_inputData)

    #layerNormer = keras.layers.LayerNormalization(axis=(1,2,3))
    #layerNormer = L1Normalization(axis=(1,2,3))
    #layerNormer = keras.layers.Softmax(axis=(1,2,3))
    layerNormer = keras.layers.UnitNormalization(axis=(1,2,3))
    normed_outputData = layerNormer(outputData)
    normed_valOutput = layerNormer(valOutput)
    normed_testOutputData = layerNormer(test_outputData)
    
    ae_model = keras.models.Sequential([
        keras.layers.Input(shape=inputData.shape[1:], name="teacher_input"),
        #keras.layers.Dropout(0.5),
        #keras.layers.GaussianNoise(3.0),
        #keras.layers.GaussianDropout(1.0),
        keras.layers.Reshape((18,14,1), name='teacher_reshape'),
        #keras.layers.LayerNormalization(axis=[1,2,3], name='teacher_layer_norm'),
        #L1Normalization(axis=(1,2,3)),
        #keras.layers.Softmax(axis=[1,2,3], name='teacher_layer_norm'),
        #keras.layers.Softmax(axis=[1,2,3]),
        keras.layers.UnitNormalization(axis=[1,2,3]),
        keras.layers.Conv2D(
            filters=20,
            kernel_size=3,
            strides=1,
            padding="same",
            activation='relu',
            name='teacher_conv2d_1'
        ),
        keras.layers.AveragePooling2D(
            pool_size=2,
            name='teacher_averagepool_1'
        ),
        keras.layers.Conv2D(
            filters=30,
            kernel_size=3,
            strides=1,
            padding='same',
            activation='relu',
            name='teacher_conv2d_2'
        ),
        keras.layers.Flatten(name='teacher_flatten_1'),
        keras.layers.Dense(80, activation='relu', name='teacher_dense_1'),
        #keras.layers.Dense(40, activation='relu', name='teacher_dense_1'),
        keras.layers.Dense(9*7*30, name='teacher_dense_2'),
        keras.layers.Reshape((9,7,30), name='teacher_reshape_2'),
        keras.layers.Activation('relu', name='teacher_activation_1'),
        keras.layers.Conv2D(
            filters=30,
            kernel_size=3,
            strides=1,
            padding='same',
            activation='relu',
            name='techer_conv2d_3'
        ),
        keras.layers.UpSampling2D((2,2), name='teacher_upsample_1'),
        keras.layers.Conv2D(
            filters=20,
            kernel_size=3,
            strides=1,
            padding='same',
            activation='relu',
            name='teacher_conv2d_4'
        ),
        keras.layers.Conv2D(
            filters=1,
            kernel_size=3,
            strides=1,
            padding='same',
            #activation='relu',
            name='teacher_conv2d_5'
        )        
    ])

    ae_model.compile(
        loss='mse',
        metrics = [
            keras.metrics.MeanAbsoluteError(),
            keras.metrics.RootMeanSquaredError(),
            #keras.metrics.MeanAbsolutePercentageError(),
        ],
        optimizer=keras.optimizers.Adam(learning_rate=0.001)
    )
    teacherBestModel = keras.callbacks.ModelCheckpoint(f'{args.workPath}/teacherModel', save_best_only=True)
    teacherLog = keras.callbacks.CSVLogger(f"{args.workPath}/teacherTraining.log", append=False)

    ae_model.summary()

    ae_model.fit(
        x=inputData,
        #y=outputData,
        y=normed_outputData,
        #validation_data=(valInput, valOutput),
        validation_data=(valInput, normed_valOutput),
        epochs=100,
        callbacks=[
            teacherBestModel,
            teacherLog,
        ]
    )

    ae_model = keras.models.load_model(f'{args.workPath}/teacherModel')

    console.rule('Evaluation')
    ae_model.evaluate(
        x=test_inputData,
        #y=test_outputData,
        y=normed_testOutputData,
    )

    console.log('Prediction on test')
    predictions = ae_model.predict(
        x=test_inputData
    )
    #scores = np.mean((predictions - test_outputData)**2, axis=(1,2,3))
    scores = np.mean((predictions - normed_testOutputData)**2, axis=(1,2,3))
    console.print(scores)

    assert(len(scores) == len(test_npvs)), "Incorrect score to NPV size"

    correlation_to_npv = np.corrcoef(scores, test_npvs)[0, 1]

    console.log(f'Score correlation to NPV: {correlation_to_npv:.4g}')

    CICADA_Input_Sum = np.sum(test_inputData, axis=(1))
    correlation_to_CICADA_Input = np.corrcoef(scores, CICADA_Input_Sum)[0, 1]
    console.log(f'Score correlation to CICADA Input Sum: {correlation_to_CICADA_Input:.4g}')

    reshaped_test_input = test_inputData.reshape((-1,18,14,1))
    endcapSums = np.sum(reshaped_test_input[:, :, 0, 0]+reshaped_test_input[:, :, 13, 0], axis=1)

    correlation_to_endcap_sums = np.corrcoef(scores, endcapSums)[0, 1]
    console.log(f'Score correlation to CICADA Endcap Energies: {correlation_to_endcap_sums:.4g}')

    barrelSums = np.sum(reshaped_test_input[:, :, 6, 0]+reshaped_test_input[:, :, 7, 0], axis=1)
    correlation_to_barrel_sums = np.corrcoef(scores, barrelSums)[0, 1]
    console.log(f'Score correlation to CICADA Barrel Energies: {correlation_to_barrel_sums:.4g}')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='')
    parser.add_argument(
        'workPath',
        nargs='?',
        help='Directory containing training file',
    )

    args = parser.parse_args()

    main(args)
