# !/usr/bin/env python3

from pathlib import Path
from anomalyDetection.paperCode.plottingCore.plotTask import drawPlotTask
import ROOT
from anomalyDetection.anomalyTriggerSkunkworks.utilities.decorators import quietROOTFunc
import math
import re
from anomalyDetection.paperCode.plottingUtilities.rateTables import rateTableHelper

class drawSignalAdditionsPlotsTask(drawPlotTask):
    def __init__(
            self,
            taskName: str,
            dictOfFiles: dict,
            outputPath: Path = Path("/nfs_scratch/aloeliger/PaperPlotFiles/FinalizedPlots/PaperSignalAdditionPlots/")
    ):
        super().__init__(taskName, dictOfFiles, outputPath)
        self.rateTables = rateTableHelper()
    
    def parseHistogramName(self, histogramName):
        splitName = histogramName.split("_xxx_")
        sample, score, plotType = splitName[0], splitName[1], splitName[2]
        return sample, score, plotType

    def makeAdditionsPlot(self, noOverlapHist, overlapHist, allHist, scoreName):
        nHistBins = allHist.GetNbinsX()
        additionsGraph = ROOT.TGraphErrors(nHistBins)

        for i in range(1,nHistBins+1):
            nL1OnlyEvents = overlapHist.Integral(i, nHistBins+1)
            nCICADAOnlyEvents = noOverlapHist.Integral(i, nHistBins+1)
            try:
                percentageAdded = (((nCICADAOnlyEvents+nL1OnlyEvents)/nL1OnlyEvents)) * 100.0
                percentError = (math.sqrt(nCICADAOnlyEvents)/nL1OnlyEvents) * 100.0
            except ZeroDivisionError:
                percentageAdded = 0.0
                percentError = 0.0
            scoreThreshold = overlapHist.GetXaxis().GetBinLowEdge(i)
            rate, _ = self.rateTables.getRateForThreshold(scoreName, scoreThreshold)
            additionsGraph.SetPoint(i-1, rate, percentageAdded)
            additionsGraph.SetPointError(i-1, 0.0, percentError)
        return additionsGraph

    def removeTuneFromSignalString(self, signalString):
        return re.sub('_TuneCP5.*', '', signalString)

    def replaceWithPrettyPrintLabel(self, legendLabel):
        if legendLabel == "GluGluHToBB_M-125":
            return "GluGluH #rightarrow bb"
        elif legendLabel == "GluGluHToGG_M-125":
            return "GluGluH #rightarrow GG"
        elif legendLabel == "GluGluHToTauTau_M-125":
            return "GluGlu #rightarrow #tau#tau"
        elif legendLabel == "HHHTo6B_c3_0_d4_0":
            return "HHH #rightarrow 6b"
        elif legendLabel == "VBFHToTauTau_M125":
            return "VBFH #rightarrow #tau#tau"
        elif legendLabel == "VBFHto2B_M-125":
            return "VBFH #rightarrow bb"
        elif legendLabel == "ttHto2C_M-125":
            return "ttH #rightarrow 2C"
        elif legendLabel == "HTo2LongLivedTo4b_MH-350_MFF-80_CTau-500mm":
            return "H #rightarrow 2 Long-Lived #rightarrow 4b"
        elif legendLabel == "SUSYGluGluToBBHToBB_NarrowWidth_M-350":
            return "SUSY GluGlu #rightarrow bbH #rightarrow bb"
        elif legendLabel == "VBFHToInvisible_M-125":
            return "VBFH #rightarrow Invisible"
        elif legendLabel == "TT":
            return "t#bar{t}"
        else:
            return legendLabel
    
    def drawPlots(self):
        ROOT.gStyle.SetOptStat(0)
        signalAdditionsFile = self.dictOfFiles["signaladditions"]
        theFile = ROOT.TFile(signalAdditionsFile)

        listOfKeys = list(theFile.GetListOfKeys())
        listOfKeys = [x.GetName() for x in listOfKeys]

        noOverlapPlots = {}
        overlapPlots = {}
        genericPlots = {}

        for key in listOfKeys:
            sample, score, plotType = self.parseHistogramName(key)
            if 'ZeroBias' in sample or 'SingleNeutrino' in sample:
                continue
            relevantDict = None
            if plotType == 'NoOverlapWithL1':
                relevantDict = noOverlapPlots
            elif plotType == 'overlapWithL1':
                relevantDict = overlapPlots
            elif plotType == 'all':
                relevantDict = genericPlots
            else:
                raise RuntimeError("Found plot type in signal additions that was unexpected")
            
            if score not in relevantDict:
                relevantDict[score] = {}
            relevantDict[score][sample] = theFile.Get(key).Clone()
    
        possibleColors = [
            ROOT.kRed,
            ROOT.kGreen,
            ROOT.kBlue,
            ROOT.kYellow,
            ROOT.kMagenta,
            ROOT.kCyan,
            ROOT.kOrange,
            #ROOT.kSpring,
            #ROOT.kTeal,
            #ROOT.kAzure,
            ROOT.kViolet,
            #ROOT.kPink,
            30,
            40,
            #41,
            42,
            46,
        ]

        #TODO: Change this to a rate based addition
        #For now, we will do this as score on the X axis (threshold, cumulative)
        #And total percent addition on the y axis
        for score in noOverlapPlots:
            canvasName = f"{score}_additions_plot"
            theCanvas = ROOT.TCanvas(
                canvasName,
                canvasName,
                1200,
                500,
            )
            theCanvas.SetLogx()
            #theCanvas.SetLogy()
            theCanvas.SetRightMargin(0.2)

            #theLegend = ROOT.TLegend(0.6, 0.6, 0.9, 0.9)
            #theLegend = ROOT.TLegend(0.667, 0.1, 1.0, 0.9)
            theLegend = ROOT.TLegend(0.805, 0.1, 0.9675, 0.9)
            theLegend.SetLineWidth(0)
            theLegend.SetFillStyle(0)
            theLegend.SetTextSize(0.03)
            
            additionsGraphs = []
            primaryGraph = None

            #print()
            for index, sample in enumerate(noOverlapPlots[score]):
                noOverlapHist = noOverlapPlots[score][sample]
                overlapHist = overlapPlots[score][sample]
                allHist = genericPlots[score][sample]
                
                additionsGraph = self.makeAdditionsPlot(noOverlapHist, overlapHist, allHist, score)
                
                plotColor = possibleColors[index % len(possibleColors)] + 5*(math.floor(index/len(possibleColors)))
                #print(f"Using color: {plotColor}")
                #Set the various graph specific settings
                additionsGraph.SetMarkerStyle(20)
                additionsGraph.SetLineWidth(2)
                additionsGraph.SetMarkerColor(plotColor)
                additionsGraph.SetLineColor(plotColor)

                if index == 0:
                    additionsGraph.Draw('AP')
                else:
                    additionsGraph.Draw('P')

                if index == 0:
                    #additionsGraph.GetHistogram().GetXaxis().SetTitle(score+' Rate (kHz)')
                    additionsGraph.GetHistogram().GetXaxis().SetTitle('CICADA Rate (kHz)')
                    additionsGraph.GetHistogram().GetXaxis().SetTitleOffset(1.15)
                    additionsGraph.GetHistogram().GetYaxis().SetTitle("# CICADA Only Events + # L1 Events / # L1 Events #times 100")
                    additionsGraph.GetHistogram().SetTitle('')
                    primaryGraph = additionsGraph
                
                theLegend.AddEntry(
                    additionsGraph,
                    self.replaceWithPrettyPrintLabel(
                        self.removeTuneFromSignalString(sample),
                    ),
                    'p'
                )
                additionsGraphs.append(additionsGraph)
            axisMin = None
            axisMax = None
            for graph in additionsGraphs:
                if axisMax == None:
                    axisMax = graph.GetHistogram().GetMaximum()
                else:
                    if graph.GetHistogram().GetMaximum() > axisMax:
                        axisMax = graph.GetHistogram().GetMaximum()
                
                if axisMin == None:
                    axisMin = graph.GetHistogram().GetMinimum()
                else:
                    if graph.GetHistogram().GetMinimum() < axisMin:
                        axisMin = graph.GetHistogram().GetMinimum()

            #don't go higher than 1 MHz
            #axisMax = min(1.0e3, axisMax)
            primaryGraph.GetHistogram().GetXaxis().SetRangeUser(0.1, 1.0e2)
            #primaryGraph.GetHistogram().GetYaxis().SetRangeUser(1.0, 2.0e3)
            primaryGraph.GetHistogram().GetYaxis().SetRangeUser(100.0, 400.0)

            cmsLatex = ROOT.TLatex()
            cmsLatex.SetTextSize(0.05)
            cmsLatex.SetNDC(True)
            cmsLatex.SetTextAlign(32)
            #cmsLatex.DrawLatex(0.9,0.92, "#font[61]{CMS} #font[52]{Preliminary}")
            cmsLatex.DrawLatex(0.8,0.92, "#font[61]{CMS} #font[52]{Preliminary}")
            
            theLegend.Draw()

            quietROOTFunc(theCanvas.SaveAs)(
                str(self.outputPath/f"{canvasName}.png")
            )
            quietROOTFunc(theCanvas.SaveAs)(
                str(self.outputPath/f"{canvasName}.pdf")
            )
