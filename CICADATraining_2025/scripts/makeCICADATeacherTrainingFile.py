import ROOT
import h5py
import argparse
import os

import numpy as np

from pathlib import Path
from rich.console import Console
from rich.progress import track

console = Console()

def makeChain(trainingDirectories, maxFiles=None):
    theChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')
    npvChain = ROOT.TChain('npvNtuplizer/NPVTree')
    eventChain = ROOT.TChain('l1EventTree/L1EventTree')
    nFiles = 0
    for directory in trainingDirectories:
        nFilesInDirectory = 0
        for root, dirs, files in os.walk(directory):
            for fileName in files:
                theFile = f'{root}/{fileName}'
                theChain.Add(theFile)
                npvChain.Add(theFile)
                eventChain.Add(theFile)
                nFiles += 1
                nFilesInDirectory += 1
                if maxFiles != None and nFilesInDirectory >= maxFiles:
                    break
    theChain.AddFriend(npvChain)
    theChain.AddFriend(eventChain)
    console.log(f'{nFiles} files in the CICADA Input Chain')
    return theChain

def makeInputGrid(theChain):
    inputGrid = np.zeros((18,14,1))
    for i in range(252):
        inputGrid[theChain.iPhi[i], theChain.iEta[i], 0] = theChain.modelInput[i]
    return inputGrid

badRuns = [
        379442,
        379456,
        379530,
        379660,
        380074,
        380310,
        380360,
        380649,
        381115,
        381151,
        381380,
        383814,
        383966,
        384188,
        386071,
        376554,
    ]
def isGoodEvent(chain):
    if chain.Event.run in badRuns:
        return False
    elif chain.npv < 10: #use only events with a reasonable reco NPV
        return False
    #Let's only use odd runs to preserve a useful test set
    elif chain.Event.run % 2 == 0:
        return False
    else:
        return True

def main(args):
    outputPath = Path(args.teacherWorkingDirectory)
    outputPath.mkdir(exist_ok=True, parents=True)

    chain = makeChain(args.trainingDirectories, maxFiles=args.nFiles)

    nEntries = chain.GetEntries()
    console.log(f'Working on {nEntries} entries...')

    inputGrids = []
    npvs = []
    usedRuns = []
    for i in track(range(nEntries), description='Entries'):
        chain.GetEntry(i)
        if not isGoodEvent(chain):
            continue

        if chain.Event.run not in usedRuns:
            usedRuns.append(chain.Event.run)
        inputGrids.append(
            makeInputGrid(chain)
        )
        npvs.append(
            chain.npv
        )

    inputGrids = np.array(inputGrids)
    npvs = np.array(npvs)

    nEvents = len(inputGrids)
    console.print(f'Final selection: {nEvents} inputs')
    console.print(f'Used runs: {usedRuns}')

    with h5py.File(outputPath/"teacherTrainingFile.h5", 'w') as theFile:
        theFile.create_dataset("modelInputs", data=inputGrids)
        theFile.create_dataset('npvs', data=npvs)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Make a training file for use with the teacher training script")

    parser.add_argument(
        'trainingDirectories',
        nargs='+',
        help='Directories to be searched for files to make the training file'
    )
    parser.add_argument(
        '--teacherWorkingDirectory',
        nargs='?',
        default='CICADA_PU_Resistant_Teacher_Experiments',
        help='Spot to make output'
    )
    parser.add_argument(
        '--nFiles',
        nargs='?',
        type=int,
        help='Number of files per directory to pull from the directories. Defaults to all files'
    )

    args = parser.parse_args()

    main(args)
