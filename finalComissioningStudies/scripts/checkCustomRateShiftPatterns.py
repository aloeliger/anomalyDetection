import ROOT
import numpy as np
import copy

from huggingface_hub import from_pretrained_keras
from rich.console import Console
from rich.progress import track

from checkTPBeforeAndAfter import makeChainFromDict
from checkCICADAScoresWithShifts import getAllCICADAInputs
from estimateRatesForThresholds import deriveRatesFromHisto, dumpRateTable

console = Console()

def makeRates(scores):
    scoreHist = ROOT.TH1D(
        'score_histo',
        'score_histo',
        256,
        0.0,
        256.0,
    )

    for score in track(scores, description='Filling score histogram'):
        scoreHist.Fill(score)
    rateTable = deriveRatesFromHisto(scoreHist)
    dumpRateTable(rateTable)

def main():
    model = from_pretrained_keras("cicada-project/cicada-v2.1")
    beforeRuns = {
        '386640': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386640',
        '386661': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386661',
        '386668': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386668',
    }
    afterRuns = {
        '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386673',
        '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386679',
        '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386694',
    }

    #afterECALChain, afterHCALChain, afterCICADAChain = makeChainFromDict(afterRuns)
    afterECALChain, afterHCALChain, afterCICADAChain = makeChainFromDict(beforeRuns)

    CICADAInputs = getAllCICADAInputs(afterCICADAChain)
    console.print(CICADAInputs.shape)

    scores = model.predict(CICADAInputs.reshape((-1, 252)))
    makeRates(scores)
    
    ZeroedHotRegionInputs = copy.deepcopy(CICADAInputs)
    #Zero out the hole
    #ZeroedHotRegionInputs[:, 13, 1] = 0
    ZeroedHotRegionInputs[:, :, 0] = 0
    ZeroedHotRegionInputs[:, :, 13] = 0
    newScores = model.predict(ZeroedHotRegionInputs.reshape(-1, 252))
    makeRates(newScores)

    
if __name__ == '__main__':
    main()
