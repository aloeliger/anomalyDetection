#Look at CICADA Inputs versus pileup to understand possible zero suppression schemes

import ROOT
import argparse
from pathlib import Path
from rich.console import Console
from validateTrainingData import makeDataframe
import numpy as np
from anomalyDetection.anomalyTriggerSkunkworks.utilities.decorators import quietROOTFunc

console = Console()

# Hold some information, dataframes, and histograms
# As well as some convenience functions
# To prevent too much repetition
# And make this a little more convenient
class DFAndHistoHolder():
    def __init__(self, baseDF, plotOutputPath, frameDefinition = '', identifier=''):
        if frameDefinition != '':
            self.df = baseDF.Filter(frameDefinition)
        else:
            self.df = baseDF
        self.frameDefinition = frameDefinition
        self.identifier = identifier
        self.outputPath = plotOutputPath/self.identifier
        self.outputPath.mkdir(parents=True, exist_ok=True)
        
        self.bookings = None
        self.hcal_eta_bookings = None
        self.ecal_eta_bookings = None
        self.cicada_eta_bookings = None
        
        self.cicadaHisto = None
        self.cicadaHistoName = f'CICADARegions_{self.identifier}'

        self.HCALTPHisto = None
        self.HCALTPHistoName = f'HCALTP_{self.identifier}'

        self.ECALTPHisto = None
        self.ECALTPHistoName = f'ECALTP_{self.identifier}'

        self.towerHisto = None
        self.towerHistoName = f'caloTowers_{self.identifier}'

    def makeVariableBooking(self, variable, histoName):
        histoBooking = self.df.Histo1D(
            (
                histoName,
                histoName,
                29,
                1.0,
                30.0,
            ),
            variable
        )
        return histoBooking

    # Make bookings for examining TPs at different iEta slices
    def makeTPEtaSliceBookings(self):
        iEtaRanges = [
            (-28,-24),
            (-24,-20),
            (-20,-16),
            (-16,-12),
            (-12,-8),
            (-8,-4),
            (-4,0),
            (0,4),
            (4,8),
            (8,12),
            (12,16),
            (16,20),
            (20,24),
            (24,28),
        ]
        hcal_eta_bookings = []
        ecal_eta_bookings = []

        for etaRange in iEtaRanges:
            eta_str_1 = str(etaRange[0]).replace('-','n')
            eta_str_2 = str(etaRange[1]).replace('-','n')
            self.df = self.df.Define(
                f'hcal_eta_mask_{eta_str_1}_{eta_str_2}',
                f'hcalTPieta >= {etaRange[0]} && hcalTPieta < {etaRange[1]}'
            )
            self.df = self.df.Define(
                f'hcalTPet_in_eta_{eta_str_1}_{eta_str_2}',
                f'hcalTPet[hcal_eta_mask_{eta_str_1}_{eta_str_2}]',
            )
            self.df = self.df.Define(
                f'ecal_eta_mask_{eta_str_1}_{eta_str_2}',
                f'ecalTPieta >= {etaRange[0]} && ecalTPieta < {etaRange[1]}'
            )
            self.df = self.df.Define(
                f'ecalTPet_in_eta_{eta_str_1}_{eta_str_2}',
                f'ecalTPet[ecal_eta_mask_{eta_str_1}_{eta_str_2}]',
            )
            hcal_eta_bookings.append(
                self.df.Histo1D(
                    (
                        f'hcal_tp_eta_gte_{eta_str_1}_lt_{eta_str_2}',
                        f'hcal_tp_eta_gte_{eta_str_1}_lt_{eta_str_2}',
                        29,
                        1.0,
                        30.0,
                    ),
                    f'hcalTPet_in_eta_{eta_str_1}_{eta_str_2}',
                )
            )
            ecal_eta_bookings.append(
                self.df.Histo1D(
                    (
                        f'ecal_tp_eta_gte_{eta_str_1}_lt_{eta_str_2}',
                        f'ecal_tp_eta_gte_{eta_str_1}_lt_{eta_str_2}',
                        29,
                        1.0,
                        30.0,
                    ),
                    f'ecalTPet_in_eta_{eta_str_1}_{eta_str_2}',
                )
            )
        return hcal_eta_bookings, ecal_eta_bookings

    def makeCICADAEtaSlideBookings(self):
        iEta = [x for x in range(14)]
        cicada_bookings = []
        for eta in iEta:
            cicada_bookings.append(
                self.df.Define(
                    'eta_mask',
                    f'iEta == {eta}'
                ).Define(
                    'CICADA_in_eta',
                    'modelInput[eta_mask]',
                ).Histo1D(
                    (
                        f'CICADA_eta_{eta}',
                        f'CICADA_eta_{eta}',
                        29,
                        1.0,
                        30.0
                    ),
                    'CICADA_in_eta',
                )
            )
        return cicada_bookings
    
    def makeAllBookings(self):
        self.bookings = {
            self.cicadaHistoName: self.makeVariableBooking(
                'modelInput',
                self.cicadaHistoName,
            ),
            self.HCALTPHistoName: self.makeVariableBooking(
                'hcalTPet',
                self.HCALTPHistoName,
            ),
            self.ECALTPHistoName: self.makeVariableBooking(
                'ecalTPet',
                self.ECALTPHistoName,
            ),
            self.towerHistoName: self.makeVariableBooking(
                'L1CaloTower.iet',
                self.towerHistoName
            )
        }
        self.hcal_eta_bookings, self.ecal_eta_bookings = self.makeTPEtaSliceBookings()
        self.cicada_eta_bookings = self.makeCICADAEtaSlideBookings()

    def triggerAllComputations(self):
        #Once all bookings are made, let's trigger the computation
        #And fill the useful bits of this class
        for key in self.bookings:
            self.bookings[key] = self.bookings[key].GetValue()
        self.cicadaHisto = self.bookings[self.cicadaHistoName]
        self.HCALTPHisto = self.bookings[self.HCALTPHistoName]
        self.ECALTPHisto = self.bookings[self.ECALTPHistoName]
        self.towerHisto = self.bookings[self.towerHistoName]

        # for i in range(len(self.hcal_eta_bookings)):
        #     self.hcal_eta_bookings[i] = self.hcal_eta_bookings[i].GetValues()
        # for i in range(len(self.ecal_eta_bookings)):
        #     self.ecal_eta_bookings[i] = self.ecal_eta_bookings[i].GetValue()
        # for i in range(len(self.cicada_eta_bookings)):
        #     self.cicada_eta_bookings[i] = self.cicada_eta_bookings[i].GetValues()
        
    def drawVariableHisto(self, histoBooking, histoName, xAxisTitle):
        theCanvas = ROOT.TCanvas(f'{histoName}')

        histoIntegral = histoBooking.Integral()
        if histoIntegral != 0.0:
            histoBooking.Scale(1.0/histoIntegral)
    
        histoBooking.Draw('HIST')
        histoBooking.SetLineColor(ROOT.kRed)
        histoBooking.GetXaxis().SetTitle(xAxisTitle)
        histoBooking.GetYaxis().SetTitle('Fraction')

        quietROOTFunc(theCanvas.SaveAs)(
            str(
                self.outputPath/f'{histoName}.png'
            )
        )

    def drawRatioPlot(self, numPlot, denomPlot, histoName):
        theCanvas = ROOT.TCanvas(f'{histoName}')

        ratioPlot = numPlot.Clone()
        ratioPlot.Divide(denomPlot)
        ratioPlot.GetYaxis().SetTitle('Ratio')

        quietROOTFunc(theCanvas.SaveAs)(
            str(
                self.outputPath/f'{histoName}.png'
            )
        )

    def drawAllVariables(self):
        self.drawVariableHisto(
            self.bookings[self.cicadaHistoName],
            self.cicadaHistoName,
            'CICADA Region ETs',
        )
        self.drawVariableHisto(
            self.bookings[self.HCALTPHistoName],
            self.HCALTPHistoName,
            'HCAL TP ETs',
        )
        self.drawVariableHisto(
            self.bookings[self.ECALTPHistoName],
            self.ECALTPHistoName,
            'ECAL TP ETs',
        )
        self.drawVariableHisto(
            self.bookings[self.towerHistoName],
            self.towerHistoName,
            'Calo Tower ETs',
        )

        for histo in self.hcal_eta_bookings:
            self.drawVariableHisto(
                histo,
                histo.GetName(),
                'HCAL TP ET'
            )
        
        for histo in self.ecal_eta_bookings:
            self.drawVariableHisto(
                histo,
                histo.GetName(),
                'ECAL TP ET'
            )

        for histo in self.cicada_eta_bookings:
            self.drawVariableHisto(
                histo,
                histo.GetName(),
                'CICADA ET'
            )

