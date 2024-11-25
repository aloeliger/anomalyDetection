import ROOT
import os

from rich.console import Console
from rich.progress import track

console = Console()

def makeDFFromDict(theDict):
    ECALChain = ROOT.TChain("ECALTrigPrimAnalyzer/ECALTriggerPrimitives")
    HCALChain = ROOT.TChain("HCALTrigPrimAnalyzer/HCALTriggerPrimitives")
    CICADAInputChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')
    CICADAChain = ROOT.TChain('l1CaloSummaryEmuTree/L1CaloSummaryTree')
    
    

    nFiles = 0
    for run in theDict:
        for root, dirs, files in os.walk(theDict[run]):
            for fileName in files:
                nFiles += 1
                theFile = f'{root}/{fileName}'
                ECALChain.Add(theFile)
                HCALChain.Add(theFile)
                CICADAChain.Add(theFile)
    CICADAChain.AddFriend(ECALChain)
    CICADAChain.AddFriend(HCALChain)

    dataframe = ROOT.RDataFrame(CICADAChain)

    return dataframe, CICADAChain, nFiles, CICADAInputChain
    
def makeCICADAPlot(theChain, theInputChain, identifier):
    nEntries = theChain.GetEntries()

    theHisto = ROOT.TH2D(
        f'{identifier}_CICADARegionET;iEta;iPhi',
        f'{identifier}_CICADARegionET;iEta;iPhi',
        14,
        0.0,
        14.0,
        18,
        0.0,
        18.0,
    )

    regionETHisto = ROOT.TH1D(
        f'{identifier}_CICADAETsProfile;iEta;iPhi',
        f'{identifier}_CICADAETsProfile;iEta;iPhi',
        200,
        0.0,
        200.0
    )

    for entry in track(range(nEntries), description='Region plot'):
        theChain.GetEntry(entry)
        theInputChain.GetEntry(entry)

        cicadaScore = theChain.CaloSummary.CICADAScore
        if cicadaScore < 120.0:
            continue

        for i in range(14):
            for j in range(18):
                #regionEt = theChain.modelInput[j*14 + i]
                regionEt = theChain.GetLeaf('modelInput').GetValue(j*14+i)
                theHisto.Fill(i, j, regionEt)
                regionETHisto.Fill(regionEt)
    theCanvas = ROOT.TCanvas(f'{identifier}_averageHighScoreCICADARegions')
    theHisto.Scale(1.0/theHisto.Integral())
    theHisto.Draw("COLZ")
    theCanvas.SaveAs(f'{identifier}_averageHighScoreCICADARegions.png')

    regionETHisto.Scale(1.0/regionETHisto.Integral())
    theCanvas.SetLogy()
    regionETHisto.Draw("HIST")
    theCanvas.SaveAs(f'{identifier}_averageHighScoreCICADARegionsProfile.png')

def main():
    ROOT.gStyle.SetOptStat(0)
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

    beforeDF, beforeChain, beforeFiles, beforeInputChain = makeDFFromDict(beforeRuns)
    afterDF, afterChain, afterFiles, afterInputChain = makeDFFromDict(afterRuns)

    makeCICADAPlot(beforeChain, beforeInputChain, 'before')
    makeCICADAPlot(afterChain, beforeInputChain, 'after')

if __name__ == '__main__':
    main()
