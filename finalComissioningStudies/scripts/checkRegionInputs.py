import ROOT
from rich.console import Console
from rich.progress import track
from pathlib import Path
import os
import math

console = Console()

def processChain(theChain, runNumber, eventChain):
    theHisto = ROOT.TH2D(
        f"{runNumber}_EtWeightedDeposits",
        f"{runNumber}_EtWeightedDeposits",
        14,
        0.0,
        14.0,
        18,
        0.0,
        18.0,
    )


    nEntries = theChain.GetEntries()
    console.print(f'{runNumber}: {nEntries}')

    nProcessedEvents = 0
    for entry in track(range(nEntries), description=f"{runNumber}"):
        theChain.GetEntry(entry)
        eventChain.GetEntry(entry)
        if eventChain.Event.lumi < 300 and eventChain.Event.lumi > 200:
            continue
        nProcessedEvents += 1

        modelInputLeaf = theChain.GetLeaf("modelInput")
        regions = []
        for i in range(18):
            etaValues = []
            for j in range(14):
                regionEt = modelInputLeaf.GetValue(i*14+j)
                etaValues.append(regionEt)
            regions.append(etaValues)


        for i in range(18):
            for j in range(14):
                theHisto.Fill(
                    j,
                    i,
                    regions[i][j],
                )

    theCanvas = ROOT.TCanvas(f'{runNumber}_Canvas')

    averageHisto = theHisto.Clone()
    averageHisto.Scale(1.0/nProcessedEvents)

    averageHisto.Draw("COLZ")
    averageHisto.GetXaxis().SetTitle("iEta")
    averageHisto.GetYaxis().SetTitle("iPhi")
    averageHisto.GetZaxis().SetRangeUser(0.0,6.0)
    averageHisto.SetTitle(f"Run {runNumber}")
    theCanvas.SaveAs(f"{runNumber}_average.png")

    console.print(averageHisto.Integral())
    console.print(averageHisto.Integral()/252)

    return averageHisto

def makeChain(filePath):
    theChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')

    for root, dirs, files in os.walk(filePath):
        for fileName in files:
            theFile = f'{root}/{fileName}'
            theChain.Add(theFile)
    return theChain

def makeEventChain(filePath):
    theChain = ROOT.TChain('l1EventTree/L1EventTree')

    for root, dirs, files in os.walk(filePath):
        for fileName in files:
            theFile = f'{root}/{fileName}'
            theChain.Add(theFile)
    return theChain

def makeRatioPlot(firstHisto, secondHisto, firstRunNumber, secondRunNumber):
    dividedPlot = firstHisto.Clone()
    dividedPlot.SetTitle(f'Run {firstRunNumber}/Run {secondRunNumber}')
    dividedPlot.GetZaxis().SetRangeUser(0.0, 2.0)

    dividedPlot.Divide(secondHisto)

    canvasName = f'{firstRunNumber}_dividedBy_{secondRunNumber}_average'
    theCanvas = ROOT.TCanvas(f'{canvasName}')

    dividedPlot.Draw("COLZ")

    theCanvas.SaveAs(f'{canvasName}.png')

def main():
    ROOT.gStyle.SetOptStat(0)
    
    runs = {
        '386640': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386640',
        '386661': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386661',
        '386668': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386668',
        '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386673',
        '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386679',
        '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission/Run386694',
    }
    

    averageHistos = {}
    for run in runs:
        averageHisto = processChain(
            makeChain(runs[run]),
            run,
            makeEventChain(runs[run]),
        )
        averageHistos[run] = averageHisto

    for run in averageHistos:
        for secondRun in averageHistos:
            makeRatioPlot(
                averageHistos[run],
                averageHistos[secondRun],
                run,
                secondRun
            )

if __name__ =='__main__':
    main()
