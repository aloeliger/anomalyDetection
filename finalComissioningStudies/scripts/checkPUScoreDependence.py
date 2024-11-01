#Okay, we need a way to figure out if the score per PU is what we expect
#before and after this rate jump
#So what's the idea?
#I think the idea is this, our best PU proxy is non-zero trigger towers

import ROOT
from rich.console import Console
from rich.progress import track
import os
from time import perf_counter

console = Console()

def makeChainFromDict(theDict):
    scoreChain = ROOT.TChain("l1CaloSummaryEmuTree/L1CaloSummaryTree")
    upgradeTree = ROOT.TChain("l1UpgradeTree/L1UpgradeTree")
    inputTree = ROOT.TChain("CICADAInputNtuplizer/CICADAInputTree")
    triggerPrimitiveTree = ROOT.TChain("HCALTrigPrimAnalyzer/HCALTriggerPrimitives")

    for run in theDict:
        for root,dirs,files in os.walk(theDict[run]):
            for fileName in files:
                theFile = f'{root}/{fileName}'
                scoreChain.Add(theFile)
                upgradeTree.Add(theFile)
                inputTree.Add(theFile)
                triggerPrimitiveTree.Add(theFile)
    scoreChain.AddFriend(upgradeTree)
    scoreChain.AddFriend(inputTree)
    scoreChain.AddFriend(triggerPrimitiveTree)
    return scoreChain

def makePlotsForDF(df, identifier, nEntries):
    #nEntries = df.Count()
    towerCountHisto = df.Histo1D(
        (
            f'{identifier}_TowerCounts;Tower Counts;Events',
            f'{identifier}_TowerCounts;Tower Counts;Events',
            100,
            0.0,
            1200.0,
        ),
        "towerCount"
    )

    cicadaInputSumHisto = df.Histo1D(
        (
            f'{identifier}_CICADAInputSum;CICADA Input Sum;Events',
            f'{identifier}_CICADAInputSum;CICADA Input Sum;Events',
            100,
            0.0,
            1000.0,
        ),
        "CICADAInputSum",
    )

    scoreTowerCountHisto = df.Histo2D(
        (
            f'{identifier}_CICADAScore_TowerCount;Tower Count;CICADA Score',
            f'{identifier}_CICADAScore_TowerCount;Tower Count;CICADA Score',
            100,
            0.0,
            1200.0,
            100,
            0.0,
            256.0
        ),
        "towerCount",
        "CICADAScore",
    )

    scoreCICADAInputSumHisto = df.Histo2D(
        (
            f'{identifier}_CICADAScore_CICADAInputSum;CICADA Input Sum;CICADA Score',
            f'{identifier}_CICADAScore_CICADAInputSum;CICADA Input Sum;CICADA Score',
            100,
            0.0,
            1000.0,
            100,
            0.0,
            256.0,
        ),
        "CICADAInputSum",
        "CICADAScore",
    )

    triggerPrimitiveHisto = df.Histo1D(
        (
            f'{identifier}_TriggerPrimitiveET;Trigger Primitive ETs;Fraction',
            f'{identifier}_TriggerPrimitiveET;Trigger Primitive ETs;Fraction',
            100,
            0.0,
            3000.0,
        ),
        "trigPrimSum",
    )

    scoreTriggerPrimitiveHisto = df.Histo2D(
        (
            f'{identifier}_CICADAScore_TriggerPrimitiveET;Trigger Primitive ETs;CICADA Score',
            f'{identifier}_CICADAScore_TriggerPrimitiveET;Trigger Primitive ETs;CICADA Score',
            100,
            0.0,
            3000.0,
            100,
            0.0,
            256.0,
        ),
        "trigPrimSum",
        "CICADAScore",
    )

    totalETHisto = df.Histo1D(
        (
            f'{identifier}_totalET;Total ET;Fraction',
            f'{identifier}_totalET;Total ET;Fraction',
            100,
            0.0,
            1000.0,
        ),
        'totalET',
    )

    scoreTotalETHisto = df.Histo2D(
        (
            f'{identifier}_score_totalET;Total ET;Fraction',
            f'{identifier}_score_totalET;Total ET;Fraction',
            100,
            0.0,
            1000.0,
            100,
            0.0,
            256.0,
        ),
        'totalET',
        'CICADAScore',
    )

    #trigger some drawing and do all this stuff
    #nEntries = nEntries.GetValue()
    with console.status("Finalizing plots..."):
        canvasName = f'{identifier}_Canvas'
        theCanvas = ROOT.TCanvas(canvasName)
        theCanvas.SetGridx()
        theCanvas.SetGridy()

        towerCountHisto.Scale(1.0/nEntries)
        towerCountHisto.SetLineColor(ROOT.kRed)
        towerCountHisto.SetLineWidth(2)
        towerCountHisto.Draw("HIST")

        theCanvas.SaveAs(f"{identifier}_TowerCounts.png")

        cicadaInputSumHisto.Scale(1.0/nEntries)
        cicadaInputSumHisto.SetLineColor(ROOT.kRed)
        cicadaInputSumHisto.SetLineWidth(2)
        cicadaInputSumHisto.Draw("HIST")

        theCanvas.SaveAs(f'{identifier}_CICADAInputSums.png')

        scoreTowerCountHisto.Scale(1.0/nEntries)
        scoreTowerCountHisto.Draw("COLZ")

        theCanvas.SaveAs(f'{identifier}_score_TowerCounts.png')

        scoreCICADAInputSumHisto.Scale(1.0/nEntries)
        scoreCICADAInputSumHisto.Draw("COLZ")

        theCanvas.SaveAs(f'{identifier}_score_CICADAInputSums.png')

        triggerPrimitiveHisto.Scale(1.0/nEntries)
        triggerPrimitiveHisto.SetLineColor(ROOT.kRed)
        triggerPrimitiveHisto.SetLineWidth(2)
        triggerPrimitiveHisto.Draw("HIST")

        theCanvas.SaveAs(f'{identifier}_triggerPrimitiveET.png')

        scoreTriggerPrimitiveHisto.Scale(1.0/nEntries)
        scoreTriggerPrimitiveHisto.Draw("COLZ")

        theCanvas.SaveAs(f"{identifier}_score_triggerPrimitiveET.png")

        totalETHisto.Scale(1.0/nEntries)
        totalETHisto.SetLineColor(ROOT.kRed)
        totalETHisto.SetLineWidth(2)
        totalETHisto.Draw("HIST")

        theCanvas.SaveAs(f'{identifier}_totalET.png')

        scoreTotalETHisto.Scale(1.0/nEntries)
        scoreTotalETHisto.Draw("COLZ")

        theCanvas.SaveAs(f"{identifier}_score_totalET.png")
    
