import ROOT
import argparse
import os
from rich.console import Console
import numpy as np
from pathlib import Path
from anomalyDetection.anomalyTriggerSkunkworks.utilities.decorators import quietROOTFunc

console = Console()

def makeDataframe(trainingDirectories):
    theChain = ROOT.TChain('npvNtuplizer/NPVTree')
    upgradeChain = ROOT.TChain('l1UpgradeTree/L1UpgradeTree')
    cicadaInputChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')
    eventChain = ROOT.TChain('l1EventTree/L1EventTree')
    towerTree = ROOT.TChain('l1CaloTowerEmuTree/L1CaloTowerTree')
    nFiles = 0
    for directory in trainingDirectories:
        for root, dirs, files in os.walk(directory):
            for fileName in files:
                nFiles += 1
                theFile = f'{root}/{fileName}'
                theChain.Add(theFile)
                upgradeChain.Add(theFile)
                cicadaInputChain.Add(theFile)
                eventChain.Add(theFile)
                towerTree.Add(theFile)
    theChain.AddFriend(upgradeChain)
    theChain.AddFriend(cicadaInputChain)
    theChain.AddFriend(eventChain)
    theChain.AddFriend(towerTree)
    theDataframe = ROOT.RDataFrame(theChain)
    return theDataframe, theChain, nFiles

