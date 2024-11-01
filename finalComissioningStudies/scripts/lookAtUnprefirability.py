import ROOT
from rich.console import Console
from rich.progress import track
from rich.table import Table
from pathlib import Path
import os

console = Console()

def main():
    ROOT.gStyle.SetOptStat(0)
    filePath = Path('/hdfs/store/user/aloelige/ZeroBias/pileupStudies_19Sep2024')

    unpackedChain = ROOT.TChain("unpackedCICADAScoreNtuplizer/UnpackedCICADAScores")
    unprefirableChain = ROOT.TChain("unprefirableInformationNtuplizer/UnprefirableInfo")

    for root, dirs, files in os.walk(filePath):
        for fileName in files:
            theFile = Path(f'{root}/{fileName}')
            unpackedChain.Add(str(theFile))
            unprefirableChain.Add(str(theFile))
    nEntries = unpackedChain.GetEntries()
    console.print(f'nEntries: {nEntries}')

    for entry in track(range(nEntries), description='Entries'):
        unpackedChain.GetEntry(entry)
        unprefirableChain.GetEntry(entry)

        if unprefirableChain.isUnprefirable:
            console.print("Found one!")
    
if __name__ == '__main__':
    main()
