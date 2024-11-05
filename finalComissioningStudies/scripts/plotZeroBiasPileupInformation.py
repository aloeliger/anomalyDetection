import ROOT
from rich.console import Console
from rich.progress import track
from rich.table import Table
from pathlib import Path
import os

console = Console()

def main():
    ROOT.gStyle.SetOptStat(0)
    filePath = Path('/hdfs/store/user/aloelige/ZeroBias/pileupStudies_18Sep2024')

    unpackedChain = ROOT.TChain("unpackedCICADAScoreNtuplizer/UnpackedCICADAScores")
    
    for root, dirs, files in os.walk(filePath):
        #console.print(root)
        #console.print(dirs)
        #console.print(files)
        for fileName in files:
            theFile = Path(f'{root}/{fileName}')
            unpackedChain.Add(str(theFile))
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
        200.0
    )

    highScoresPlot = ROOT.TH2D(
        'High_Score_CICADA_BX_Scores',
        'High_Score_CICADA_BX_Scores',
        5,
        -2.0,
        3.0,
        40,
        0.0,
        200.0,
    )

    triggerThresholds = [10.0 *i for i in range(20)]
    thresholdPlots = dict(
        [
            (
                threshold,
                ROOT.TH2D(
                    f'Score_threshold_{int(threshold)}_Plot',
                    f'Score_threshold_{int(threshold)}_Plot',
                    5,
                    -2.0,
                    3.0,
                    40,
                    0.0,
                    200.0,
                )
            )
            for threshold in triggerThresholds
        ]
    )

    entries_processed = {
        -2: 0,
        -1: 0,
        0: 0,
        1: 0,
        2: 0,
    }
    
    for entry in track(range(nEntries), description='Entries'):
        unpackedChain.GetEntry(entry)

        scores = {
            -2: unpackedChain.BX_Minus_Two_Score,
            -1: unpackedChain.BX_Minus_One_Score,
            0: unpackedChain.BX_Zero_Score,
            1: unpackedChain.BX_One_Score,
            2: unpackedChain.BX_Two_Score,
        }

        if scores[0] > 80.0:
            for BX in scores:
                highScoresPlot.Fill(
                    BX,
                    scores[BX],
                )
        
        for BX in scores:
            allEventsPlot.Fill(
                BX,
                scores[BX],
            )

            entries_processed[BX] += 1

            if scores[BX] < 0.0 or scores[BX] > 256.0:
                console.print(f'Received odd score! {scores[BX]}')
            # totalIntegral = allEventsPlot.Integral(BX+3,BX+3, 0, 21)
            # if totalIntegral != entries_processed[BX]:
            #     console.print('[red]FAILED![/red]')
            #     console.print(f'{BX}')
            #     console.print(f'totalIntegral: {totalIntegral}')
            #     console.print(f'Entries: {entries_processed[BX]}')
            #     console.print(f'Scores: {scores[BX]}')
            #     exit(-1)
            # else:
            #     console.print(f'{BX}')
            #     console.print(f'totalIntegral: {totalIntegral}')
            #     console.print(f'Entries: {entries_processed[BX]}')
            #     console.print(f'Scores: {scores[BX]}')

    console.print('Entries processed per BX')
    console.print(entries_processed)

    theCanvas = ROOT.TCanvas("theCanvas", 'theCanvas')

    allEventsPlot.SetTitle("All Events")
    allEventsPlot.GetXaxis().SetTitle("BX")
    allEventsPlot.GetYaxis().SetTitle("CICADA Score")
    allEventsPlot.Draw("COLZ")
    theCanvas.SaveAs("ScoreDistributions.png")

    highScoresPlot.SetTitle("CICADA > 80.0")
    highScoresPlot.GetXaxis().SetTitle("BX")
    highScoresPlot.GetYaxis().SetTitle("CICADA Score")
    highScoresPlot.Draw("COLZ")
    theCanvas.SaveAs("HighCentralBXScoreDistribution.png")

    infoTable = Table(title="CICADA Prefiring Info")
    infoTable.add_column("Central BX Threshold")
    infoTable.add_column("Percent BX -1 Above Threshold (No Central BX Threshold)")
    infoTable.add_column("Percent BX -1 Above Threshold (Central BX Threshold applied)")
    infoTable.add_column("Percent BX +1 Above Threshold (No Central BX threshold)")
    infoTable.add_column("Percent BX +1 Above Threshold (Central BX Threshold applied)")
    
    for thresholdIndex, threshold in enumerate(triggerThresholds):
        console.print(f'Hypothetical Trigger Threshold: {threshold}')

        # threshold_yBin = int(threshold/10.0)+1
        # console.print(f'y bin: {threshold_yBin}')

        # bxm1_all_eventsAboveThreshold = allEventsPlot.Integral(2,2, threshold_yBin, 21)
        # bxm1_all_fracAboveThreshold = bxm1_all_eventsAboveThreshold / allEventsPlot.Integral(2,2,1,21)
        # console.print(f'BX -1: all events above threshold: {bxm1_all_eventsAboveThreshold}, {bxm1_all_fracAboveThreshold:.4%}')

        # bxp1_all_eventsAboveThreshold = allEventsPlot.Integral(4,4, threshold_yBin, 21)
        # bxp1_all_fracAboveThreshold = bxp1_all_eventsAboveThreshold / allEventsPlot.Integral(4,4, 1, 21)

        # console.print(f'BX +1: all events above threshold: {bxp1_all_eventsAboveThreshold}, {bxp1_all_fracAboveThreshold:.4%}')

        thresholdEvents = 0

        bxm1_all_events = 0
        bxp1_all_events = 0
        
        bxm1_all_eventsAboveThreshold = 0
        bxp1_all_eventsAboveThreshold = 0
        
        bxm1_threshold_eventsAboveThreshold = 0
        bxp1_threshold_eventsAboveThreshold = 0
        
        for entry in track(range(nEntries), description='Entries'):
            unpackedChain.GetEntry(entry)
            scores = {
                -2: unpackedChain.BX_Minus_Two_Score,
                -1: unpackedChain.BX_Minus_One_Score,
                0: unpackedChain.BX_Zero_Score,
                1: unpackedChain.BX_One_Score,
                2: unpackedChain.BX_Two_Score,
            }

            bxm1_all_events += 1
            bxp1_all_events += 1

            if scores[-1] >= threshold:
                bxm1_all_eventsAboveThreshold += 1
            if scores[1] >= threshold:
                bxp1_all_eventsAboveThreshold += 1
            
            if scores[0] >= threshold:
                thresholdEvents += 1
                for BX in scores:
                    thresholdPlots[threshold].Fill(
                        BX,
                        scores[BX]
                    )
                if scores[-1] >= threshold:
                    bxm1_threshold_eventsAboveThreshold += 1
                if scores[1] >= threshold:
                    bxp1_threshold_eventsAboveThreshold += 1
        bxm1_all_fracAboveThreshold = bxm1_all_eventsAboveThreshold / bxm1_all_events
        bxp1_all_fracAboveThreshold = bxp1_all_eventsAboveThreshold / bxp1_all_events

        if thresholdEvents != 0:
            bxm1_threshold_fracAboveThreshold = bxm1_threshold_eventsAboveThreshold / thresholdEvents
            bxp1_threshold_fracAboveThreshold = bxp1_threshold_eventsAboveThreshold / thresholdEvents
        else:
            bxm1_threshold_fracAboveThreshold = 0.0
            bxp1_threshold_fracAboveThreshold = 0.0
        console.print(f'Threshold events: {thresholdEvents}')
        console.print(f'All events: {bxm1_all_events}')
        console.print(f'BX -1, events above threshold (no central bx restriction): {bxm1_all_eventsAboveThreshold}  {bxm1_all_fracAboveThreshold:.4%}')
        console.print(f'BX -1, events above threshold (central bx restriction): {bxm1_threshold_eventsAboveThreshold} {bxm1_threshold_fracAboveThreshold:.4%}')
        console.print(f'BX +1, events above threshold (no central bx restriction): {bxp1_all_eventsAboveThreshold} {bxp1_all_fracAboveThreshold:.4%}')
        console.print(f'BX +1, events above threshold (central bx restriction): {bxp1_threshold_eventsAboveThreshold} {bxp1_threshold_fracAboveThreshold:.4%}')
        
        # console.print(f'Threshold events: {thresholdEvents}')
        # bxm1_threshold_eventsAboveThreshold = thresholdPlots[threshold].Integral(2,2,threshold_yBin, 21)
        # bxm1_threshold_fracAboveThreshold = bxm1_threshold_eventsAboveThreshold/thresholdPlots[threshold].Integral(2,2,1,21)
        # console.print(f'BX -1: threshold events above threshold: {bxm1_threshold_eventsAboveThreshold}, {bxm1_threshold_fracAboveThreshold:.4%}')

        # bxp1_threshold_eventsAboveThreshold = thresholdPlots[threshold].Integral(4,4, threshold_yBin, 21)
        # bxp1_threshold_fracAboveThreshold = bxp1_threshold_eventsAboveThreshold / thresholdPlots[threshold].Integral(4,4,1,21)
        # console.print(f'BX +1: threshold evnets above threshold: {bxp1_threshold_eventsAboveThreshold}, {bxp1_threshold_fracAboveThreshold:.4%}')
        # console.print()

        #totalContent = 0
        #for i in range(22):
        #    content = thresholdPlots[threshold].GetBinContent(4, i)
        #    totalContent += content
         #    console.print(f'Bin: {i}, Content: {content}')
        #console.print(f'Total Content: {totalContent}')

        thresholdPlots[threshold].SetTitle(f"CICADA > {threshold}")
        thresholdPlots[threshold].GetXaxis().SetTitle("BX")
        thresholdPlots[threshold].GetYaxis().SetTitle("CICADA Score")
        thresholdPlots[threshold].Draw("COLZ")
        theCanvas.SaveAs(f'CICADA_Threshold_{int(threshold)}_scores.png')

        infoTable.add_row(f"{threshold}", f"{bxm1_all_fracAboveThreshold:.4%}", f"{bxm1_threshold_fracAboveThreshold:.4%}", f"{bxp1_all_fracAboveThreshold:.4%}", f"{bxp1_threshold_fracAboveThreshold:.4%}")
    console.print(infoTable)

    
if __name__ == '__main__':
    main()
