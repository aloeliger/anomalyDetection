from anomalyDetection.paperCode.plottingCore.plotTask import createPlotTask

import ROOT
from pathlib import Path
from anomalyDetection.paperCode.plottingUtilities.axoScoreUtility import axoScoreUtility
from anomalyDetection.paperCode.plottingUtilities.axol1tlInputData import AXOL1TLInputData

import ugt_hls_emulator as ugt

from rich.console import Console

console = Console()

class createAXOL1TLScorePlotTask(createPlotTask):
    def __init__(
            self,
            taskName: str,
            outputFileName: str,
            dictOfSamples: dict,
            outputPath: Path = Path("/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/")
    ):
        super().__init__(
            taskName,
            outputFileName,
            dictOfSamples,
            outputPath,
        )

        self.scoreMaxAndMins = axoScoreUtility()

        self.axomodel = getattr(ugt.anomaly_detection, 'Axol1tl_v3')

        self.nBins = 30

    def createPlots(self):
        sampleNames = list(self.dictOfSamples.keys())

        allChains = {}
        for sampleName in sampleNames:
            allChains[sampleName] = self.dictOfSamples[sampleName].getNewChain()

        for sampleName in allChains:
            theChain = allChains[sampleName]
            theHist = self.processChain(theChain, sampleName)
            self.plotsToBeWritten.append(theHist)

    def processChain(self, theChain, sampleName):
        histName = f'{sampleName}_xxx_AXOScore'
        scoreHist = ROOT.TH1D(
            histName,
            histName,
            self.nBins,
            self.scoreMaxAndMins.maxMinData['min'],
            self.scoreMaxAndMins.maxMinData['max'],
        )
        
        nEntries = theChain.GetEntries()
        for entryIndex in range(nEntries):
            theChain.GetEntry(entryIndex)

            axoData = AXOL1TLInputData(theChain)
            axoScore = self.axomodel.hwint_to_anomaly_score(axoData.getArray())

            scoreHist.Fill(axoScore)
        return scoreHist
