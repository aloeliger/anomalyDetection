from anomalyDetection.paperCode.plottingCore.plotTask import createPlotTask

import ROOT
#from anomalyDetection.paperCode.plottingUtilities.models import *
from pathlib import Path
from anomalyDetection.paperCode.plottingUtilities.scoreMaxAndMins import scoreMaxAndMinHelper
from anomalyDetection.paperCode.plottingUtilities.models import standardScoreGroups, getAllScoreNames
from anomalyDetection.paperCode.plottingUtilities.axoScoreUtility import axoScoreUtility
from rapidfuzz import fuzz
from anomalyDetection.paperCode.plottingUtilities.axol1tlInputData import AXOL1TLInputData

import numpy as np
import ugt_hls_emulator as ugt

from rich.console import Console
from rich.progress import track


console = Console()        

class createCICADAandAXOScatterPlotTask(createPlotTask):
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
        self.scoreMaxAndMins = scoreMaxAndMinHelper()

        self.axoModel = getattr(ugt.anomaly_detection, 'Axol1tl_v3')
        self.axoScoreHelper = axoScoreUtility()

    def createPlots(self):
        sampleNames = list(self.dictOfSamples.keys())

        allChains = {}
        for sampleName in sampleNames:
            allChains[sampleName] = self.dictOfSamples[sampleName].getNewChain()

        scoreNames = getAllScoreNames(standardScoreGroups)
        scoreNames.remove("HT")
        scoreNames.remove("CICADAInputSum")
        for name in scoreNames:
            if 'teacher' in name:
                scoreNames.remove(name)

        for sampleName in allChains:
            theChain = allChains[sampleName]
            theHists = self.processChain(theChain, sampleName, scoreNames)
            self.plotsToBeWritten += theHists

    def processChain(self, theChain, sampleName, scoreNames):
        scoreMaxes, scoreMins  = self.scoreMaxAndMins.getScoreMaxesAndMins()
        scoreHists = {}
        for scoreName in scoreNames:
            histName = f"{sampleName}_xxx_{scoreName}_xxx_axo"
            scoreHists[scoreName] = ROOT.TH2D(
                histName,
                histName,
                30,
                scoreMins[scoreName],
                scoreMaxes[scoreName],
                #This ended up being pretty close
                #30,
                #0.0,
                #2000.0,
                30,
                self.axoScoreHelper.maxMinData['min'],
                self.axoScoreHelper.maxMinData['max'],
            )
        # this feels a bit like overkill, but may help us get the scores by string, instead
        # of writing it out explicitly, since getattr is not working
        scoreMatchedTrees = {}
        listOfFriends = theChain.GetListOfFriends()
        listOfFriends = [x.GetName() for x in listOfFriends]
        for score in scoreNames:
            ratioScores = [fuzz.partial_ratio(score, tree) for tree in listOfFriends]
            bestTree = np.argmax(ratioScores)
            scoreMatchedTrees[score] = listOfFriends[bestTree]
        #print(scoreMatchedTrees)

        nEntries = theChain.GetEntries()
        for entryIndex in range(nEntries):
        #for entryIndex in track(range(nEntries), description=sampleName):
            theChain.GetEntry(entryIndex)

            axoData = AXOL1TLInputData(theChain)
            axoScore = self.axoModel.hwint_to_anomaly_score(axoData.getArray())
            
            for scoreName in scoreNames:
                #modelScore = getattr(theChain, scoreName)
                #listOfFriends = theChain.GetListOfFriends()
                #listOfFriends = [x.GetName() for x in listOfFriends]
                #print(listOfFriends)
                #modelScore = theChain.GetLeaf(scoreName).GetValue()
                #print()
                #print(scoreName)
                theFriend = theChain.GetFriend(scoreMatchedTrees[scoreName])
                theFriend.GetEntry(entryIndex)
                #print(theFriend)
                listOfLeaves = theFriend.GetListOfLeaves()
                listOfLeaves = [x.GetName() for x in listOfLeaves]
                #print(listOfLeaves)
                theLeaf = theFriend.GetLeaf(scoreName)
                #print(theLeaf)
                modelScore = theLeaf.GetValue()
                #print(modelScore)

                scoreHists[scoreName].Fill(
                    modelScore,
                    axoScore,
                )
        return list(scoreHists.values())

            
