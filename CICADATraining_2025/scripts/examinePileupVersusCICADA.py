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
from copy import deepcopy

from sklearn.linear_model import LinearRegression

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

# def makeCICADAInputChain(trainingDirectories, maxFiles=None):
#     theChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')
#     nFiles = 0
#     for directory in trainingDirectories:
#         for root, dirs, files in os.walk(directory):
#             for fileName in files:
#                 theFile = f'{root}/{fileName}'
#                 theChain.Add(theFile)
#                 nFiles += 1
#                 if maxFiles != None and nFiles >= maxFiles:
#                     break

#     console.log(f'{nFiles} files in the CICADA Input Chain')
#     return theChain

def makeCICADAInputChain(trainingDirectories, maxFiles=None):
    theChain = ROOT.TChain('l1CaloSummaryEmuTree/L1CaloSummaryTree')
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

def makeMCChainFromPath(signalPath):
    theChain = ROOT.TChain('l1CaloTowerEmuTree/L1CaloTowerTree')
    for root, dirs, files in os.walk(signalPath):
        for fileName in files:
            theFile = f'{root}/{fileName}'
            theChain.Add(theFile)
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

def deriveEffsFromHisto(histo):
    effs = {}
    total_integral = histo.Integral(1, histo.GetNbinsX()+1)
    for binNum in range(1, histo.GetNbinsX()+2):
        cicadaThreshold = histo.GetXaxis().GetBinLowEdge(binNum)
        integral = histo.Integral(binNum, histo.GetNbinsX()+1)
        eff = integral/total_integral
        effs[cicadaThreshold] = eff
    return effs
    
def dumpRateTable(rateTable):
    infoTable = Table(title='Rates')
    infoTable.add_column('CICADA Threshold')
    infoTable.add_column('Rate')

    for index, threshold in enumerate(rateTable):
        if index % 10 != 0:
            continue
        infoTable.add_row(f'{threshold}', f'{rateTable[threshold]}')
    console.print(infoTable)

def dumpJointTable(signalEffTable, dataRateTable):
    infoTable = Table(title='MC/Data')
    infoTable.add_column('CICADA Threshold')
    infoTable.add_column('Data Rate')
    infoTable.add_column('Signal Eff')

    for index, threshold in enumerate(signalEffTable):
        if index % 10 != 0:
            continue
        infoTable.add_row(
            f'{threshold}',
            f'{dataRateTable[threshold]:0.4g}',
            f'{signalEffTable[threshold]:0.4g}',
        )
    console.print(infoTable)

# def makeCICADAInputGrids(theChain, npv_chain, outputPath):
#     nEntries = theChain.GetEntries()
#     inputGrids = np.zeros((nEntries,18,14,1))
#     npvs = np.zeros((nEntries,))


#     inputHisto = ROOT.TH2D(
#         'CICADAInputHisto',
#         'CICADAInputHisto;iEta;iPhi',
#         14,
#         0.0,
#         14.0,
#         18,
#         0.0,
#         18.0
#     )
    
#     for i in track(range(nEntries)):
#         theChain.GetEntry(i)
#         npv_chain.GetEntry(i)    
#         for j in range(252):
#             iEta = theChain.iEta[j]
#             iPhi = theChain.iPhi[j]
#             modelInput = theChain.modelInput[j]
#             inputGrids[i, iPhi, iEta, 0] = modelInput
#             npvs[i] = npv_chain.npv

#             inputHisto.Fill(iEta, iPhi, modelInput)
#     theCanvas = ROOT.TCanvas(inputHisto.GetName())
#     inputHisto.Scale(1.0/inputHisto.Integral())
#     inputHisto.Draw("COLZ")

#     quietROOTFunc(theCanvas.SaveAs)(
#         str(outputPath/"CICADAInputGrids.png")
#     )

#     return inputGrids, npvs

