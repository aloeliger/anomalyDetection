import ROOT
import numpy as np

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
