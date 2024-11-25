import ROOT
from rich.console import Console
import json
import os

console = Console()

def makeRunString(listOfRuns):
    theString = ''
    for run in listOfRuns:
        theString += f'run == {run} ||'
    theString = theString[:-3]
    return theString

def drawNPVHist(theHist, identifier):
    theCanvas = ROOT.TCanvas(f'{identifier}_Canvas')
    
    theHist.Draw("HIST")
    theHist.SetLineColor(ROOT.kRed)
    theHist.SetLineWidth(2)

    theHist.GetXaxis().SetTitle("NPV")
    theHist.GetYaxis().SetTitle("Fraction")

    theCanvas.SaveAs(f'{identifier}_NPV.png')

def makeChain(path):
    theChain = ROOT.TChain('l1EventTree/L1EventTree')
    for root, dirs, files, in os.walk(path):
        for fileName in files:
            theChain.Add(
                f'{root}/{fileName}'
            )
    return theChain

def checkRunInformation(theChain, run):
    df = ROOT.RDataFrame(theChain)
    runDF = df.Filter(f'run=={run}').Filter(f'npv != 1')

    numEntries = runDF.Count()
    avgNPV = runDF.Mean('npv')
    stdNPV = runDF.StdDev('npv')

    numEntries = numEntries.GetValue()
    avgNPV = avgNPV.GetValue()
    stdNPV = stdNPV.GetValue()

    console.log(f'Run {run}')
    console.log(f'# Events: {numEntries}')
    console.log(f'Mean NPV: {avgNPV}')
    console.log(f'Std Dev NPV: {stdNPV}')
    console.log()

def main():
    dataFilePath = 'Data_DPS_NPV.root'
    dataChain = ROOT.TChain('npvNtuplizer/NPVTree')
    dataChain.Add(dataFilePath)
    data_df = ROOT.RDataFrame(dataChain)

    nEntries = data_df.Count()

    runs = [
        #EZB0
        '367094',
        '367111',
        #RunB
        '366829',
        '366832',
        #RunC
        '367133',
        '367134',
        '367228',
        #RunD
        '369873',
        '370091',
        '370144',
    ]

    for run in runs:
        checkRunInformation(dataChain, run)

    run_data_df = data_df.Filter(
        makeRunString(
            runs
        )
    )

    # run_data_df = data_df.Filter(
    #     f'run == 366832'
    # )
    runEntries =run_data_df.Count()
    NPV_Hist = run_data_df.Histo1D(
        (
            'NPV_Runs',
            'NPV_Runs',
            100,
            0.0,
            100.0,
        ),
        'npv',
    )

    run_sensible_data_df = run_data_df.Filter(
        'npv > 1'
    )
    sensibleEntries = run_sensible_data_df.Count()
    NPV_Sensible_Hist = run_sensible_data_df.Histo1D(
        (
            'NPV_Sensible_Runs',
            'NPV_Sensible_Runs',
            100,
            0.0,
            100.0,
        ),
        'npv',
    )
    
    nEntries = nEntries.GetValue()
    runEntries = runEntries.GetValue()
    sensibleEntries = sensibleEntries.GetValue()
    
    NPV_Hist = NPV_Hist.GetValue()
    NPV_Sensible_Hist = NPV_Sensible_Hist.GetValue()

    NPV_Hist.Scale(1.0/NPV_Hist.Integral())
    NPV_Sensible_Hist.Scale(1.0/NPV_Sensible_Hist.Integral())

    console.print(f'{nEntries} Events')
    console.print(f'{runEntries} Events in runs of interest')
    console.print(f'{sensibleEntries} Events where NPV seems to make sense')
    
    drawNPVHist(NPV_Hist, 'Data')
    drawNPVHist(NPV_Sensible_Hist, 'Data_NonOne')

    mc_samples = {
        'HtoLongLived': '/hdfs/store/user/aloeliger/L1Ntuples_HToLongLived_2023_27Jul2023_0949/',
        'SUEP': '/hdfs/store/user/aloeliger/L1Ntuples_SUEP_2023_28Jul2023_1034',
        'SUSYGGBBH': '/hdfs/store/user/aloeliger/L1Ntuples_SUSYGGBBH_2023_27Jul2023_0949',
        'TT': '/hdfs/store/user/aloeliger/L1Ntuples_TT_2023_27Jul2023_0950',
        'VBFHto2C': '/hdfs/store/user/aloeliger/L1Ntuples_VBFHto2C_2023_27Jul2023_0950',
    }

    for sample in mc_samples:
        console.log(sample)
        theChain = makeChain(mc_samples[sample])
        theDF = ROOT.RDataFrame(theChain)

        theHist = theDF.Histo1D(
            (
                f'NPV_{sample}',
                f'NPV_{sample}',
                100,
                0.0,
                100.0,
            ),
            'nPV',
        )

        theHist = theHist.GetValue()

        theHist.Scale(1.0/theHist.Integral())
        drawNPVHist(theHist, f'{sample}')

        factorHist = NPV_Sensible_Hist.Clone()
        factorHist.Divide(theHist)

        factorHist.SetNameTitle(f'{sample}_factors', f'{sample}_factors')

        drawNPVHist(factorHist, f'{sample}_factors')

        factors = {}
        for npv in range(100):
            binNumber = npv+1
            factor = factorHist.GetBinContent(binNumber)
            factors[binNumber] = factor

        with open (f'{sample}_PU_Factors.json', 'w+') as theFile:
            json.dump(factors, theFile)
    console.log("Done!")
    

if __name__ =='__main__':
    main()
