import ROOT
from rich.console import Console
from rich.progress import track
import os

def makeChainFromDict(theDict):
    ECALChain = ROOT.TChain("ECALTrigPrimAnalyzer/ECALTriggerPrimitives")
    HCALChain = ROOT.TChain("HCALTrigPrimAnalyzer/HCALTriggerPrimitives")
    CICADAInputChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')

    for run in theDict:
        for root, dirs, files in os.walk(theDict[run]):
            for fileName in files:
                theFile = f'{root}/{fileName}'
                ECALChain.Add(theFile)
                HCALChain.Add(theFile)
                CICADAInputChain.Add(theFile)
    return ECALChain, HCALChain, CICADAInputChain


def makeTPPlot(theChain, identifier):
    theDF = ROOT.RDataFrame(theChain)
    nEntries = theDF.Count()

    TPPlot = theDF.Histo2D(
        (
            f'{identifier}_TPPlot;IEta;IPhi',
            f'{identifier}_TPPlot;IEta;IPhi',
            57,
            -28.0,
            29.0,
            72,
            1.0,
            73.0,
        ),
        "trigPrimIEta",
        "trigPrimIPhi",
        "trigPrimET",
    )

    theCanvas = ROOT.TCanvas(identifier)
    nEntries = nEntries.GetValue()
    TPPlot.Scale(1.0/nEntries)
    TPPlot.Draw("COLZ")

    theCanvas.SaveAs(f'{identifier}_TPPlot.png')

    return TPPlot

def makeCICADAPlot(theChain, identifier):
    nEntries = theChain.GetEntries()

    theHisto = ROOT.TH2D(
        f'{identifier}_CICADARegionET;iEta;iPhi',
        f'{identifier}_CICADARegionET;iEta;iPhi',
        14,
        0.0,
        14.0,
        18,
        0.0,
        18.0
    )

    for entry in track(range(nEntries), description='region plot'):
        theChain.GetEntry(entry)

        for i in range(14):
            for j in range(18):
                regionEt = theChain.modelInput[j*14 + i]
                theHisto.Fill(i, j, regionEt)

    theCanvas = ROOT.TCanvas(f'{identifier}_CICADA_Regions')
    theHisto.Scale(1.0/nEntries)
    theHisto.Draw("COLZ")
    theCanvas.SaveAs(f"{identifier}_CICADA_Regions.png")

    return theHisto
    
def main():
    ROOT.gStyle.SetOptStat(0)
    # beforeRuns = {
    #     '386640': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386640',
    #     '386661': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386661',
    #     '386668': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386668',
    # }
    # afterRuns = {
    #     '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386673',
    #     '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386679',
    #     '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386694',
    # }
    beforeRuns = {
        '386640': '/hdfs/store/user/aloeliger/rateJumpSubmission_JetMET/Run386640',
        '386661': '/hdfs/store/user/aloeliger/rateJumpSubmission_JetMET/Run386661',
        '386668': '/hdfs/store/user/aloeliger/rateJumpSubmission_JetMET/Run386668',
    }
    afterRuns = {
        '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission_JetMET/Run386673',
        '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission_JetMET/Run386679',
        '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission_JetMET/Run386694',
    }

    beforeECALChain, beforeHCALChain, beforeCICADAChain = makeChainFromDict(beforeRuns)
    afterECALChain, afterHCALChain, afterCICADAChain = makeChainFromDict(afterRuns)

    beforeCICADAPlot = makeCICADAPlot(beforeCICADAChain, 'Before')
    afterCICADAPlot = makeCICADAPlot(afterCICADAChain, 'After')

    CICADACanvas = ROOT.TCanvas("CICADA_Canvas")
    CICADARatio=afterCICADAPlot.Clone()
    CICADARatio.SetTitle("After/Before")
    CICADARatio.Divide(beforeCICADAPlot)
    CICADARatio.Draw("COLZ")

    CICADACanvas.SaveAs("CICADARatioPlot.png")
    
    beforeECALPlot = makeTPPlot(beforeECALChain, 'ECAL_Before')
    afterECALPlot = makeTPPlot(afterECALChain, 'ECAL_After')

    beforeHCALPlot = makeTPPlot(beforeHCALChain, 'HCAL_Before')
    afterHCALPlot = makeTPPlot(afterHCALChain, 'HCAL_After')

    ECALRatio = afterECALPlot.Clone()
    ECALRatio.Divide(beforeECALPlot.GetValue())
    ECALRatio.SetTitle("ECAL After/Before")

    HCALRatio = afterHCALPlot.Clone()
    HCALRatio.Divide(beforeHCALPlot.GetValue())
    HCALRatio.SetTitle("HCAL After/Before")

    theCanvas = ROOT.TCanvas("theCanvas")
    ECALRatio.Draw("COLZ")

    theCanvas.SaveAs("ECALRatio.png")

    HCALRatio.Draw("COLZ")

    theCanvas.SaveAs("HCALRatio.png")

if __name__ =='__main__':
    main()