#make some quantities we will need
def defineQuantities(dataframe):
    HTFunction =     """
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

    cicadaInputSumFunction = """
    int sum = 0;
    try {
       for(int i = 0; i < 18; ++i) {
          for(int j = 0; j < 14; ++j) {
             //sum += modelInput[i*14+j];
             sum += modelInput.at(i*14 + j);
          }
       }
       return sum;
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
    dataframe = dataframe.Define(
        'cicadaInputSum',
        cicadaInputSumFunction,
    )

    return dataframe

def getListOfUniqueRuns(dataframe):
    runs = dataframe.AsNumpy(['run'])['run']
    uniqueRuns = np.unique(runs)
    return uniqueRuns
    
#Just get a sense of what we are looking at in terms of these runs
#In total
#Some things we want to know:
# Number of Primary Vertices
# HT
# ET
# Number of trigger towers
# Region Energies

def makeProfileBookings(dataframe, identifier):
    npvBooking = dataframe.Histo1D(
        (
            f'NPV_{identifier}',
            f'NPV_{identifier}',
            120,
            0.0,
            120.0,
        ),
        'npv',
    )

    HTBooking = dataframe.Histo1D(
        (
            f'HT_{identifier}',
            f'HT_{identifier}',
            100,
            0.0,
            1000.0,
        ),
        'HT',
    )

    ETBooking = dataframe.Histo1D(
        (
            f'ET_{identifier}',
            f'ET_{identifier}',
            100,
            0.0,
            2000.0
        ),
        'ET'
    )

    triggerTowerBooking = dataframe.Histo1D(
        (
            f'nTriggerTowers_{identifier}',
            f'nTriggerTowers_{identifier}',
            100,
            0.0,
            4000.0
        ),
        'nTriggerTowers'
    )
    
    cicadaBooking = dataframe.Histo1D(
        (
            f'CICADAInputSum_{identifier}',
            f'CICADAInputSum_{identifier}',
            100,
            0.0,
            2000.0,
        ),
        'cicadaInputSum',
    )

    resultBookings = {
        'NPV': npvBooking,
        'HT': HTBooking,
        'ET': ETBooking,
        'nTriggerTowers': triggerTowerBooking,
        'cicadaInputSum': cicadaBooking,
    }

    return resultBookings

def makeEtaSliceBookings(dataframe, identifier):
    etaPairs = (
        (0,13),
        (1,12),
        (2,11),
        (3,10),
        (4,9),
        (5,8),
        (6,7),
    )

    histogramBookings = {}
    etaDFs = {}

    for etaPair in etaPairs:
        eta = etaPair[0]
        key = f'Eta{eta}_CICADARegions'
        name = f'{key}_{identifier}'
        #console.print(f'iEta == {etaPair[0]} || iEta == {etaPair[1]}')
        #console.print(dataframe.GetColumnNames())
        #etaDFs[key] = dataframe.Filter(
        #    #f'iEta == {etaPair[0]} || iEta == {etaPair[1]}'
        #)
        etaDFs[key] = dataframe.Define(
            'eta_mask',
            f'iEta == {etaPair[0]} || iEta == {etaPair[1]}',
        ).Define(
            'CICADA_in_Eta',
            'modelInput[eta_mask]',
        )
        histoBooking = etaDFs[key].Histo1D(
            (
                name,
                name,
                30,
                0.0,
                30.0
            ),
            'CICADA_in_Eta',
        )
        histogramBookings[key] = histoBooking
    return histogramBookings, etaDFs

def drawSimplePlot(histogram, canvas, outputPath, xAxis, name):
    histogram.SetLineColor(ROOT.kRed)
    histogram.SetLineWidth(2)

    histogram.Draw("HIST")

    histogram.GetXaxis().SetTitle(xAxis)
    histogram.GetYaxis().SetTitle('Events')
    histogram.SetTitle(xAxis)

    quietROOTFunc(canvas.SaveAs)(
        str(outputPath / f'{name}.png')
    )
    
def drawProfileHistograms(histogramDict, identifier, outputPath):
    #First, let's trigger the calculation of results, if not already available
    for histName in histogramDict:
        histogramDict[histName] = histogramDict[histName].GetValue()

    #now let's start drawing things

    #1. NPV
    theCanvas = ROOT.TCanvas(identifier)
    npvPlot = histogramDict['NPV']
    drawSimplePlot(
        npvPlot,
        theCanvas,
        outputPath,
        'NPV',
        'NPV',
    )

    #2. HT
    HTPlot = histogramDict['HT']
    drawSimplePlot(
        HTPlot,
        theCanvas,
        outputPath,
        'HT',
        'HT',
    )

    #3. ET
    ETPlot = histogramDict['ET']
    drawSimplePlot(
        ETPlot,
        theCanvas,
        outputPath,
        'ET',
        'ET',
    )

    #4. Trigger Towers
    triggerTowerPlot = histogramDict['nTriggerTowers']
    drawSimplePlot(
        triggerTowerPlot,
        theCanvas,
        outputPath,
        'Trigger Towers',
        'triggerTowers',
    )

    #5. CICADA Input Sum
    CICADAInputSumPlot = histogramDict['nTriggerTowers']
    drawSimplePlot(
        CICADAInputSumPlot,
        theCanvas,
        outputPath,
        'CICADA Input Sum',
        'CICADAInputSum'
    )

    for eta in range(7):
        thePlot = histogramDict[
            f'Eta{eta}_CICADARegions'
        ]
        drawSimplePlot(
            thePlot,
            theCanvas,
            outputPath,
            'CICADA Region ETs',
            f'CICADARegions_Eta{eta}'
        )
    
def main(args):
    ROOT.gStyle.SetOptStat(0)
    df, chain, nFiles = makeDataframe(args.trainingDirectories)
    console.log(f'# of files: {nFiles}')
    
    df = defineQuantities(df)

    uniqueRuns = getListOfUniqueRuns(df)
    runDFs = {}
    runOutputPaths = {}

    console.log(f'Unique runs:')
    console.print(uniqueRuns)

    #Let's make a general output path
    outputLocation = Path(f'./{args.outputDir}/')
    outputLocation.mkdir(parents=True, exist_ok=True)
    
    #something to hold all the bookings
    bookings = {}
    etaDFs = None
    
    #Let's first get a profile of the entire dataset
    console.log('Defining complete dataset profile...')
    bookings['all'] = makeProfileBookings(df, 'All')
    etaBookings, etaDFs = makeEtaSliceBookings(df, 'All')
    bookings['all'].update(etaBookings)

    nonzero_npv_df = df.Filter('npv > 1')
    nonzero_npv_output = outputLocation / 'All_nonzero_npv'
    bookings['all_nonzero_npv'] = makeProfileBookings(nonzero_npv_df, 'All_nonzero_npv')
    nonzeroEtaBookings, nonzeroEtaDFs = makeEtaSliceBookings(nonzero_npv_df, 'All_nonzero_npv')
    bookings['all_nonzero_npv'].update(nonzeroEtaBookings)

    console.log('Making bookings for individual runs...')
    runEtaDFs = {}
    for run in uniqueRuns:
        console.log(f'Run: {run}')
        runOutputPaths[run] = outputLocation / f'Run_{run}'
        runOutputPaths[run].mkdir(parents=True, exist_ok=True)
        runDFs[run] = df.Filter(f'run=={run}')
        bookings[run] = makeProfileBookings(runDFs[run], f'Run_{run}')
        newBookings, runEtaDFs[run] = makeEtaSliceBookings(runDFs[run], f'Run_{run}')
        bookings[run].update(newBookings)


    console.log('Making validation plots for the complete dataset...')
    totalDatasetLocation = outputLocation/"All"
    totalDatasetLocation.mkdir(parents=True, exist_ok=True)
    drawProfileHistograms(
        bookings['all'],
        'All',
        totalDatasetLocation,
    )

    console.log('Making validation plots for non-zero NPV dataset...')
    nonzero_npv_output.mkdir(parents=True, exist_ok=True)
    drawProfileHistograms(
        bookings['all_nonzero_npv'],
        'All_nonzero_npv',
        nonzero_npv_output,
    )

    console.log('Making validation plots for all runs...')
    for run in uniqueRuns:
        console.log(f'Run: {run}')
        drawProfileHistograms(
            bookings[run],
            f'Run_{run}',
            runOutputPaths[run]
        )

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Validate potential training data and produce control plots')
    parser.add_argument(
        'trainingDirectories',
        nargs='+',
        help='Directories with files to be used in training'
    )

    parser.add_argument(
        '--outputDir',
        nargs='?',
        default='Training_dataset_validation'
    )

    args = parser.parse_args()
    
    main(args)
