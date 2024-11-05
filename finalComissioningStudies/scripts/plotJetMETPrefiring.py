import ROOT
from rich.console import Console
from rich.progress import track
from rich.table import Table
from pathlib import Path
import os
import math

console = Console()

def makeTableForChain(unpackedChain, triggerBitChain, triggerObjectChain, datasetName):
    nEntries = unpackedChain.GetEntries()
    console.print(f'nEntries: {nEntries}')
    
    allEventsPlot = ROOT.TH2D(
        'CICADA_BX_Scores',
        'CICADA_BX_Scores',
        5,
        -2.0,
        3.0,
        40,
        0.0,
        200.0,
    )

    triggerThresholds = [10.0*i for i in range(20)]

    entriesProcessed = {
        -2: 0,
        -1: 0,
        0: 0,
        1: 0,
        2: 0,
    }

    entriesAboveThreshold = {
        -2: {},
        -1: {},
        0: {},
        1: {},
        2: {},
    }
    for BX in [-2, -1, 0, 1, 2]:
        for threshold in triggerThresholds:
            entriesAboveThreshold[BX][threshold] = 0

    for entry in track(range(nEntries), description="Entries"):
        unpackedChain.GetEntry(entry)
        #triggerBitChain.GetEntry(entry)
        triggerObjectChain.GetEntry(entry)

        # if (
        #         triggerBitChain.L1_FirstBunchInTrain == 1
        #         or triggerBitChain.L1_SecondBunchInTrain == 1
        #         or triggerBitChain.L1_LastBunchInTrain == 1
        # ):
        #     continue

        if triggerObjectChain.L1Upgrade.nJets < 1:
            continue
        if triggerObjectChain.L1Upgrade.jetEt[0] < 100.0:
            continue
        #if triggerObjectChain.L1Upgrade.jetEt[1] < 100.0:
        #    continue
        
        
        scores = {
            -2: unpackedChain.BX_Minus_Two_Score,
            -1: unpackedChain.BX_Minus_One_Score,
            0: unpackedChain.BX_Zero_Score,
            1: unpackedChain.BX_One_Score,
            2: unpackedChain.BX_Two_Score,
        }

        for BX in entriesProcessed:
            entriesProcessed[BX] += 1

        for BX in scores:
            for threshold in triggerThresholds:
                if scores[BX] >= threshold:
                    entriesAboveThreshold[BX][threshold] += 1

        for BX in scores:
            allEventsPlot.Fill(
                BX,
                scores[BX],
            )

    console.print('Entries processed per BX')
    console.print(entriesProcessed)

    infoTable = Table(title=f"{datasetName} CICADA Prefiring Info")
    infoTable.add_column("CICADA Threshold")
    infoTable.add_column("BX -2 Above Threshold")
    infoTable.add_column("BX -1 Above Threshold")
    infoTable.add_column("BX 0 Above Threshold")
    infoTable.add_column("BX +1 Above Threshold")
    infoTable.add_column("BX +2 Above Threshold")

    for threshold in triggerThresholds:
        BX_m2_eff = entriesAboveThreshold[-2][threshold] / entriesProcessed[-2]
        BX_m2_eff_std = math.sqrt(entriesAboveThreshold[-2][threshold]) / entriesProcessed[-2]
        
        BX_m1_eff = entriesAboveThreshold[-1][threshold] / entriesProcessed[-1]
        BX_m1_eff_std = math.sqrt(entriesAboveThreshold[-1][threshold]) / entriesProcessed[-1]
        
        BX_0_eff = entriesAboveThreshold[0][threshold] / entriesProcessed[0]
        BX_0_eff_std = math.sqrt(entriesAboveThreshold[0][threshold]) / entriesProcessed[0]
        
        BX_p1_eff = entriesAboveThreshold[1][threshold] / entriesProcessed[1]
        BX_p1_eff_std = math.sqrt(entriesAboveThreshold[1][threshold]) / entriesProcessed[1]
        
        BX_p2_eff = entriesAboveThreshold[2][threshold] / entriesProcessed[2]
        BX_p2_eff_std = math.sqrt(entriesAboveThreshold[2][threshold]) / entriesProcessed[2]
        infoTable.add_row(
            f'{threshold}',
            f'{BX_m2_eff:.4%} +/- {BX_m2_eff_std:.4%}',
            f'{BX_m1_eff:.4%} +/- {BX_m1_eff_std:.4%}',
            f'{BX_0_eff:.4%} +/- {BX_0_eff_std:.4%}',
            f'{BX_p1_eff:.4%} +/- {BX_p1_eff_std:.4%}',
            f'{BX_p2_eff:.4%} +/- {BX_p2_eff_std:.4%}',
        )
    console.print(infoTable)

    theCanvas = ROOT.TCanvas("theCanvas", "theCanvas")

    allEventsPlot.SetTitle("All Events")
    allEventsPlot.GetXaxis().SetTitle("BX")
    allEventsPlot.GetYaxis().SetTitle("CICADA Score")
    allEventsPlot.Draw("COLZ")

    theCanvas.SaveAs(f'{datasetName}_CICADA_BX.png')
    
def main():
    ROOT.gStyle.SetOptStat(0)
    filePath = Path(
        '/hdfs/store/user/aloeliger/prefiringStudiesComplete'
    )

    unpackedChain = ROOT.TChain("unpackedCICADAScoreNtuplizer/UnpackedCICADAScores")
    triggerBitChain = ROOT.TChain("L1TTriggerBitsNtuplizer/L1TTriggerBits")
    triggerObjectChain = ROOT.TChain("l1UpgradeTree/L1UpgradeTree")
    for root, dirs, files in os.walk(filePath):
        for fileName in files:
            theFile = Path(f'{root}/{fileName}')
            unpackedChain.Add(str(theFile))
            triggerBitChain.Add(str(theFile))
            triggerObjectChain.Add(str(theFile))

    makeTableForChain(unpackedChain, triggerBitChain, triggerObjectChain, "JetMET")

    filePath = Path('/hdfs/store/user/aloelige/ZeroBias/pileupStudies_18Sep2024')

    unpackedChain = ROOT.TChain("unpackedCICADAScoreNtuplizer/UnpackedCICADAScores")
    triggerBitChain = ROOT.TChain("L1TTriggerBitsNtuplizer/L1TTriggerBits")
    triggerObjectChain = ROOT.TChain("l1UpgradeTree/L1UpgradeTree")
    
    for root, dirs, files in os.walk(filePath):
        #console.print(root)
        #console.print(dirs)
        #console.print(files)
        for fileName in files:
            theFile = Path(f'{root}/{fileName}')
            unpackedChain.Add(str(theFile))
            triggerBitChain.Add(str(theFile))
            triggerObjectChain.Add(str(theFile))

    #makeTableForChain(unpackedChain, triggerBitChain, "ZeroBias")
        
if __name__ == '__main__':
    main()