def makePUPlots(theChain, identifier):
    theDataframe = ROOT.RDataFrame(theChain)

    console.print("Defining variables")
    
    towerCountFunction = """
    int towerCount = 0;
    try {
       for(int i = 0; i<L1Upgrade.sumType.size(); ++ i) {
          if(L1Upgrade.sumType.at(i) == 21 and L1Upgrade.sumBx.at(i) == 0) {
             towerCount = sumIEt.at(i);
          }
       }
       return towerCount;
    }
    catch (const std::runtime_error& e) {
       return -999;
    }
    """
    theDataframe = theDataframe.Define("towerCount", towerCountFunction)

    cicadaInputSumFunction = """
    int sum = 0;
    try {
       for(int i = 0; i < 18; ++i) {
          for(int j = 0; j < 14; ++j) {
             sum += modelInput[i*14+j];
          }
       }
       return sum;
    }
    catch (const std::runtime_error& e) {
       return -999;
    }
    """

    theDataframe = theDataframe.Define("CICADAInputSum", cicadaInputSumFunction)

    triggerPrimitiveSumFunction = """
    int sum = 0;
    try {
       for(int i = 0; i < trigPrimET.size(); ++i) {
          sum += trigPrimET.at(i);
       }
       return sum;
    }
    catch (const std::runtime_error& e) {
       return -999;
    }
    """

    theDataframe = theDataframe.Define("trigPrimSum", triggerPrimitiveSumFunction)
    
    totalETSumFunction = """
    int totalET = 0;
    try {
       for(int i = 0; i<L1Upgrade.sumType.size(); ++ i) {
          if(L1Upgrade.sumType.at(i) == 0 and L1Upgrade.sumBx.at(i) == 0) {
             totalET = sumIEt.at(i);
          }
       }
       return totalET;
    }
    catch (const std::runtime_error& e) {
       return -999;
    }
    """

    theDataframe = theDataframe.Define("totalET",totalETSumFunction)
    
    aboveAverageDF = theDataframe.Filter("CICADAScore > 70.0")
    belowAverageDF = theDataframe.Filter("CICADAScore < 70.0")

    console.print("Making histograms")

    nEntries = theDataframe.Count().GetValue()
    
    makePlotsForDF(theDataframe, identifier, nEntries)
    makePlotsForDF(aboveAverageDF, f'{identifier}_aboveAverage', nEntries)
    makePlotsForDF(belowAverageDF, f'{identifier}_belowAverage', nEntries)

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

    beforeChain = makeChainFromDict(beforeRuns)
    afterChain = makeChainFromDict(afterRuns)

    makePUPlots(beforeChain, "Before")
    makePUPlots(afterChain, "After")

if __name__ == '__main__':
    main()
