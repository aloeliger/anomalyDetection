from anomalyDetection.paperCode.plottingCore.plotTask import createPlotTask

import ROOT
from anomalyDetection.paperCode.plottingUtilities.models import *
from pathlib import Path
from anomalyDetection.paperCode.plottingUtilities.rateTables import rateTableHelper

class createCICADAStabilityPlotTask(createPlotTask):
    def __init__(
            self,
            taskName:str,
            outputFileName: str,
            dictOfSamples: dict,
            outputPath: Path = Path("/nfs_scratch/aloeliger/PaperPlotFiles/PlotFiles/")
    ):
        super().__init__(
            taskName,
            outputFileName,
            dictOfSamples,
            outputPath,
        )

        self.rateTables = rateTableHelper()

    def makeTrainTestDataframes(self, zeroBiasSample):
        zeroBiasDataframe = zeroBiasSample.getNewDataframe()
        evenLumiZBDataframe = zeroBiasDataframe.Filter('lumi % 2 == 0')
        oddLumiZBDataframe = zeroBiasDataframe.Filter('lumi % 2 == 1')
        
        return evenLumiZBDataframe, oddLumiZBDataframe


    def makeStabilityPlots(self, dataframe, threshold, score):
        #print(score)
        #print(threshold)
        thresholdDF = dataframe.Filter(f'{score} >= {threshold}')

        maxLumi = dataframe.Max('lumi')
        minLumi = dataframe.Min('lumi')

        maxLumi = maxLumi.GetValue()
        minLumi = minLumi.GetValue()

        nLumis = maxLumi - minLumi

        dummyTotalModel = ROOT.RDF.TH1DModel(
            f'{score}_xxx_totalEvents',
            f'{score}_xxx_totalEvents',
            int(nLumis),
            float(minLumi),
            float(maxLumi),
        )
        dummyThresholdModel = ROOT.RDF.TH1DModel(
            f'{score}_xxx_aboveThresholdEvents',
            f'{score}_xxx_aboveThresholdEvents',
            int(nLumis),
            float(minLumi),
            float(maxLumi),
        )

        returnPlots = [
            dataframe.Histo1D(
                dummyTotalModel,
                'lumi',
            ),
            thresholdDF.Histo1D(
                dummyThresholdModel,
                'lumi',
            )
        ]

        return returnPlots
    
    def createPlots(self):
        cicadaScoreGroups = [
            CICADA_vXp2p0_Group,
            CICADA_vXp2p0N_Group,
            CICADA_vXp2p1_Group,
            CICADA_vXp2p1N_Group,
            CICADA_vXp2p2_Group,
            CICADA_vXp2p2N_Group,
        ]
        scoreNames = getAllScoreNames(cicadaScoreGroups)
        scoreNames.append("CICADA_v2p1p2")

        evenLumiZBDataframe, oddLumiZBDataframe = self.makeTrainTestDataframes(self.dictOfSamples['ZeroBias'])
        for group in cicadaScoreGroups:
            evenLumiZBDataframe = group.applyFrameDefinitions(evenLumiZBDataframe)
            oddLumiZBDataframe = group.applyFrameDefinitions(oddLumiZBDataframe)

        for scoreName in scoreNames:
            #Let's get an approximate 5 kHz threshold
            threshold = self.rateTables.getThresholdForRate(scoreName, 5.0)[0]
            self.plotsToBeWritten += self.makeStabilityPlots(
                oddLumiZBDataframe,
                scoreName,
                threshold,
            )
        
