import ugt_hls_emulator as ugt
import json
import os

from pathlib import Path
from anomalyDetection.paperCode.plottingUtilities.axol1tlInputData import AXOL1TLInputData

from rich.progress import track
from rich.console import Console

class axoScoreUtility():
    def __init__(
            self,
            jsonLocation: Path = Path(f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/paperCode/metadata/axoScoreMaxAndMin.json'),
            defaultMin = 0.0,
            defaultMax = 10000.0,
    ):
        self.jsonLocation = jsonLocation
        self.maxMinData = self.loadMaxesAndMins()

    def loadMaxesAndMins(self):
        try:
            theFile = open(self.jsonLocation)
            data = json.load(theFile)
        except FileNotFoundError:
            return {
                "max": self.defaultMax,
                "min": self.defaultMin,
            }
        else:
            return data

    def calculateScoreMaxesAndMins(self, chains):
        axoModel = getattr(ugt.anomaly_detection, "Axol1tl_v3")

        axoMax = None
        axoMin = None

        console = Console()
        
        for sampleName in chains:
            console.print(sampleName)
            theChain = chains[sampleName]
            nEntries = theChain.GetEntries()
            console.print(f"Processing {nEntries} Events")
            for entryIndex in track(range(nEntries), description=sampleName):
                theChain.GetEntry(entryIndex)

                axoData = AXOL1TLInputData(theChain)
                axoScore = axoModel.hwint_to_anomaly_score(axoData.getArray())

                if axoMax == None or axoScore > axoMax:
                    axoMax = axoScore
                if axoMin == None or axoScore < axoMin:
                    axoMin = axoScore

        maxMinDict = {
            "max": axoMax,
            "min": axoMin,
        }
        with open(self.jsonLocation, 'w+') as theFile:
            json.dump(
                maxMinDict,
                theFile,
                indent=4,
            )
        self.maxMinData = maxMinDict

                
def main():
    from anomalyDetection.paperCode.samples.paperSampleBuilder import reducedSamples as samples
    sampleNames = list(samples.keys())
    allChains = {}
    for sampleName in sampleNames:
        allChains[sampleName] = samples[sampleName].getNewChain()

    print("Executing the axo score calculation")
    theScoreHelper = axoScoreUtility()
    theScoreHelper.calculateScoreMaxesAndMins(allChains)
    
if __name__ == '__main__':
    main()
