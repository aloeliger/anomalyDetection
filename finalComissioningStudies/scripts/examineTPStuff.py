import ROOT
from rich.console import Console
from rich.progress import track
from pathlib import Path
import os
import math
from time import perf_counter

console = Console()

def makeChainFromDict(theDict):
    HCALChain = ROOT.TChain("HCALTrigPrimAnalyzer/HCALTriggerPrimitives")
    ECALChain = ROOT.TChain("ECALTrigPrimAnalyzer/ECALTriggerPrimitives")
    for run in theDict:
        for root, dirs, files in os.walk(theDict[run]):
            for fileName in files:
                theFile = f'{root}/{fileName}'
                #console.print(theFile)
                HCALChain.Add(theFile)
                ECALChain.Add(theFile)
    return HCALChain, ECALChain

def makeTPPlots(theChain, identifier):
    start_time = perf_counter()
    nEntries = theChain.GetEntries()
    console.print(f'{identifier}: {nEntries}')
    with console.status('Making dataframe...'):
        theDataframe = ROOT.RDataFrame(theChain)
        TPSumFunction = """
        try {
        int sum = 0;
        for (int i = 0; i < trigPrimET.size(); ++i) {
              sum += trigPrimET.at(i);
           }
           return sum;
        }
        catch (const std::runtime_error& e) {
           return 0;
        }
        """
        theDataframe = theDataframe.Define("TPSum", TPSumFunction)
        theHisto = theDataframe.Histo2D(
            (
                f'{identifier}_AverageETDeposit;iEta;iPhi',
                f'{identifier}_AverageETDeposit;iEta;iPhi',
                56,
                -28.0,
                29.0,
                72,
                1.0,
                73.0
            ),
            "trigPrimIEta",
            "trigPrimIPhi",
            "trigPrimET",
        )

        TPHisto = theDataframe.Histo1D(
            (
                f'{identifier}_TP_ETDeposits;ET;Fraction',
                f'{identifier}_TP_ETDeposits;ET;Fraction',
                6,
                0.0,
                6.0,
            ),
            "trigPrimET",
        )
        TPSumHisto = theDataframe.Histo1D(
            (
                f'{identifier}_TP_ET_Sum;ETSum;Fraction',
                f'{identifier}_TP_ET_Sum;ETSum;Fraction',
                100,
                0.0,
                199.0,
            ),
            "TPSum"
        )
    console.print("Made dataframe and histograms.")

    with console.status("Finalizing plots..."):
        theHisto.Scale(1.0/nEntries)
        canvasName = f'{identifier}_Canvas'
        theCanvas = ROOT.TCanvas(canvasName)
        theHisto.Draw("COLZ")
        theHisto.GetZaxis().SetRangeUser(0.0, 1.5)
    
        theCanvas.SaveAs(f'{identifier}_AverageTPs.png')

        TPHisto.Scale(1.0/(nEntries*72*56))
        TPHisto.SetLineColor(ROOT.kRed)
        TPHisto.SetLineWidth(2)
        TPHisto.Draw('HIST')

        theCanvas.SaveAs(f'{identifier}_TPETs.png')

        TPSumHisto.Scale(1.0/nEntries)
        TPSumHisto.SetLineColor(ROOT.kRed)
        TPSumHisto.SetLineWidth(2)
        TPSumHisto.Draw('HIST')

        theCanvas.SaveAs(f'{identifier}_TPSum.png')
        
    console.print("Done Finalizing Plots")
    end_time = perf_counter()
    console.print(f'Done in {end_time-start_time:3.2g} seconds')
    
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

    beforeHCALChain, beforeECALChain = makeChainFromDict(beforeRuns)
    afterHCALChain, afterECALChain = makeChainFromDict(afterRuns)
    
    makeTPPlots(beforeECALChain, "ECAL_Before")
    makeTPPlots(afterECALChain, "ECAL_After")
    makeTPPlots(beforeHCALChain, "HCAL_Before")
    makeTPPlots(afterHCALChain, "HCAL_After")

if __name__ == '__main__':
    main()
