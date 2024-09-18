from pathlib import Path
from anomalyDetection.paperCode.plottingCore.plotTask import drawPlotTask
import ROOT
from anomalyDetection.anomalyTriggerSkunkworks.utilities.decorators import quietROOTFunc

class drawCICADAandAXOScatterPlotsTask(drawPlotTask):
    def __init__(
            self,
            taskName: str,
            dictOfFiles: dict,
            outputPath: Path = Path("/nfs_scratch/aloeliger/PaperPlotFiles/FinalizedPlots/CICADAandAXOScatterPlots"),
    ):
        super().__init__(taskName, dictOfFiles, outputPath)

    def drawPlots(self):
        ROOT.gStyle.SetOptStat(0)
        scatterFile = self.dictOfFiles["scatters"]
        theFile = ROOT.TFile(scatterFile)

        listOfKeys = list(theFile.GetListOfKeys())
        listOfKeys = [x.GetName() for x in listOfKeys]

        plots = {}
        for plotName in listOfKeys:
            plots[plotName] = theFile.Get(plotName)

        for plotName in plots:
            thePlot = plots[plotName].Clone()
            theCanvas = ROOT.TCanvas(
                f'{plotName}_canvas',
                f'{plotName}_canvas',
            )
            thePlot.Scale(1.0/thePlot.Integral())
            thePlot.Draw("COLZ")

            thePlot.GetXaxis().SetTitle("CICADA Score")
            thePlot.GetYaxis().SetTitle("AXOL1TL Score")
            
            cmsLatex = ROOT.TLatex()
            cmsLatex.SetTextSize(0.05)
            cmsLatex.SetNDC(True)
            cmsLatex.SetTextAlign(32)
            cmsLatex.DrawLatex(0.9,0.92, "#font[61]{CMS} #font[52]{Preliminary}")

            quietROOTFunc(theCanvas.SaveAs)(
                str(
                    self.outputPath/f"{plotName}.png"
                )
            )
            quietROOTFunc(theCanvas.SaveAs)(
                str(
                    self.outputPath/f"{plotName}.pdf"
                )
            )
