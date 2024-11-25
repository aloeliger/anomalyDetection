#Script to examine the correlation of CICADA to pileup to help understand the effectivesness of zero suppression schemes

import ROOT
import argparse
from pathlib import Path
from rich.console import Console
from rich.table import Table
from rich.progress import track
from validateTrainingData import makeDataframe
import numpy as np
import os
from anomalyDetection.anomalyTriggerSkunkworks.utilities.decorators import quietROOTFunc
from anomalyDetection.anomalyTriggerSkunkworks.plotSettings.utilities import convertEffToRate
from huggingface_hub import from_pretrained_keras

console = Console()

def makeDataframe(trainingDirectories, maxFiles = None):
    theChain = ROOT.TChain('npvNtuplizer/NPVTree')
    upgradeChain = ROOT.TChain('l1UpgradeTree/L1UpgradeTree')
    eventChain = ROOT.TChain('l1EventTree/L1EventTree')
    towerTree = ROOT.TChain('l1CaloTowerEmuTree/L1CaloTowerTree')
    cicadaTree = ROOT.TChain('l1CaloSummaryEmuTree/L1CaloSummaryTree')
    nFiles = 0
    for directory in trainingDirectories:
        for root, dirs, files in os.walk(directory):
            for fileName in files:
                nFiles += 1
                theFile = f'{root}/{fileName}'
                theChain.Add(theFile)
                upgradeChain.Add(theFile)
                eventChain.Add(theFile)
                towerTree.Add(theFile)
                cicadaTree.Add(theFile)
                if maxFiles != None and nFiles >= maxFiles:
                    break
    theChain.AddFriend(upgradeChain)
    theChain.AddFriend(eventChain)
    theChain.AddFriend(towerTree)
    theChain.AddFriend(cicadaTree)
    theDataframe = ROOT.RDataFrame(theChain)

    console.log(f'{nFiles} files in main chain/dataframe')
    
    return theDataframe, theChain, nFiles

def makeCICADAInputChain(trainingDirectories, maxFiles=None):
    theChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')
    nFiles = 0
    for directory in trainingDirectories:
        for root, dirs, files in os.walk(directory):
            for fileName in files:
                theFile = f'{root}/{fileName}'
                theChain.Add(theFile)
                nFiles += 1
                if maxFiles != None and nFiles >= maxFiles:
                    break

    console.log(f'{nFiles} files in the CICADA Input Chain')
    return theChain

def drawHistoBooking(histo, xAxisTitle, outputPath, histoName):
    theCanvas = ROOT.TCanvas(histo.GetName())

    histo.Scale(1.0/histo.Integral())
    histo.Draw("COLZ")
    histo.GetXaxis().SetTitle(xAxisTitle)
    histo.GetYaxis().SetTitle('CICADA Score')
    correlationFactor = histo.GetCorrelationFactor()
    console.log(f'{xAxisTitle}: {correlationFactor:.2g}')

    correlationLatex = ROOT.TLatex()
    correlationLatex.SetNDC()
    correlationLatex.DrawLatex(0.1, 0.9, f'Corr. Coeff. {correlationFactor:.2g}')

    quietROOTFunc(theCanvas.SaveAs)(str(outputPath/f'{histoName}.png'))

def deriveRatesFromHisto(histo):
    rates = {}

    total_integral = histo.Integral(1, histo.GetNbinsX()+1)
    
    for binNum in range(1, histo.GetNbinsX()+2):
        cicadaThreshold = histo.GetXaxis().GetBinLowEdge(binNum)
        integral = histo.Integral(binNum, histo.GetNbinsX()+1)
        eff = integral/total_integral
        rate = convertEffToRate(eff, nBunches = 2352)

        rates[cicadaThreshold] = rate
    return rates

def dumpRateTable(rateTable):
    infoTable = Table(title='Rates')
    infoTable.add_column('CICADA Threshold')
    infoTable.add_column('Rate')

    for threshold in rateTable:
        infoTable.add_row(f'{threshold}', f'{rateTable[threshold]}')
    console.print(infoTable)

