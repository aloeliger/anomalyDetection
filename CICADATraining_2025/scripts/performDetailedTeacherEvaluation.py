import h5py
import argparse
import ROOT
import os

import numpy as np

from tensorflow import keras
from rich.console import Console
#from rich.progress import track
from tqdm import tqdm
from sklearn.model_selection import train_test_split
from pathlib import Path
from time import perf_counter

from makeCICADATeacherAndEvaluate import randomPhiRotations, randomEtaReflections
from anomalyDetection.anomalyTriggerSkunkworks.plotSettings.utilities import convertEffToRate
from makeCICADATeacherAndEvaluate import L1Normalization

console = Console()

nprng = np.random.default_rng(42)        

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


def makeScoresForSample(samplePath, model, normCoef, normBias):
    theChain = ROOT.TChain("l1CaloTowerEmuTree/L1CaloTowerTree")
    for root, dirs, files in os.walk(samplePath):
        for fileName in files:
            theFile = f'{root}/{fileName}'
            theChain.Add(theFile)

    nEntries = theChain.GetEntries()
    inputGrids = []
    for entry in tqdm(range(nEntries)):
        #if entry % 100 != 0:
        #    continue
        theChain.GetEntry(entry)
        inputGrids.append(
            makeCICADAInputGridFromTowers(theChain)
        )

    inputData = np.array(inputGrids)
    #console.print(inputData.shape)

    #layerNormer = keras.layers.LayerNormalization(axis=(1,2,3))
    #layerNormer = keras.layers.UnitNormalization(axis=(1,2,3))
    layerNormer = L1Normalization(axis=(1,2,3))
    
    normed_outputData = layerNormer(inputData)

    model_predictions = model.predict(inputData)

    unnormed_scores = np.mean((model_predictions - normed_outputData)**2, axis=(1,2,3))

    normed_scores = normCoef * unnormed_scores + normBias

    return unnormed_scores, normed_scores, inputData

def makeGenericScorePlot(
        scores,
        name,
        title,
        xMin,
        xMax,
        nBins=100,
):
    thePlot = ROOT.TH1D(
        name,
        title,
        nBins,
        xMin,
        xMax,
    )
    for score in scores:
        thePlot.Fill(score)
    thePlot.Scale(1.0/thePlot.Integral())
    return thePlot

def makeTotalScorePlot(
        data_scores,
        HToLongLived_scores,
        SUEP_scores,
        SUSYGGBBH_scores,
        TT_scores,
        VBFHto2C_scores,
        title,
        name,
        xMin,
        xMax,
        outputPath,
):
    data_plot = makeGenericScorePlot(data_scores, 'data', title, xMin, xMax)
    HToLongLived_plot = makeGenericScorePlot(HToLongLived_scores, 'HToLongLived', title, xMin, xMax)
    SUEP_plot = makeGenericScorePlot(SUEP_scores, 'SUEP', title, xMin, xMax)
    SUSYGGBBH_plot = makeGenericScorePlot(SUSYGGBBH_scores, 'SUSYGGBBH', title, xMin, xMax)
    TT_plot = makeGenericScorePlot(TT_scores, 'TT', title, xMin, xMax)
    VBFHto2C_plot = makeGenericScorePlot(VBFHto2C_scores, 'VBFHto2C', title, xMin, xMax)

    theCanvas = ROOT.TCanvas('allScores')

    data_plot.SetLineColor(ROOT.kBlack)
    data_plot.SetLineWidth(2)

    HToLongLived_plot.SetLineColor(ROOT.kRed)
    HToLongLived_plot.SetLineWidth(2)

    SUEP_plot.SetLineColor(ROOT.kBlue)
    SUEP_plot.SetLineWidth(2)

    SUSYGGBBH_plot.SetLineColor(ROOT.kGreen)
    SUSYGGBBH_plot.SetLineWidth(2)

    TT_plot.SetLineColor(ROOT.kOrange)
    TT_plot.SetLineWidth(2)

    VBFHto2C_plot.SetLineColor(ROOT.kViolet)
    VBFHto2C_plot.SetLineWidth(2)

    data_plot.Draw("HIST")
    maxes = [
        data_plot.GetMaximum(),
        HToLongLived_plot.GetMaximum(),
        SUEP_plot.GetMaximum(),
        SUSYGGBBH_plot.GetMaximum(),
        TT_plot.GetMaximum(),
        VBFHto2C_plot.GetMaximum(),
    ]
    data_plot.GetYaxis().SetRangeUser(0.0, np.max(maxes))

    for plot in [HToLongLived_plot, SUEP_plot, SUSYGGBBH_plot, TT_plot, VBFHto2C_plot]:
        plot.Draw("HIST SAME")

    theLegend = ROOT.TLegend(0.7,0.7,0.9,0.9)
    theLegend.SetLineWidth(0)
    theLegend.SetFillStyle(0)
    theLegend.AddEntry(data_plot, "Data", 'l')
    theLegend.AddEntry(HToLongLived_plot, "H To Long Lived", 'l')
    theLegend.AddEntry(SUEP_plot, "SUEP", 'l')
    theLegend.AddEntry(SUSYGGBBH_plot, "SUSY GGBBH", 'l')
    theLegend.AddEntry(TT_plot, "t#bar{t}", 'l')
    theLegend.AddEntry(VBFHto2C_plot, "VBFH to 2C", 'l')

    theLegend.Draw()

    theCanvas.SaveAs(
        str(outputPath / f'{name}.png')
    )