def makeCICADAInputGrids(theChain, npv_chain, outputPath):
    nEntries = theChain.GetEntries()
    inputGrids = np.zeros((nEntries,18,14,1))
    npvs = np.zeros((nEntries,))


    inputHisto = ROOT.TH2D(
        'CICADAInputHisto',
        'CICADAInputHisto;iEta;iPhi',
        14,
        0.0,
        14.0,
        18,
        0.0,
        18.0
    )
    
    for i in track(range(nEntries)):
        theChain.GetEntry(i)
        npv_chain.GetEntry(i)    
        for iPhi in range(18):
            for iEta in range(14):
                modelInput = theChain.GetLeaf('modelInput').GetValue(iPhi*14+iEta)
                inputGrids[i, iPhi, iEta, 0] = modelInput
                inputHisto.Fill(iEta, iPhi, modelInput)
        npvs[i] = npv_chain.npv

    theCanvas = ROOT.TCanvas(inputHisto.GetName())
    inputHisto.Scale(1.0/inputHisto.Integral())
    inputHisto.Draw("COLZ")

    quietROOTFunc(theCanvas.SaveAs)(
        str(outputPath/"CICADAInputGrids.png")
    )

    return inputGrids, npvs

def makeSuppressedCICADAInputs(cicadaInputs):
    newInputs = deepcopy(cicadaInputs)
    return np.where(newInputs <= 1.0, 0, newInputs)