def makeCICADAInputGrids(theChain, npv_chain):
    nEntries = theChain.GetEntries()
    inputGrids = np.zeros((nEntries,18,14,1))
    npvs = np.zeros((nEntries,))
    
    for i in track(range(nEntries)):
        theChain.GetEntry(i)
        npv_chain.GetEntry(i)    
        for j in range(252):
            iEta = theChain.iEta[j]
            iPhi = theChain.iPhi[j]
            modelInput = theChain.modelInput[j]
            inputGrids[i, iPhi, iEta, 0] = modelInput
            npvs[i] = npv_chain.npv
            
    return inputGrids, npvs

# def makeSuppressedCICADAInputs(cicadaInputs):
#     return np.where(cicadaInputs < 1, 0, cicadaInputs)
def makeSuppressedCICADAInputs(cicadaInputs):
    newArray = cicadaInputs.copy()
    highMaskIndices = [0,5,6,7,8,13]
    maskSpecial = np.isin(np.arange(newArray.shape[2]), highMaskIndices)
    newArray[:, :, maskSpecial, :][newArray[:, :, maskSpecial, :] <= 2] = 0
    newArray[:, :, ~maskSpecial, :][newArray[:, :, ~maskSpecial, :] <= 1] = 0
    return newArray

def makeChainBasedCorrelationNPVCorrelationPlot(newPredictions, npvChain, outputPath):
    histoName = 'SuppressedCICADANPVCorrelation'
    theCanvas = ROOT.TCanvas(histoName)

    theHistogram = ROOT.TH2D(
        histoName,
        histoName,
        20,
        0.0,
        80.0,
        30,
        0.0,
        256.0
    )

    for i in range(len(newPredictions)):
        if npvChain[i] == 1:
            continue

        theHistogram.Fill(
            npvChain[i],
            newPredictions[i],
        )

    theHistogram.Scale(1.0/theHistogram.Integral())
    theHistogram.Draw("COLZ")
    theHistogram.GetXaxis().SetTitle('NPV')
    theHistogram.GetYaxis().SetTitle('CICADA SCore')
    correlationFactor = theHistogram.GetCorrelationFactor()
    console.log(f'NPV: {correlationFactor:.2g}')

    correlationLatex = ROOT.TLatex()
    correlationLatex.SetNDC()
    correlationLatex.DrawLatex(0.1, 0.9, f'Corr. Coeff. {correlationFactor:.2g}')

    quietROOTFunc(theCanvas.SaveAs)(str(outputPath/f'{histoName}.png'))
    

