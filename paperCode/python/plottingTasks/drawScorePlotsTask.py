# !/usr/bin/env python3

from pathlib import Path
from anomalyDetection.paperCode.plottingCore.plotTask import drawPlotTask
import ROOT
from anomalyDetection.anomalyTriggerSkunkworks.utilities.decorators import quietROOTFunc

class drawScorePlotsTask(drawPlotTask):
    def __init__(
            self,
            taskName: str,
            dictOfFiles: dict,
            outputPath: Path = Path("/nfs_scratch/aloeliger/PaperPlotFiles/FinalizedPlots/PaperScorePlots/"),
    ):
        super().__init__(taskName, dictOfFiles, outputPath)

    def parseHistogramName(self, histogramName):
        splitName = histogramName.split('_xxx_')
        sampleName, scoreName = splitName[0], splitName[1]
        return sampleName, scoreName
        
    def drawPlots(self):
        ROOT.gStyle.SetOptStat(0)
        scoreFile = self.dictOfFiles["scores"]
        theFile = ROOT.TFile(scoreFile)

        listOfKeys = list(theFile.GetListOfKeys())
        listOfKeys = [x.GetName() for x in listOfKeys]
        
        plots = {}
        for key in listOfKeys:
            sampleName, scoreName = self.parseHistogramName(key)
            if scoreName not in plots:
                plots[scoreName] = {}
            if sampleName not in plots[scoreName]:
                plots[scoreName][sampleName] = theFile.Get(key).Clone()
        
        #Now that we have all plots, let's draw them by score
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
            #ROOT.kViolet,
            #ROOT.kPink,
        ]

        # possibleColors = [
        #     (255,0,0), # red
        #     (0,0,255), # blue
        #     (0,255,0), # green
        #     (255,165,0), # orange
        #     (128, 0, 128), #purple
        #     (0,255,255), #cyan
        #     (255,0,255), # magenta
        #     (255,255,0), #yellow
        #     (0, 128, 0), #dark green
        #     (173, 216, 230), #light blue
        #     (255, 192, 203), #pink
        #     (163, 42, 42), #brown
        #     (169, 169, 169), #dark gray
        #     (255, 200, 150), #light orange
        # ]

        plotsToNotDraw = [
            'Train_ZeroBias',
            
        ]
        
        #TODO: This is a bit of a nightmare. Abstract?
        for scoreIndex, scoreName in enumerate(plots):
            theCanvas = ROOT.TCanvas(
                f'{scoreName}_scores',
                f'{scoreName}_scores',
                1200,
                500
            )
            theCanvas.SetRightMargin(0.33)

            #theLegend = ROOT.TLegend(0.6, 0.6, 0.9, 0.9)
            theLegend = ROOT.TLegend(0.667, 0.1, 1.0, 0.9)
            theLegend.SetLineWidth(0)
            theLegend.SetFillStyle(0)

            scorePlots = []
            primaryPlot = None
            skipSample = False
            isFirstPlot = True

            for sampleIndex, sampleName in enumerate(plots[scoreName]):
                for skippedSampleName in plotsToNotDraw:
                    if skippedSampleName in sampleName:
                        skipSample = True
                if skipSample:
                    skipSample=False
                    continue
                    
                plots[scoreName][sampleName].Scale(1.0/plots[scoreName][sampleName].Integral()) #Bad .Integral() issue?
                #let's figure out the color of this thing
                baseColor = possibleColors[sampleIndex % len(possibleColors)]
                # rgbValues = possibleColors[sampleIndex%len(possibleColors)]
                # baseColor = ROOT.TColor(rgbValues[0]/255.0, rgbValues[1]/255.0, rgbValues[2]/255.0)
                colorOffset = -5*(sampleIndex // len(possibleColors))
                #colorOffset = 0
                
                plots[scoreName][sampleName].SetLineWidth(2)
                plots[scoreName][sampleName].SetMarkerStyle(20)
                plots[scoreName][sampleName].SetLineColor(baseColor + colorOffset)
                plots[scoreName][sampleName].SetMarkerColor(baseColor + colorOffset)

                if isFirstPlot:
                    plots[scoreName][sampleName].SetTitle("")
                    drawOpts = "E1 X0"
                    primaryPlot = plots[scoreName][sampleName]
                    isFirstPlot = False
                else:
                    drawOpts = "E1 SAME X0"
                scorePlots.append(plots[scoreName][sampleName])

                plots[scoreName][sampleName].Draw(drawOpts)

                if sampleIndex == 0:
                    plots[scoreName][sampleName].GetXaxis().SetTitle(scoreName)
                    plots[scoreName][sampleName].GetYaxis().SetTitle("Events (normalized to 1)")
                theLegend.AddEntry(
                    plots[scoreName][sampleName],
                    sampleName,
                    "l",
                )

            axisMin = None
            axisMax = None
            for plot in scorePlots:
                if axisMax == None:
                    axisMax = plot.GetMaximum()
                else:
                    if plot.GetMaximum() > axisMax:
                        axisMax = plot.GetMaximum()

                if axisMin == None:
                    axisMin = plot.GetMinimum()
                else:
                    if plot.GetMinimum() < axisMin:
                        axisMin = plot.GetMinimum()

            primaryPlot.GetYaxis().SetRangeUser(axisMin*0.9, axisMax*1.1)

            cmsLatex = ROOT.TLatex()
            cmsLatex.SetTextSize(0.05)
            cmsLatex.SetNDC(True)
            cmsLatex.SetTextAlign(32)
            #cmsLatex.DrawLatex(0.9,0.92, "#font[61]{CMS} #font[52]{Preliminary}")
            cmsLatex.DrawLatex(0.667,0.92, "#font[61]{CMS} #font[52]{Preliminary}")

            theLegend.Draw()
            
            quietROOTFunc(theCanvas.SaveAs)(
                str(
                    self.outputPath / f"{scoreName}_scores.png"
                )
            )
            quietROOTFunc(theCanvas.SaveAs)(
                str(
                    self.outputPath / f"{scoreName}_scores.pdf"
                )
            )
