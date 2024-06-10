from anomalyDetection.paperCode.plottingCore.plotTask import createPlotTask

import ROOT
#from anomalyDetection.paperCode.plottingUtilities.models import *
from pathlib import Path
from anomalyDetection.paperCode.plottingUtilities.scoreMaxAndMins import scoreMaxAndMinHelper
from anomalyDetection.paperCode.plottingUtilities.models import standardScoreGroups, getAllScoreNames
from rapidfuzz import fuzz

import numpy as np
import ugt_hls_emulator as ugt

from rich.console import Console
from rich.progress import track

console = Console()

class AXOL1TLInputData():
    def __init__(
            self,
            theChain: ROOT.TChain,
            nEGs = 4,
            nMuons = 4,
            nJets = 10,
    ):
        self.theChain = theChain

        self.nEGs = nEGs
        self.nMuons = nMuons
        self.nJets = 10

        self.inputArray = np.array([], dtype=np.int32)
        
        self.processChain()

    def processChain(self):
        # Put MET into the Array
        for i in range(self.theChain.L1Upgrade.nSums):
            if self.theChain.L1Upgrade.sumType[i] == 2 and self.theChain.L1Upgrade.sumBx[i] == 0:
                self.inputArray = np.append(
                    self.inputArray,
                    [
                        self.theChain.L1Upgrade.sumIEt[i],
                        0, # MET Eta Always 0?
                        self.theChain.L1Upgrade.sumIPhi[i],
                    ]
                )
        # Put available electrons into the array
        processedEGs = 0
        for i in range(self.theChain.L1Upgrade.nEGs):
            if self.theChain.L1Upgrade.egBx[i] == 0:
                self.inputArray = np.append(
                    self.inputArray,
                    [
                        self.theChain.L1Upgrade.egIEt[i],
                        self.theChain.L1Upgrade.egIEta[i],
                        self.theChain.L1Upgrade.egIPhi[i],
                    ]
                )
                processedEGs += 1
        # Add any empty slots
        for i in range(self.nEGs - processedEGs):
            self.inputArray = np.append(
                self.inputArray,
                [
                    0,
                    0,
                    0,
                ]
            )
        # Put available muons into the array
        processedMuons = 0
        for i in range(self.theChain.L1Upgrade.nMuons):
            if self.theChain.L1Upgrade.muonBx[i] == 0:
                self.inputArray = np.append(
                    self.inputArray,
                    [
                        self.theChain.L1Upgrade.muonIEt[i],
                        self.theChain.L1Upgrade.muonIEta[i],
                        self.theChain.L1Upgrade.muonIPhi[i],
                    ]
                )
                processedMuons += 1
        # Add any empty slots
        for i in range(self.nMuons - processedMuons):
            self.inputArray = np.append(
                self.inputArray,
                [
                    0,
                    0,
                    0,
                ]
            )
        # Put available jets into the array
        processedJets = 0
        for i in range(self.theChain.L1Upgrade.nJets):
            if self.theChain.L1Upgrade.jetBx[i] == 0:
                self.inputArray = np.append(
                    self.inputArray,
                    [
                        self.theChain.L1Upgrade.jetIEt[i],
                        self.theChain.L1Upgrade.jetIEta[i],
                        self.theChain.L1Upgrade.jetIPhi[i],
                    ]
                )
                processedJets += 1
        # Add any empty slots
        for i in range(self.nJets - processedJets):
            self.inputArray = np.append(
                self.inputArray,
                [
                    0,
                    0,
                    0,
                ]
            )
    def getArray(self):
        return self.inputArray
        

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
            histName = f"{sampleName}_{scoreName}_axo"
            scoreHists[scoreName] = ROOT.TH2D(
                histName,
                histName,
                30,
                scoreMins[scoreName],
                scoreMaxes[scoreName],
                30, #TODO: Add Axo into max and min infrastructure?
                0.0,
                2000.0,
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

            