def main(args):
    console.log('CICADA/Pileup plots start')
    ROOT.gStyle.SetOptStat(0)

    outputPath = Path(args.outputDir)
    outputPath.mkdir(exist_ok=True, parents=True)

    dataframe, chain, nFiles = makeDataframe(args.trainingDirectories, args.maxFiles)
    cicadaInputChain = makeCICADAInputChain(args.trainingDirectories, args.maxFiles)
    model = from_pretrained_keras("cicada-project/cicada-v2.1")

    HTFunction = """
        try {
        for(int i = 0; i < L1Upgrade.sumType.size(); ++i){
           if(L1Upgrade.sumType.at(i) == 1 and L1Upgrade.sumBx.at(i) == 0){
              return (double) L1Upgrade.sumEt.at(i);
           }
        }
        return 0.0;
        }
        catch (const std::runtime_error& e) {
           return 0.0;
        }
    """

    ETFunction = """
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

    triggerTowerFunction = """
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

    dataframe = dataframe.Define(
        "HT",
        HTFunction,
    )
    dataframe = dataframe.Define(
        'ET',
        ETFunction,
    )
    dataframe = dataframe.Define(
        'nTriggerTowers',
        triggerTowerFunction,
    )

    npv_frame = dataframe.Filter('npv != 1')

    scoreHisto = dataframe.Histo1D(
        (
            'CICADA_Score',
            'CICADA_Score',
            256,
            0.0,
            256.0,
        ),
        'CICADAScore',
    )

    highPU_scoreHisto = npv_frame.Filter('npv > 38').Histo1D(
        (
            'CICADA_Score_highPU',
            'CICADA_Score_highPU',
            256,
            0.0,
            256.0,
        ),
        'CICADAScore',
    )

    lowPU_scoreHisto = npv_frame.Filter('npv <= 38').Histo1D(
        (
            'CICADA_Score_lowPU',
            'CICADA_Score_lowPU',
            256,
            0.0,
            256.0,
        ),
        'CICADAScore',
    )
    
    correlationHisto = npv_frame.Histo2D(
        (
            'CICADA_NPV',
            'CICADA_NPV',
            20,
            0.0,
            80.0,
            30,
            0.0,
            256.0
        ),
        'npv',
        'CICADAScore',
    )

    htHisto = dataframe.Histo2D(
        (
            'CICADA_HT',
            'CICADA_HT',
            20,
            0.0,
            1500.0,
            30,
            0.0,
            256.0,
        ),
        'HT',
        'CICADAScore'
    )

    etHisto = dataframe.Histo2D(
        (
            'CICADA_ET',
            'CICADA_ET',
            20,
            0.0,
            1500.0,
            30,
            0.0,
            256.0
        ),
        'ET',
        'CICADAScore'
    )
    
    console.log('Making correlation histograms...')
    
    drawHistoBooking(
        correlationHisto,
        'NPV',
        outputPath,
        'currentCICADACorrelation_NPV'
    )
    
    drawHistoBooking(
        htHisto,
        'HT',
        outputPath,
        'currentCICADACorrelation_HT'
    )

    drawHistoBooking(
        etHisto,
        'ET',
        outputPath,
        'currentCICADACorrelation_ET',
    )

    console.log('Examining predicted emulation rates...')

    currentRateTable = deriveRatesFromHisto(scoreHisto)
    dumpRateTable(currentRateTable)

    console.log('High PU rates')
    highPURateTable = deriveRatesFromHisto(highPU_scoreHisto)
    dumpRateTable(highPURateTable)

    console.log('Low PU rates')
    lowPURateTable = deriveRatesFromHisto(lowPU_scoreHisto)
    dumpRateTable(lowPURateTable)
    
    console.log('Making inputs for zero suppression schemes')

    cicadaInputs, npv_arr = makeCICADAInputGrids(cicadaInputChain, chain)
    #simple suppression scheme
    suppressedCICADAInputs = makeSuppressedCICADAInputs(cicadaInputs)

    newPredictions = model.predict(
        suppressedCICADAInputs.reshape(-1,252),
        verbose=0
    )
    lowPUNewPredictions = newPredictions[npv_arr <= 38]
    highPUNewPredictions = newPredictions[npv_arr > 38]
    
    newScoreHisto = ROOT.TH1D(
        'suppressedScoreHisto',
        'suppressedScoreHisto',
        256,
        0.0,
        256.0
    )
    lowPU_newScoreHisto = ROOT.TH1D(
        'lowPU_suppressedScoreHisto',
        'lowPU_suppressedScoreHisto',
        256,
        0.0,
        256.0
    )
    highPU_newScoreHisto = ROOT.TH1D(
        'highPU_suppressedScoreHisto',
        'highPU_suppressedScoreHisto',
        256,
        0.0,
        256.0
    )
    for prediction in newPredictions:
        newScoreHisto.Fill(prediction)
    for prediction in lowPUNewPredictions:
        lowPU_newScoreHisto.Fill(prediction)
    for prediction in highPUNewPredictions:
        highPU_newScoreHisto.Fill(prediction)

    console.log('New Suppressed Rates Overall')
    suppressedRateTable = deriveRatesFromHisto(newScoreHisto)
    dumpRateTable(suppressedRateTable)

    console.log('Suppressed Rates Low PU')
    lowPU_suppressedRateTable = deriveRatesFromHisto(lowPU_newScoreHisto)
    dumpRateTable(lowPU_suppressedRateTable)

    console.log('Suppressed Rates High PU')
    highPU_suppressedRateTable = deriveRatesFromHisto(highPU_newScoreHisto)
    dumpRateTable(highPU_suppressedRateTable)

    console.log('Suppressed CICADA NPV Correlation')
    makeChainBasedCorrelationNPVCorrelationPlot(newPredictions, npv_arr, outputPath)
    
    console.log('Done')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Examine the correlation of CICADA to pileup to help understand the effectiveness of zero suppression schemes')
    parser.add_argument(
        'trainingDirectories',
        nargs='+',
        help='Directories with files to be used in training',
    )
    parser.add_argument(
        '--outputDir',
        nargs='?',
        default='CICADA_npv_correlation'
    )

    parser.add_argument(
        '--maxFiles',
        nargs='?',
        type=int,
        help='Max files to use from each training directory'
    )

    args = parser.parse_args()

    main(args)
