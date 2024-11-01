#Okay, I want a plot that gives me an idea where the score is coming from, on average
#First idea: We make a region plot that is ET * Score / total ET, compare before and after
# Fails to account for the idea that differences from usual are what contribute to score
# second idea: Make average energy plot for before and after
# then, for before and after, per event, we make an absolute difference spread, then we do basically the same plot,
# but base it on that

import ROOT
from rich.console import Console
from rich.progress import track
import os
import numpy as np

console = Console()

def makeChainFromDict(theDict):
    theChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')
    scoreChain = ROOT.TChain('l1CaloSummaryEmuTree/L1CaloSummaryTree')
    for run in theDict:
        for root, dirs, files in os.walk(theDict[run]):
            for fileName in files:
                theFile = f'{root}/{fileName}'
                theChain.Add(theFile)
                scoreChain.Add(theFile)
    return theChain, scoreChain

def makeGridOfAverages(theChain):
    nEntries = theChain.GetEntries()
    allDeposits = np.zeros((nEntries,18,14))

    for entry in track(range(nEntries), description="Averages"):
        theChain.GetEntry(entry)

        modelInputLeaf = theChain.GetLeaf('modelInput')
        for i in range(18):
            for j in range(14):
                regionEt  = modelInputLeaf.GetValue(i*14 + j)
                allDeposits[entry, i, j] = regionEt
    return allDeposits, np.mean(allDeposits, axis=(0,))

def makeAbsoluteDifferencesFromAverage(deposits, averages):
    repeatedAverages = np.repeat(averages.reshape((1,18,14)), len(deposits), axis=0)
    #console.print()
    absoluteDifferences = np.abs(deposits-repeatedAverages)
    return absoluteDifferences

def makeCICADAScores(theChain):
    nEntries = theChain.GetEntries()
    allScores = np.zeros((nEntries,))
    for entry in track(range(nEntries), description='CICADA scores'):
        theChain.GetEntry(entry)

        allScores[entry] = theChain.CaloSummary.CICADAScore
    return allScores

def makeScoreDepositPlots(fractionalScoreDeposits, identifier):
    theHisto = ROOT.TH2D(
        f'{identifier}_ScoreDeposits;iEta;iPhi',
        f'{identifier}_ScoreDeposits;iEta;iPhi',
        14,
        0.0,
        14.0,
        18,
        0.0,
        18.0,
    )

    nEntries = len(fractionalScoreDeposits)
    for entry in track(range(nEntries), description='score deposit plot'):
        for i in range(18):
            for j in range(14):
                theHisto.Fill(j, i, fractionalScoreDeposits[entry, i, j])
    theCanvas = ROOT.TCanvas(f'{identifier}_canvas')
    theHisto.Scale(1.0/nEntries)

    theHisto.Draw("COLZ")

    #theHisto.GetZaxis().SetRangeUser(-0.2, 0.1)
    #theHisto.GetZaxis().SetRangeUser(-0.16, 0.08)

    theCanvas.SaveAs(f"{identifier}_ScoreDeposits.png")

    return theHisto

def main():
    ROOT.gStyle.SetOptStat(0)

    beforeRuns = {
        '386640': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386640',
        '386661': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386661',
        '386668': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386668',
    }
    afterRuns = {
        '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386673',
        '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386679',
        '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386694',
    }

    beforeChain, beforeScoreChain = makeChainFromDict(beforeRuns)
    afterChain, afterScoreChain = makeChainFromDict(afterRuns)

    beforeDeposits, beforeAverageDeposits = makeGridOfAverages(beforeChain)
    afterDeposits, afterAverageDesposits = makeGridOfAverages(afterChain)

    #console.print(beforeDeposits.shape)
    #console.print(beforeAverageDeposits.shape)
    beforeRegionDifferences = makeAbsoluteDifferencesFromAverage(beforeDeposits, beforeAverageDeposits)
    afterRegionDifferences = makeAbsoluteDifferencesFromAverage(afterDeposits, afterAverageDesposits)

    beforeSums = np.sum(beforeRegionDifferences, axis=(1,2))
    afterSums = np.sum(afterRegionDifferences, axis=(1,2))

    beforeFractionalDeposits = beforeRegionDifferences/beforeSums.reshape((-1,1,1))
    afterFractionalDeposits = afterRegionDifferences/afterSums.reshape((-1,1,1))

    beforeScores = makeCICADAScores(beforeScoreChain)
    afterScores = makeCICADAScores(afterScoreChain)

    beforeScoresOffAverage = beforeScores - 65.0
    afterScoresOffAverage = afterScores - 65.0

    beforeScoreDeposits = beforeFractionalDeposits * beforeScoresOffAverage.reshape((-1,1,1))
    afterScoreDeposits = afterFractionalDeposits * afterScoresOffAverage.reshape((-1,1,1))

    beforeFractionalDepositHisto = makeScoreDepositPlots(beforeScoreDeposits, 'Before')
    afterFractionalDepositHisto = makeScoreDepositPlots(afterScoreDeposits, 'After')

    afterToBeforeScoreDeposits = afterFractionalDepositHisto.Clone()
    afterToBeforeScoreDeposits.SetTitle("After/Before score weighted deposit")
    #beforeToAfterScoreDeposits.Divide(afterFractionalDepositHisto)
    afterToBeforeScoreDeposits.Divide(beforeFractionalDepositHisto)

    theCanvas = ROOT.TCanvas("BeforeToAfterScoreDepositRatio")
    afterToBeforeScoreDeposits.Draw("COLZ")
    theCanvas.SaveAs("BeforeToAfterScoreDepositRatio.png")

if __name__ == '__main__':
    main()
