import ROOT
import json
from rich.console import Console
from rich.progress import track
import os
import numpy as np

console = Console()

def getListOfFiles(samplePath):
    listOfFiles = []
    for root, dirs, files in os.walk(samplePath):
        for fileName in files:
            listOfFiles.append(
                f'{root}/{fileName}'
            )
    return listOfFiles

def dumpOutUniqueRunsAndLumis(theChain, sample):
    theDataframe = ROOT.RDataFrame(theChain)

    runsAndLumis = {}
    
    theRuns = theDataframe.AsNumpy(["run"])["run"]
    uniqueRuns = np.unique(theRuns)

    console.log("Unique Runs:")
    console.print(uniqueRuns)

    for run in track(uniqueRuns, description='Looping runs'):
        intRun = int(run)
        runsAndLumis[intRun] = theDataframe.Filter(f'run == {intRun}').AsNumpy(['lumi'])['lumi']
        lumiList = list(np.unique(runsAndLumis[intRun]))
        lumiList = [int(x) for x in lumiList]
        runsAndLumis[intRun] = lumiList

    console.log("Writing out run/lumi json...")
    with open(f'{sample}_RunsAndLumis.json', 'w') as theFile:
        json.dump(runsAndLumis, theFile, indent=3)
    console.log("Done!")
    

def main():
    samples = {
        'EZB0': '/eos/project/c/cicada-project/root/L1Ntuples_EZB0_RunC_2023_27Jul2023_0918',
        'ZB_RunB': '/eos/project/c/cicada-project/root/L1Ntuples_ZB_RunB_2023_27Jul2023_0946',
        'ZB_RunC': '/eos/project/c/cicada-project/root/L1Ntuples_ZB_RunC_2023_27Jul2023_0947',
        'ZB_RunD': '/eos/project/c/cicada-project/root/L1Ntuples_ZB_RunD_2023_27Jul2023_0947'
    }

    for sample in samples:
        console.log(sample)
        listOfFiles = getListOfFiles(samples[sample])
        console.log(f'# of files: {len(listOfFiles)}')

        theChain = ROOT.TChain('l1EventTree/L1EventTree')
        for fileName in listOfFiles:
            theChain.Add(fileName)
        nEntries = theChain.GetEntries()

        console.log(f'# of entries: {nEntries}')

        dumpOutUniqueRunsAndLumis(theChain, sample)

if __name__ == '__main__':
    main()
