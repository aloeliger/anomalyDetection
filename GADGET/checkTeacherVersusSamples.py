import numpy as np
import matplotlib.pyplot as plt
from tensorflow import keras
from trainGADGETTeacher import makeNormedInstances
import h5py

def lossFunction(predicted, true):
    true = true.reshape((-1, 18, 14, 1))
    squared_error = (predicted-true)**2
    meanSquaredError = np.mean(squared_error, axis=(1,2,3))
    return meanSquaredError

def plot_anomaly_score_distribution(scores, labels, name="teacherVsSignals"):
    for i in range(len(scores)):
        score = scores[i]
        label = labels[i]
        plt.hist(
            score.reshape((-1,)),
            bins=100,
            density=True,
            label=label,
            log=True,
            histtype='step'
        )
    plt.xlabel("Anomaly Score")
    plt.legend(loc="center left",bbox_to_anchor=(1, 0.5))
    plt.savefig(
        f"plots/{name}.png",
        bbox_inches="tight"
    )
    plt.close()

def main():
    teacherModel = keras.models.load_model("models/teacher")
    
    ZeroBiasOdd = '/hdfs/store/user/aloelige/CICADA_Training/22Jan2024/ZeroBias_OddLumi.h5'
    ggHtoBBPath = '/hdfs/store/user/aloelige/CICADA_Training/22Jan2024/GluGluHToBB_M-125_TuneCP5_13p6TeV_powheg-pythia8_0.h5'
    ggHtoTauTauPath = '/hdfs/store/user/aloelige/CICADA_Training/22Jan2024/GluGluHToTauTau_M-125_TuneCP5_13p6TeV_powheg-pythia8_0.h5'
    TTbarPath = '/hdfs/store/user/aloelige/CICADA_Training/22Jan2024/TT_TuneCP5_13p6TeV_powheg-pythia8_0.h5'
    ggHtoGGPath = '/hdfs/store/user/aloelige/CICADA_Training/29Jan2024/GluGluHToGG_M-125_TuneCP5_13p6TeV_powheg-pythia8_0.h5'
    VBFHtoCCPath = '/hdfs/store/user/aloelige/CICADA_Training/29Jan2024/VBFHToCC_M-125_TuneCP5_13p6TeV_powheg-pythia8_0.h5'
    VBFHtoInvisiblePath = '/hdfs/store/user/aloelige/CICADA_Training/29Jan2024/VBFHToInvisible_M-125_TuneCP5_13p6TeV_powheg-pythia8_0.h5'
    
    signals = [
        ZeroBiasOdd,
        ggHtoBBPath,
        ggHtoTauTauPath,
        TTbarPath,
        ggHtoGGPath,
        VBFHtoCCPath,
        VBFHtoInvisiblePath,
    ]
    labels = [
        "Zero Bias (Non-Training)",
        "ggH to BB",
        "ggH to Tau Tau",
        "TTbar",
        "ggH to GG",
        "VBF H to CC",
        "VBF H to Invisible",
    ]
    
    losses = []

    for signal in signals:
        with h5py.File(signal) as theFile:
           theDataset = np.array(theFile["CaloRegions"]) 
        inputData = theDataset.reshape(theDataset.shape[0], 18*14)
        outputData = makeNormedInstances(theDataset)

        prediction = teacherModel.predict(inputData)
        loss = lossFunction(prediction, outputData)
        losses.append(loss)

    plot_anomaly_score_distribution(losses, labels)

    adjustedLosses = []
    for loss in losses:
        adjustedLosses.append(
            (1.0-loss)*256.0
        )
    plot_anomaly_score_distribution(adjustedLosses, labels, name="adjustedTeacherVsSignals")

if __name__ == '__main__':
    main()
