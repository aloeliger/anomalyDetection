import ROOT
from huggingface_hub import from_pretrained_keras
from rich.console import Console
from rich.progress import track
from checkTPBeforeAndAfter import makeChainFromDict
import numpy as np
import json
import copy

console = Console()

class CICADAInputShift():
    def __init__(self, shifts = None):
        if shifts == None:
            self.shifts = {}
        else:
            self.shifts = shifts

    def applyToInput(self, cicadaInputs, etasToApply = None):
        inputCopy = copy.deepcopy(cicadaInputs)

        for eta in self.shifts:
            if etasToApply is None or eta in etasToApply:
                inputCopy[:, :, eta] = inputCopy[:, :, eta] * self.shifts[eta]

        return inputCopy

class CICADA2DInputShift():
    def __init__(self, shifts=None):
        if shifts == None:
            self.shifts = {}
        else:
            self.shifts = shifts

    def applyToInput(self, cicadaInputs):
        inputCopy = copy.deepcopy(cicadaInputs)

        for eta in self.shifts:
            for phi in self.shifts[eta]:
                inputCopy[:, phi-1, eta-1] = inputCopy[:, phi-1, eta-1 ] * self.shifts[eta][phi]
        return inputCopy
    
def makeShifts(theJson):
    modifiedShifts = {}
    for key in theJson:
        newKey = int(float(key))
        modifiedShifts[newKey] = theJson[key]
    theInputShift = CICADAInputShift(modifiedShifts)
    return theInputShift

def make2DShifts(theJson):
    modifiedShifts = {}
    for eta in theJson:
        newEta = int(float(eta))
        if newEta not in modifiedShifts:
            modifiedShifts[newEta] = {}
        for phi in theJson[eta]:
            newPhi = int(float(phi))
            modifiedShifts[newEta][newPhi] = theJson[eta][phi]
    theInputShift = CICADA2DInputShift(modifiedShifts)
    return theInputShift

def makeCICADAInputArray(theChain):
    regions = []

    for i in range(18):
        etaValues = []
        for j in range(14):
            etaValues.append(theChain.modelInput[i*14+j])
        regions.append(etaValues)
    return regions

def getAllCICADAInputs(theChain):
    nEntries = theChain.GetEntries()
    allRegions = []
    for i in track(range(nEntries), description='making base entries'):
        theChain.GetEntry(i)
        allRegions.append(makeCICADAInputArray(theChain))
    allRegions = np.array(allRegions)
    return allRegions

def makeScorePlot(scores, identifier):
    theCanvas = ROOT.TCanvas('theCanvas')
    thePlot = ROOT.TH1D(
        f'scores_{identifier}',
        f'scores_{identifier}',
        100,
        0.0,
        200.0,
    )

    zoomedPlot = ROOT.TH1D(
        f'scores_zoomed_{identifier}',
        f'scores_zoomed_{identifier}',
        100,
        120.0,
        200.0,
    )

    for entry in track(range(len(scores)), description="score plot"):
        thePlot.Fill(scores[entry][0])
        zoomedPlot.Fill(scores[entry][0])

    thePlot.Draw("HIST")
    thePlot.GetYaxis().SetTitle("Events")
    thePlot.GetXaxis().SetTitle("CICADA Score")
    thePlot.SetLineColor(ROOT.kRed)
    thePlot.SetLineWidth(2)

    thePlot.Draw("HIST")
    theCanvas.SaveAs(f'CICADA_Scores_{identifier}.png')

    zoomedPlot.Draw("HIST")
    zoomedPlot.GetYaxis().SetTitle("Events")
    zoomedPlot.GetXaxis().SetTitle("CICADA Score")
    zoomedPlot.SetLineColor(ROOT.kRed)
    zoomedPlot.SetLineWidth(2)

    zoomedPlot.Draw("HIST")
    theCanvas.SaveAs(f'CICADA_Scores_zoomed_{identifier}.png')

    console.print(identifier)
    console.print(f"Zoomed plot integral")
    theIntegral = zoomedPlot.Integral(1, zoomedPlot.GetNbinsX())
    console.print(theIntegral)
    console.print('Total Eff')
    totalIntegral = thePlot.Integral(1, thePlot.GetNbinsX())
    console.print(f'{theIntegral/totalIntegral}')

def main():
    model = from_pretrained_keras("cicada-project/cicada-v2.1")

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
    
    CICADAInputs = getAllCICADAInputs(beforeCICADAChain)

    initialModelPredictions = model.predict(CICADAInputs.reshape((-1,252)))

    makeScorePlot(initialModelPredictions, 'Unshifted')
    console.print(f'Mean initial model predictions: {np.mean(initialModelPredictions)}')
    console.print(f'Std initial model predictions: {np.std(initialModelPredictions)}')

    

    with open("CICADARegions_factors.json") as theFile:
        regionShifts = json.load(theFile)
    inputShift = makeShifts(regionShifts)

    fullShiftInputs = inputShift.applyToInput(CICADAInputs)
    shiftedPredictions = model.predict(fullShiftInputs.reshape((-1,252)))

    console.print(f'Mean shifted predictions: {np.mean(shiftedPredictions)}')
    console.print(f'Std shifted predictions: {np.std(shiftedPredictions)}')

    makeScorePlot(shiftedPredictions, 'Shifted')

    with open("CICADARegions_2D_factors.json") as theFile:
        regionShifts_2D = json.load(theFile)
    inputShift_2d = make2DShifts(regionShifts_2D)

    moreShiftedInputs = inputShift_2d.applyToInput(CICADAInputs)
    shiftedPredictions = model.predict(moreShiftedInputs.reshape((-1, 252)))

    console.print(f'Mean shifted predictions: {np.mean(shiftedPredictions)}')
    console.print(f'Std shifted predictions: {np.std(shiftedPredictions)}')

    makeScorePlot(shiftedPredictions, 'Shifted_2D')
if __name__ == '__main__':

    main()