def makeChainBasedCorrelationNPVCorrelationPlot(newPredictions, npvChain, outputPath):
    histoName = 'SuppressedCICADANPVCorrelation'
    theCanvas = ROOT.TCanvas(histoName)

    theHistogram = ROOT.TH2D(
        histoName,
        histoName,
        30,
        0.0,
        80.0,
        40,
        0.0,
        150.0
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
    
def makeMainPlotsAndInfo(outputPath, dataframe, chain, nFiles, cicadaInputChain, model):
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

    npv_mean = int(dataframe.Mean('npv').GetValue())
    console.print(f'Mean NPV value: {npv_mean}')

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

    highPU_scoreHisto = npv_frame.Filter(f'npv > {npv_mean}').Histo1D(
        (
            'CICADA_Score_highPU',
            'CICADA_Score_highPU',
            256,
            0.0,
            256.0,
        ),
        'CICADAScore',
    )

    lowPU_scoreHisto = npv_frame.Filter(f'npv <= {npv_mean}').Histo1D(
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
    cicadaInputs, npv_arr = makeCICADAInputGrids(cicadaInputChain, chain, outputPath)
    #simple suppression scheme
    console.log("Making predictions from these old inputs")
    oldPredictions = model.predict(
        cicadaInputs.reshape((-1,252)),
        verbose=0
    )
    cicadaScores = dataframe.AsNumpy(["CICADAScore"])["CICADAScore"]
    differences = cicadaScores.reshape((-1,)) - oldPredictions.reshape((-1,))
    mean_differences = np.mean(np.abs(differences))
    console.print(f"Mean absolute difference: {mean_differences}")

    console.print("Making suppressed inputs and predictions")
    suppressedCICADAInputs = makeSuppressedCICADAInputs(cicadaInputs)    
    newPredictions = model.predict(
        suppressedCICADAInputs.reshape((-1,252)),
        verbose=0
    )
    lowPUNewPredictions = newPredictions[npv_arr <= npv_mean]
    highPUNewPredictions = newPredictions[npv_arr > npv_mean]
    
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

    console.log('Some Info')
    #console.print(oldPredictions.shape)
    #console.print(npv_arr.shape)
    original_prediction_corr = np.corrcoef(oldPredictions.reshape((-1,))[npv_arr != 1], npv_arr[npv_arr != 1])
    suppressed_prediction_corr = np.corrcoef(newPredictions.reshape((-1,))[npv_arr != 1], npv_arr[npv_arr != 1])
    #exit(0)
    console.log(original_prediction_corr.shape)
    console.log(suppressed_prediction_corr.shape)
    console.log(f'NPV correlation: Old: {original_prediction_corr[0,1]:0.3}. New: {suppressed_prediction_corr[0,1]:0.3}')

    #We need lines of best fit so we can understand how severe the relationship is
    original_fit = LinearRegression()
    original_fit.fit(npv_arr.reshape((-1,1))[npv_arr != 1], oldPredictions[npv_arr != 1])
    suppressed_fit = LinearRegression()
    suppressed_fit.fit(npv_arr.reshape((-1,1))[npv_arr != 1], newPredictions[npv_arr != 1])

    original_fit_coef = original_fit.coef_[0][0]
    original_fit_intercept = original_fit.intercept_[0]
    suppressed_fit_coef = suppressed_fit.coef_[0][0]
    suppressed_fit_intercept = suppressed_fit.intercept_[0]

    #console.print(original_fit_coef)
    #console.print(original_fit_intercept)
    #console.print(suppressed_fit_coef)
    #console.print(suppressed_fit_intercept)

    console.log(f'Old Line: {original_fit_coef:0.3} * npv + {original_fit_intercept:0.3}')
    console.log(f'New Line: {suppressed_fit_coef:0.3} * npv + {suppressed_fit_intercept:0.3}')
    
    console.log('Done')

    return currentRateTable, suppressedRateTable

def towerIPhiToRegionIPhi(iPhi):
    #iPhi maps to 0-17, but 71 and 72 fall inside the 0th region
    return ((iPhi+2)%72) // 4

def towerIEtaToRegionIEta(iEta):
    #ignore regions outside our range
    if iEta < -28 or iEta > 28:
        return None

    #Negative regions
    #populate 0-6
    if iEta < 0:
        regioniEta = (iEta + 28) // 4
        return regioniEta
    #positive regions
    #populate 7-13
    elif iEta > 0:
        regioniEta = ((iEta-1) // 4) + 1
        return regioniEta
    else:
        console.log('Assumptions violated about hower tower iEta work. Found one that is zero')
        raise RuntimeError()
    
def makeCICADAInputGridFromTowers(theChain):
    grid = np.zeros((18,14,1))

    for i in range(theChain.L1CaloTower.nTower):
        #First thing's first, we need to figure out the adjusted iEta/iPhi
        #towerIPhi = theChain.L1CaloTower.iphi
        #towerIEta = theChain.L1CaloTower.ieta
        towerIPhi = theChain.GetLeaf('L1CaloTower.iphi').GetValue(i)
        towerIEta = theChain.GetLeaf('L1CaloTower.ieta').GetValue(i)
        towerIPhi = int(towerIPhi)
        towerIEta = int(towerIEta)

        #towerEt = theChain.L1CaloTower.iet
        towerEt = theChain.GetLeaf("L1CaloTower.iet").GetValue(i)
        towerEt = int(towerEt)

        regionIPhi = towerIPhiToRegionIPhi(towerIPhi)
        regionIEta = towerIEtaToRegionIEta(towerIEta)

        grid[regionIPhi, regionIEta, 0] += towerEt
    return grid
    
def estimateSuppressedAndUnsuppressedSignalEffs(
        signalPath,
        outputPath,
        model,
        unsuppressedDataRateTable,
        suppressedDataRateTable,
):
    theChain = makeMCChainFromPath(signalPath)
    nEntries = theChain.GetEntries()
    console.log(f'{signalPath}: {nEntries} Entries')
    CICADAInputGrids = []
    for i in track(range(nEntries), description = 'Making Signal Grids'):
        theChain.GetEntry(i)

        grid = makeCICADAInputGridFromTowers(theChain)

        CICADAInputGrids.append(grid)
        
    CICADAInputGrids = np.array(CICADAInputGrids)
    unsuppressedModelPredictions = model.predict(
        CICADAInputGrids.reshape(-1, 252),
        verbose=0
    )

    #console.print(CICADAInputGrids[:5])

    suppressedCICADAGrids = makeSuppressedCICADAInputs(CICADAInputGrids)
    suppressedModelPredictions = model.predict(
        suppressedCICADAGrids.reshape(-1, 252),
        verbose=0
    )
    #console.print(suppressedCICADAGrids[:5])

    nEntriesEqualToOne = np.sum(CICADAInputGrids == 1.0)
    console.print(f'Number of Entries equal to 1: {nEntriesEqualToOne}')
    nSuppressedEntriesEqualToOne = np.sum(suppressedCICADAGrids == 1.0)
    console.print(f'Number of Suppressed entries equal to 1: {nSuppressedEntriesEqualToOne}')
    
    gridDifference = np.mean(
        np.abs(suppressedCICADAGrids-CICADAInputGrids)
    )
    console.print(f'Mean absolute difference in suppressed grids: {gridDifference}')

    differenceInPredictions = np.mean(
        np.abs(suppressedModelPredictions-unsuppressedModelPredictions),
    )
    console.print(f'Mean absolute difference in suppressed/unsuppressed predictions: {differenceInPredictions}')

    #make the histograms
    scoreHisto = ROOT.TH1D(
        'scoreHisto',
        'scoreHisto',
        256,
        0.0,
        256.0,
    )

    suppressedScoreHisto = ROOT.TH1D(
        'suppressedScoreHisto',
        'suppressedScoreHisto',
        256,
        0.0,
        256.0,
    )

    for prediction in unsuppressedModelPredictions:
        scoreHisto.Fill(prediction)
    for prediction in suppressedModelPredictions:
        suppressedScoreHisto.Fill(prediction)

    unsuppressedEffTable = deriveEffsFromHisto(scoreHisto)
    suppressedEffTable = deriveEffsFromHisto(suppressedScoreHisto)

    dumpJointTable(unsuppressedEffTable, unsuppressedDataRateTable)
    dumpJointTable(suppressedEffTable, suppressedDataRateTable)

    theCanvas = ROOT.TCanvas()
    suppressedScoreHisto.Draw("Hist")
    theCanvas.SaveAs(
        str(outputPath/'suppressedScoreHisto.png')
    )

    scoreHisto.Draw("HIST")
    theCanvas.SaveAs(
        str(outputPath/'scoreHisto.png')
    )
    
def main(args):
    console.log('CICADA/Pileup plots start')
    ROOT.gStyle.SetOptStat(0)

    outputPath = Path(args.outputDir)
    outputPath.mkdir(exist_ok=True, parents=True)

    dataframe, chain, nFiles = makeDataframe(args.trainingDirectories, args.maxFiles)
    cicadaInputChain = makeCICADAInputChain(args.trainingDirectories, args.maxFiles)
    model = from_pretrained_keras("cicada-project/cicada-v2.1")

    console.rule('Main Plots and Info')
    unsuppressedRateTable, suppressedRateTable = makeMainPlotsAndInfo(outputPath, dataframe, chain, nFiles, cicadaInputChain, model)

    exit(0)
    console.rule('Signal Information')
    HToLongLivedPath = '/hdfs/store/user/aloeliger/suppressionSamples/L1Ntuples_HToLongLived_2023_27Jul2023_0949/'
    SUEPPath = '/hdfs/store/user/aloeliger/suppressionSamples/L1Ntuples_SUEP_2023_28Jul2023_1034/'
    VBFHto2C = '/hdfs/store/user/aloeliger/suppressionSamples/L1Ntuples_VBFHto2C_2023_27Jul2023_0950/'
    console.print('H to Long Lived')
    estimateSuppressedAndUnsuppressedSignalEffs(
        HToLongLivedPath,
        outputPath,
        model,
        unsuppressedRateTable,
        suppressedRateTable,
    )

    console.print('SUEP')
    estimateSuppressedAndUnsuppressedSignalEffs(
        SUEPPath,
        outputPath,
        model,
        unsuppressedRateTable,
        suppressedRateTable,
    )

    console.print('VBFH to 2C')
    estimateSuppressedAndUnsuppressedSignalEffs(
        VBFHto2C,
        outputPath,
        model,
        unsuppressedRateTable,
        suppressedRateTable,
    )

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
