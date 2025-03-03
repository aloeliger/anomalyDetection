import ROOT
import argparse
from rich.console import Console
import os
import numpy as np

console = Console()

def makeEmulatedInputChain(trainingDirectories):
    theChain = ROOT.TChain('l1CaloSummaryEmuTree/L1CaloSummaryTree')
    nFiles = 0
    for directory in trainingDirectories:
        for root, dirs, files in os.walk(directory):
            for fileName in files:
                nFiles += 1
                theFile = f'{root}/{fileName}'
                theChain.Add(theFile)
    console.log(f'Using {nFiles} in emulated chain')
    return theChain

def makeInputChain(trainingDirectories):
    theChain = ROOT.TChain('CICADAInputNtuplizer/CICADAInputTree')
    nFiles = 0
    for directory in trainingDirectories:
        for root, dirs, files in os.walk(directory):
            for fileName in files:
                nFiles += 1
                theFile = f'{root}/{fileName}'
                theChain.Add(theFile)
    console.log(f'Using {nFiles} in emulated chain')
    return theChain

def makeEmulatedInputGrid(emulatedInputsChain):
    inputGrid = np.zeros((18,14,1))
    for iPhi in range(18):
        for iEta in range(14):
            modelInput = emulatedInputsChain.GetLeaf('modelInput').GetValue(iPhi*14+iEta)
            inputGrid[iPhi, iEta, 0] = modelInput
    return inputGrid

def makeInputGrid(inputsChain):
    inputGrid = np.zeros((18,14,1))
    for j in range(252):
        iEta = inputsChain.iEta[j]
        iPhi = inputsChain.iPhi[j]
        modelInput = inputsChain.modelInput[j]
        inputGrid[iPhi, iEta, 0] = modelInput
    return inputGrid

def main(args):
    emulatedInputsChain = makeEmulatedInputChain(args.trainingDirectories)
    inputsChain = makeInputChain(args.trainingDirectories)

    emulatedInputs = []
    inputs = []
    console.print("Checking all inputs..")
    for i in range(args.nToCheck):
        emulatedInputsChain.GetEntry(i)
        inputsChain.GetEntry(i)

        emulatedInputs.append(
            makeEmulatedInputGrid(emulatedInputsChain)
        )
        inputs.append(
            makeInputGrid(inputsChain)
        )
    emulatedInputs = np.array(emulatedInputs)
    inputs = np.array(inputs)
    
    matchingInputs = emulatedInputs == inputs
    nMatches = np.sum(matchingInputs)

    if nMatches != 252*args.nToCheck:
        console.print("[red]Failed to match inputs![/red]")
        console.print(f"# matches: {nMatches}")
    else:
        console.print("[green]Inputs match![/green]")
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Examine files to determine if emulated and unpacked inputs match')

    parser.add_argument(
        'trainingDirectories',
        nargs='+',
        help='Directories with files to be used in training',
    )
    parser.add_argument(
        '--nToCheck',
        nargs='?',
        default=100,
        type=int,
        help='n Entries to check against'
    )

    args = parser.parse_args()

    main(args)