def make_effs(scores, thresholds):
    effs = []
    for threshold in thresholds:
        nAbove = np.count_nonzero(scores > threshold)
        eff = nAbove / len(scores)
        effs.append(eff)
    effs = np.array(effs)
    return effs

def make_rates(data_effs):
    rates = []
    for eff in data_effs:
        rates.append(
            convertEffToRate(eff)
        )
    rates = np.array(rates)
    return rates

def makeROCCurve(signal_eff, rates):
    roc_curve = ROOT.TGraph(len(rates), rates, signal_eff)
    return roc_curve
        

def makeROCCurves(
        data_scores,
        HTLL_scores,
        SUEP_scores,
        SUSY_scores,
        TT_scores,
        VBFH_scores,
        data_inputs,
        HTLL_inputs,
        SUEP_inputs,
        SUSY_inputs,
        TT_inputs,
        VBFH_inputs,
        outputPath,
):
    steps =  np.arange(0.0,256.0,0.1)

    data_effs = make_effs(data_scores, steps)
    HTLL_effs = make_effs(HTLL_scores, steps)
    SUEP_effs = make_effs(SUEP_scores, steps)
    SUSY_effs = make_effs(SUSY_scores, steps)
    TT_effs = make_effs(TT_scores, steps)
    VBFH_effs = make_effs(VBFH_scores, steps)

    rates = make_rates(data_effs)
    
    data_dummy_inputs = np.sum(data_inputs**2, axis=1)
    HTLL_dummy_inputs = np.sum(HTLL_inputs**2, axis=1)
    SUEP_dummy_inputs = np.sum(SUEP_inputs**2, axis=1)
    SUSY_dummy_inputs = np.sum(SUSY_inputs**2, axis=1)
    TT_dummy_inputs = np.sum(TT_inputs**2, axis=1)
    VBFH_dummy_inputs = np.sum(VBFH_inputs**2, axis=1)

    max_dummy = np.max(data_dummy_inputs)
    dummy_steps = np.arange(0.0, max_dummy, max_dummy/(256/0.1))

    data_dummy_effs = make_effs(data_dummy_inputs, dummy_steps)
    HTLL_dummy_effs = make_effs(HTLL_dummy_inputs, dummy_steps)
    SUEP_dummy_effs = make_effs(SUEP_dummy_inputs, dummy_steps)
    SUSY_dummy_effs = make_effs(SUSY_dummy_inputs, dummy_steps)
    TT_dummy_effs = make_effs(TT_dummy_inputs, dummy_steps)
    VBFH_dummy_effs = make_effs(VBFH_dummy_inputs, dummy_steps)

    dummy_rates = make_rates(data_dummy_effs)

    HTLL_ROC_Curve = makeROCCurve(HTLL_effs, rates)
    SUEP_ROC_Curve = makeROCCurve(SUEP_effs, rates)
    SUSY_ROC_Curve = makeROCCurve(SUSY_effs, rates)
    TT_ROC_Curve = makeROCCurve(TT_effs, rates)
    VBFH_ROC_Curve = makeROCCurve(VBFH_effs, rates)

    HTLL_dummy_ROC_Curve = makeROCCurve(HTLL_dummy_effs, dummy_rates)
    SUEP_dummy_ROC_Curve = makeROCCurve(SUEP_dummy_effs, dummy_rates)
    SUSY_dummy_ROC_Curve = makeROCCurve(SUSY_dummy_effs, dummy_rates)
    TT_dummy_ROC_Curve = makeROCCurve(TT_dummy_effs, dummy_rates)
    VBFH_dummy_ROC_Curve = makeROCCurve(VBFH_dummy_effs, dummy_rates)

    ROC_Canvas = ROOT.TCanvas("ROCS")

    # ROC_Canvas.SetLogy()
    ROC_Canvas.SetLogx()

    HTLL_ROC_Curve.Draw("AL")
    HTLL_ROC_Curve.SetLineWidth(2)
    HTLL_ROC_Curve.SetLineColor(ROOT.kBlue)
    HTLL_ROC_Curve.GetHistogram().GetXaxis().SetTitle("Rate (kHz)")
    HTLL_ROC_Curve.GetHistogram().GetYaxis().SetTitle("Acceptance")
    HTLL_ROC_Curve.GetHistogram().GetXaxis().SetRangeUser(0.0, 100.0)
    HTLL_ROC_Curve.GetHistogram().GetYaxis().SetRangeUser(0.01, 1.1)

    HTLL_dummy_ROC_Curve.Draw("L")
    HTLL_dummy_ROC_Curve.SetLineWidth(2)
    HTLL_dummy_ROC_Curve.SetLineStyle(7)
    HTLL_dummy_ROC_Curve.SetLineColor(ROOT.kBlue)

    SUEP_ROC_Curve.Draw("L")
    SUEP_ROC_Curve.SetLineColor(ROOT.kRed)
    SUEP_ROC_Curve.SetLineWidth(2)
    SUEP_dummy_ROC_Curve.Draw("L")
    SUEP_dummy_ROC_Curve.SetLineWidth(2)
    SUEP_dummy_ROC_Curve.SetLineStyle(7)
    SUEP_dummy_ROC_Curve.SetLineColor(ROOT.kRed)

    SUSY_ROC_Curve.Draw("L")
    SUSY_ROC_Curve.SetLineColor(ROOT.kGreen)
    SUSY_ROC_Curve.SetLineWidth(2)
    SUSY_dummy_ROC_Curve.Draw("L")
    SUSY_dummy_ROC_Curve.SetLineWidth(2)
    SUSY_dummy_ROC_Curve.SetLineStyle(7)
    SUSY_dummy_ROC_Curve.SetLineColor(ROOT.kGreen)

    TT_ROC_Curve.Draw("L")
    TT_ROC_Curve.SetLineColor(ROOT.kOrange)
    TT_ROC_Curve.SetLineWidth(2)
    TT_dummy_ROC_Curve.Draw("L")
    TT_dummy_ROC_Curve.SetLineWidth(2)
    TT_dummy_ROC_Curve.SetLineStyle(7)
    TT_dummy_ROC_Curve.SetLineColor(ROOT.kOrange)

    VBFH_ROC_Curve.Draw("L")
    VBFH_ROC_Curve.SetLineWidth(2)
    VBFH_ROC_Curve.SetLineColor(ROOT.kViolet)
    VBFH_dummy_ROC_Curve.Draw("L")
    VBFH_dummy_ROC_Curve.SetLineWidth(2)
    VBFH_dummy_ROC_Curve.SetLineStyle(7)
    VBFH_dummy_ROC_Curve.SetLineColor(ROOT.kViolet)

    theLegend = ROOT.TLegend(0.7, 0.7, 0.9, 0.9)
    theLegend.AddEntry(HTLL_ROC_Curve, "H To Long Lived", "l")
    theLegend.AddEntry(SUEP_ROC_Curve, "SUEP", "l")
    theLegend.AddEntry(SUSY_ROC_Curve, "SUSY GGBBH", "l")
    theLegend.AddEntry(TT_ROC_Curve, "t#bar{t}", "l")
    theLegend.AddEntry(VBFH_ROC_Curve, "VBFH", "l")
    theLegend.AddEntry(HTLL_dummy_ROC_Curve, "H To Long Live (baseline)", "l")
    theLegend.AddEntry(SUEP_dummy_ROC_Curve, "SUEP (baseline)", "l")
    theLegend.AddEntry(SUSY_dummy_ROC_Curve, "SUSY GGBBH (baseline)", "l")
    theLegend.AddEntry(TT_dummy_ROC_Curve, "t#bar{t} (baseline)", "l")
    theLegend.AddEntry(VBFH_dummy_ROC_Curve, "VBFH (baseline)", "l")
    theLegend.Draw()

    ROC_Canvas.SaveAs(
        str(outputPath / "roccurves.png")
    )
    