def makeRunFilterString(runs):
    theStr = ''
    for run in runs:
        theStr += f'run != {run} &&'
    theStr = theStr[:-3]
    return theStr

def filterDF(df):
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

    filterDF = df.Filter(makeRunFilterString(badRuns)).Filter('npv != 0 && npv != 1')
    return filterDF

def drawCICADARegionHisto(histoBooking, outputPath, identifier):
    theCanvas = ROOT.TCanvas(f'{identifier}')

    histoBooking.Scale(1.0/histoBooking.Integral())
    
    histoBooking.Draw('HIST')
    histoBooking.SetLineColor(ROOT.kRed)
    histoBooking.GetXaxis().SetTitle('CICADA Region ET')
    histoBooking.GetYaxis().SetTitle('Fraction')

    quietROOTFunc(theCanvas.SaveAs)(
        str(
            outputPath/f'CICADARegions_{identifier}.png'
        )
    )

def main(args):
    #okay, let's take a look at the runs we have recommended, and look at nonzero npv.
    #From there, let's figure out the the mean of the NPV, and the std
    #we can take 2 sigma up,
    # 1 sigma up
    # average and up
    # and all
    # then look at the overall CICADA contributions
    
    ROOT.gStyle.SetOptStat(0)
    df, chain, nFiles = makeDataframe(args.trainingDirectories)
    console.log(f'# of files: {nFiles}')

    goodDF = filterDF(df)

    console.log('Booking computation of NPV values')
    avgNPV = goodDF.Mean('npv')
    stdNPV = goodDF.StdDev('npv')

    console.log('Triggering computation of NPV values')
    avgNPV = int(np.round(avgNPV.GetValue()))
    stdNPV = int(np.round(stdNPV.GetValue()))

    console.log(f'NPV: Mean: {avgNPV}, Std: {stdNPV}')

    plotOutputPath = Path(f'./{args.outputDir}')
    plotOutputPath.mkdir(parents=True, exist_ok=True)

    console.log('Making all holders...')
    allInfo = DFAndHistoHolder(
        goodDF,
        plotOutputPath,
        '',
        'All',
    )
    
    twoSigmaInfo = DFAndHistoHolder(
        goodDF,
        plotOutputPath,
        f'npv >= {avgNPV + 2*stdNPV}',
        'PlusTwoSigma',
    )
    oneSigmaInfo = DFAndHistoHolder(
        goodDF,
        plotOutputPath,
        f'npv >= {avgNPV + stdNPV}',
        'PlusOneSigma'
    )
    aboveAverageInfo = DFAndHistoHolder(
        goodDF,
        plotOutputPath,
        f'npv >= {avgNPV}',
        'AboveAverage',
    )
    belowAverageInfo = DFAndHistoHolder(
        goodDF,
        plotOutputPath,
        f'npv <= {avgNPV}',
        'BelowAverage'
    )
    oneSigmaDownInfo = DFAndHistoHolder(
        goodDF,
        plotOutputPath,
        f'npv <= {avgNPV - stdNPV}',
        'OneSigmaDown'
    )

    allHolders = [allInfo, twoSigmaInfo, oneSigmaInfo, aboveAverageInfo, belowAverageInfo, oneSigmaDownInfo]

    for holder in allHolders:
        console.log(f'Making booking: {holder.identifier}')
        holder.makeAllBookings()

    for holder in allHolders:
        console.log(f'Triggering computation: {holder.identifier}')
        holder.triggerAllComputations()

    for holder in allHolders:
        console.log(f'Drawing plots: {holder.identifier}')
        holder.drawAllVariables()

    aboveAverageInfo.drawRatioPlot(
        aboveAverageInfo.cicadaHisto,
        belowAverageInfo.cicadaHisto,
        f'{aboveAverageInfo.cicadaHistoName}_Ratio'
    )
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Look at the effect of pileup on the CICADA input')
    parser.add_argument(
        'trainingDirectories',
        nargs='+',
        help='Directories with files to be used in training',
    )
    parser.add_argument(
        '--outputDir',
        nargs='?',
        default='CICADATraining_npv_plots',
    )

    args = parser.parse_args()
    
    main(args)
