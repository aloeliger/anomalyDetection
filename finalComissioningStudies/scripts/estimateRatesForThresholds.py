import ROOT
import os
from rich.console import Console
from rich.table import Table
from anomalyDetection.anomalyTriggerSkunkworks.plotSettings.utilities import convertEffToRate

console = Console()

def makeChainFromPath(path):
    CICADAChain = ROOT.TChain('l1CaloSummaryEmuTree/L1CaloSummaryTree')
    for root, dirs, files in os.walk(path):
        for fileName in files:
            theFile = f'{root}/{fileName}'
            CICADAChain.Add(theFile)
    return CICADAChain

def deriveRatesFromHisto(histo):
    rates = {}

    total_integral = histo.Integral(1, histo.GetNbinsX()+1)
    
    for binNum in range(1, histo.GetNbinsX()+2):
        cicadaThreshold = histo.GetXaxis().GetBinLowEdge(binNum)
        integral = histo.Integral(binNum, histo.GetNbinsX()+1)
        eff = integral/total_integral
        rate = convertEffToRate(eff, nBunches = 2352)

        rates[cicadaThreshold] = rate
    return rates

def dumpRateTable(rateTable):
    infoTable = Table(title='Rates')
    infoTable.add_column('CICADA Threshold')
    infoTable.add_column('Rate')

    for threshold in rateTable:
        infoTable.add_row(f'{threshold}', f'{rateTable[threshold]}')
    console.print(infoTable)

def main():
    ROOT.gStyle.SetOptStat(0)

    beforeRuns = {
        '386640': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386640',
        '386661': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386661',
        '386668': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386668',
    }
    afterRuns = {
        '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386673',
        '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386679',
        '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386694',
    }

    for runDictPair in [('before', beforeRuns), ('after', afterRuns)]:
        console.rule(runDictPair[0].capitalize())
        runDict = runDictPair[1]
        for run in runDict:
            console.log(f'Run: {run}')
            theChain = makeChainFromPath(runDict[run])
            df = ROOT.RDataFrame(theChain)

            nEvents = df.Count()
            scoreHist = df.Histo1D(
                (
                    'score_histo',
                    'score_histo',
                    256,
                    0.0,
                    256.0,
                ),
                'CICADAScore',
            )

            nEvents = nEvents.GetValue()
            scoreHist = scoreHist.GetValue()

            console.log(f'# Events: {nEvents}')

            rateTable = deriveRatesFromHisto(scoreHist)
            dumpRateTable(rateTable)
            

if __name__ == '__main__':
    main()