def makeDataScorePlot(scores, outputPath, name, title, xMin=0.0, xMax=1.0):
    theCanvas = ROOT.TCanvas(name)

    theHistogram = ROOT.TH1D(
        name,
        title,
        100,
        xMin,
        xMax,
    )
    for score in tqdm(scores):
        theHistogram.Fill(score)

    theHistogram.Scale(1.0/theHistogram.Integral())
    theHistogram.Draw("HIST")
    theHistogram.SetLineColor(ROOT.kRed)

    theCanvas.SaveAs(
        str(outputPath / f'{name}.png')
    )

def main(args):
    start_time = perf_counter()
    ROOT.gStyle.SetOptStat(0)
    workPath = Path(args.workPath)
    inputFileName = workPath / 'teacherTrainingFile.h5'
    with h5py.File(str(inputFileName)) as theFile:
        theDataset = np.array(theFile['modelInputs'])
        npvs = np.array(theFile['npvs'])

    theDataset = randomPhiRotations(theDataset)
    theDataset = randomEtaReflections(theDataset)

    #theDataset[theDataset < 1] = 0

    console.print(theDataset.shape)
    inputDataset = theDataset.reshape((-1, 18*14))
    outputDataset = theDataset.reshape((-1,18,14,1))

    console.print(inputDataset.shape)
    console.print(outputDataset.shape)

    trainval_inputData, test_inputData, trainval_outputData,  test_outputData, trainval_npvs, test_npvs = train_test_split(inputDataset, outputDataset, npvs, test_size=0.4, random_state=42)
    inputData, valInput, outputData, valOutput, train_npvs, val_npvs = train_test_split(trainval_inputData, trainval_outputData, trainval_npvs, test_size=0.1/(0.6), random_state=42)

    console.print(inputData.shape)
    console.print(valInput.shape)
    console.print(test_inputData.shape)

    #layerNormer = keras.layers.LayerNormalization(axis=(1,2,3))
    #layerNormer = keras.layers.UnitNormalization(axis=(1,2,3))
    layerNormer = L1Normalization(axis=(1,2,3))

    normed_outputData = layerNormer(outputData)
    normed_valOutput = layerNormer(valOutput)
    normed_testOutputData = layerNormer(test_outputData)

    ae_model = keras.models.load_model(f'{args.workPath}/teacherModel')

    model_predictions = ae_model.predict(test_inputData)
    unnormed_scores = np.mean((model_predictions - normed_testOutputData)**2, axis=(1,2,3))
    #console.print(unnormed_scores.shape)

    correlation_to_npv = np.corrcoef(unnormed_scores, test_npvs)[0, 1]

    console.print(f'Score correlation to NPV: {correlation_to_npv:.4g}')

    #Adjustment to the bit space
    new_max = 256.0
    new_min = 0.0
    old_max = np.max(unnormed_scores)
    old_min = np.min(unnormed_scores)

    new_coef = (new_max - new_min) / (old_max - old_min)
    new_bias = new_min - new_coef*old_min
    
    makeDataScorePlot(
        unnormed_scores,
        workPath,
        "unNormedScores",
        "Un-Normalized Teacher Scores;Teacher Score;A.U.",
        old_min,
        old_max,
    )

    normed_scores = new_coef * unnormed_scores + new_bias
    normed_correlation_to_npv = np.corrcoef(normed_scores, test_npvs)[0,1]
    console.print(f"New scaling to student target: {new_coef:.4g} * score + {new_bias:.4g}")
    console.print(f'Normed score correlation to NPV: {normed_correlation_to_npv:.4g}')
    makeDataScorePlot(
        normed_scores,
        workPath,
        "normedScores",
        "Normalized Teacher Scores;Normed Teacher Score;A.U.",
        new_min,
        new_max,
    )

    #Okay, now we need to make score plots with a bunch of signals
    MC_Path = Path('/hdfs/store/user/aloeliger/suppressionSamples/')
    HToLongLived_Path = MC_Path / "L1Ntuples_HToLongLived_2023_27Jul2023_0949/"
    SUEP_Path = MC_Path / "L1Ntuples_SUEP_2023_28Jul2023_1034"
    SUSYGGBBH_Path = MC_Path / "L1Ntuples_SUSYGGBBH_2023_27Jul2023_0949"
    TT_Path = MC_Path / "L1Ntuples_TT_2023_27Jul2023_0950"
    VBFHto2C_Path = MC_Path / "L1Ntuples_VBFHto2C_2023_27Jul2023_0950"

    unnormed_HToLongLived, normed_HToLongLived, HToLongLived_Inputs = makeScoresForSample(
        HToLongLived_Path,
        ae_model,
        new_coef,
        new_bias,
    )
    unnormed_SUEP, normed_SUEP, SUEP_Inputs = makeScoresForSample(
        SUEP_Path,
        ae_model,
        new_coef,
        new_bias,
    )
    unnormed_SUSYGGBBH, normed_SUSYGGBBH, SUSYGGBBH_Inputs = makeScoresForSample(
        SUSYGGBBH_Path,
        ae_model,
        new_coef,
        new_bias,
    )
    unnormed_TT, normed_TT, TT_Inputs = makeScoresForSample(
        TT_Path,
        ae_model,
        new_coef,
        new_bias,
    )
    unnormed_VBFHto2C, normed_VBFHto2C, VBFHto2C_Inputs = makeScoresForSample(
        VBFHto2C_Path,
        ae_model,
        new_coef,
        new_bias,
    )

    makeTotalScorePlot(
        unnormed_scores,
        unnormed_HToLongLived,
        unnormed_SUEP,
        unnormed_SUSYGGBBH,
        unnormed_TT,
        unnormed_VBFHto2C,
        "Un-Normalized Scores;Teacher Score;A.U",
        "totalUnNormalizedScores",
        0.0,
        1.0,
        workPath
    )
    makeTotalScorePlot(
        normed_scores,
        normed_HToLongLived,
        normed_SUEP,
        normed_SUSYGGBBH,
        normed_TT,
        normed_VBFHto2C,
        "Normalized Scores;Teacher Score;A.U",
        'totalNormalizedScores',
        0.0,
        256.0,
        workPath,
    )

    makeROCCurves(
        normed_scores,
        normed_HToLongLived,
        normed_SUEP,
        normed_SUSYGGBBH,
        normed_TT,
        normed_VBFHto2C,
        test_inputData,
        HToLongLived_Inputs,
        SUEP_Inputs,
        SUSYGGBBH_Inputs,
        TT_Inputs,
        VBFHto2C_Inputs,
        workPath
    )
    end_time = perf_counter()
    console.print(f'Full evaluation in {end_time-start_time:.3g} seconds')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='')
    parser.add_argument(
        'workPath',
        nargs='?',
        help='Directory containing the model experiments',
    )

    args = parser.parse_args()

    main(args)
