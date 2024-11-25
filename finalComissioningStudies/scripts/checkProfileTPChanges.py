import ROOT
from rich.console import Console
from rich.progress import track
from rich.table import Table
import os
from checkTPBeforeAndAfter import makeChainFromDict
import json

console = Console()

def makeTPPlot(theChain, identifier):
    nEntries = theChain.GetEntries()

    theDataframe = ROOT.RDataFrame(theChain)

    theHistogram = theDataframe.Histo1D(
        (
            f'{identifier}_TPETs;iEta;Average TP ET',
            f'{identifier}_TPETs;iEta;Average TP ET',
            57,
            -28.0,
            29.0,
        ),
        "trigPrimIEta",
        'trigPrimET'
    )

    the2DHistogram = theDataframe.Histo2D(
        (
            f'{identifier}_2D_TPETs;iEta;iPhi',
            f'{identifier}_2D_TPETs;iEta;iPhi',
            57,
            -28.0,
            29.0,
            72,
            1.0,
            73.0,
        ),
        "trigPrimIEta",
        "trigPrimIPhi",
        "trigPrimET",
    )
    
    for i in range(57):
        theHistogram.SetBinContent(
            i+1,
            theHistogram.GetBinContent(i+1) / nEntries * 72 #should be 72 iEta entries per event
        )

    the2DHistogram.Scale(1.0/nEntries)
    return theHistogram, the2DHistogram
    
def makeCICADARegionPlot(theChain, identifier):
    nEntries = theChain.GetEntries()

    theHistogram = ROOT.TH1D(
        f'{identifier}_CICADARegions;iEta;Average Region ET',
        f'{identifier}_CICADARegions;iEta;Average Region ET',
        14,
        0.0,
        14.0
    )

    the2DHistogram = ROOT.TH2D(
        f'{identifier}_CICADARegions_2D;iEta;iPhi',
        f'{identifier}_CICADARegions_2D;iEta;iPhi',
        14,
        0.0,
        14.0,
        18,
        0.0,
        18.0,
    )

    binNormalizations = {}

    for entry in track(range(nEntries), description=f'{identifier} Regions'):
        theChain.GetEntry(entry)

        for i in range(18):
            for j in range(14):
                RegionET = theChain.modelInput[i*14 + j]
                theHistogram.Fill(j, RegionET)

                the2DHistogram.Fill(j, i, RegionET)
                
                if j not in binNormalizations:
                    binNormalizations[j] = 0
                binNormalizations[j] += 1
    for i in range(14):
        theHistogram.SetBinContent(
            i+1,
            theHistogram.GetBinContent(i+1) / binNormalizations[i]
        )

    the2DHistogram.Scale(1.0/nEntries)
        
    return theHistogram, the2DHistogram
                
def makeRatioInfoDump(theHistogram, identifier):
    nBins = theHistogram.GetNbinsX()

    factors = {}
    for i in range(1,nBins+1):
        theFactor = theHistogram.GetBinContent(i)
        binValue = theHistogram.GetXaxis().GetBinLowEdge(i)
        factors[binValue] = theFactor

    infoTable = Table(title="Factors")
    infoTable.add_column("Eta")
    infoTable.add_column("Factor")

    for key in factors:
        infoTable.add_row(f'{key}', f'{factors[key]:1.3f}')
    console.print(infoTable)

    with open(f'{identifier}_factors.json', 'w') as theFile:
        json.dump(factors, theFile)

def make2DRatioInfoDump(theHistogram, identifier):
    nBinsX = theHistogram.GetNbinsX()
    nBinsY = theHistogram.GetNbinsY()

    factors = {}
    for i in range(1, nBinsX+1):
        iEta = i
        if iEta not in factors:
            factors[iEta] = {}
        for j in range(1, nBinsY+1):
            iPhi = j
            theFactor = theHistogram.GetBinContent(i, j)
            if iPhi not in factors[iEta]:
                factors[iEta][iPhi] = theFactor
    infoTable = Table(title='2D Factors')
    infoTable.add_column("iEta")
    infoTable.add_column('iPhi')
    infoTable.add_column('Factor')

    for iEta in factors:
        for iPhi in factors[iEta]:
            infoTable.add_row(f'{iEta}', f'{iPhi}', f'{factors[iEta][iPhi]}')
    console.print(infoTable)

    with open(f'{identifier}_2D_factors.json', 'w') as theFile:
        json.dump(factors, theFile)

def main():
    ROOT.gStyle.SetOptStat(0)
    beforeRuns = {
        '386640': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386640',
        '386661': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386661',
        '386668': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386668',
    }
    # afterRuns = {
    #     '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386673',
    #     '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386679',
    #     '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386694',
    # }

    #beforeRuns = {
    #    '386673': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386673',
    #    '386679': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386679',
    #    '386694': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386694',
    #}

    afterRuns = {
        '386945': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386945/',
        '386951': '/hdfs/store/user/aloeliger/rateJumpSubmission_TPGs/Run386951/'
    }

    beforeECALChain, beforeHCALChain, beforeCICADAChain = makeChainFromDict(beforeRuns)
    afterECALChain, afterHCALChain, afterCICADAChain = makeChainFromDict(afterRuns)

    beforeHCALHisto, before2DHCALHisto = makeTPPlot(beforeHCALChain, 'HCAL_Before')
    afterHCALHisto, after2DHCALHisto = makeTPPlot(afterHCALChain, 'HCAL_After')

    #Draw 1D Plots and Ratios
    
    theCanvas = ROOT.TCanvas(f'HCAL Ratio')
    beforeHCALHisto.Draw("HIST")
    theCanvas.SaveAs("HCAL_TP_IEta_Before.png")

    afterHCALHisto.Draw("HIST")
    theCanvas.SaveAs("HCAL_TP_IEta_After.png")

    HCALRatio = afterHCALHisto.Clone()
    HCALRatio.SetTitle("HCAL After/Before")
    HCALRatio.Divide(beforeHCALHisto.GetValue())
    HCALRatio.Draw("HIST")
    HCALRatio.GetYaxis().SetRangeUser(1.0, 1.15)
    theCanvas.SaveAs("HCAL_TP_IEta_Ratio.png")

    # Draw 2D Plots and Ratios

    before2DHCALHisto.Draw("COLZ")
    theCanvas.SaveAs("HCAL_TP_2D_Before.png")

    after2DHCALHisto.Draw("COLZ")
    theCanvas.SaveAs("HCAL_TP_2D_After.png")

    HCAL_2D_Ratio = after2DHCALHisto.Clone()
    HCAL_2D_Ratio.SetTitle("HCAL After/Before")
    HCAL_2D_Ratio.Divide(before2DHCALHisto.GetValue())
    HCAL_2D_Ratio.Draw("COLZ")
    theCanvas.SaveAs("HCAL_TP_2D_Ratio.png")

    #Dump out factors for 1 and 2D shifts

    makeRatioInfoDump(HCALRatio, 'HCAL')

    make2DRatioInfoDump(HCAL_2D_Ratio, 'HCAL')
    
    beforeECALHisto, before2DECALHisto = makeTPPlot(beforeECALChain, 'ECAL_Before')
    afterECALHisto, after2DECALHisto = makeTPPlot(afterECALChain, 'ECAL_After')

    # Draw 1D Plots and ratios
    
    theCanvas = ROOT.TCanvas(f'ECAL Ratio')
    beforeECALHisto.Draw("HIST")
    theCanvas.SaveAs("ECAL_TP_IEta_Before.png")

    afterECALHisto.Draw("HIST")
    theCanvas.SaveAs("ECAL_TP_IEta_After.png")

    ECALRatio = afterECALHisto.Clone()
    ECALRatio.SetTitle("ECAL After/Before")
    ECALRatio.Divide(beforeECALHisto.GetValue())
    ECALRatio.Draw("HIST")
    ECALRatio.GetYaxis().SetRangeUser(1.0, 1.15)
    theCanvas.SaveAs("ECAL_TP_IEta_Ratio.png")

    # Draw 2D Plots and Ratios
    before2DECALHisto.Draw("COLZ")
    theCanvas.SaveAs("ECAL_TP_2D_Before.png")

    after2DECALHisto.Draw("COLZ")
    theCanvas.SaveAs("HCAL_TP_2D_After.png")

    ECAL_2D_Ratio = after2DECALHisto.Clone()
    ECAL_2D_Ratio.SetTitle("ECAL After/Before")
    ECAL_2D_Ratio.Divide(before2DECALHisto.GetValue())
    ECAL_2D_Ratio.Draw("COLZ")
    theCanvas.SaveAs("ECAL_TP_2D_Ratio.png")
    
    # Dump out factors for 1 and 2D shifts
    
    makeRatioInfoDump(ECALRatio, 'ECAL')

    make2DRatioInfoDump(ECAL_2D_Ratio, 'ECAL')

    beforeCICADAHisto, before2DCICADAHisto = makeCICADARegionPlot(beforeCICADAChain, 'Before_CICADA')
    afterCICADAHisto, after2DCICADAHisto = makeCICADARegionPlot(afterCICADAChain, 'After_CICADA')

    # Draw 1D Plots and Ratios
    
    theCanvas = ROOT.TCanvas("CICADA Ratio")
    beforeCICADAHisto.Draw("HIST")
    theCanvas.SaveAs("CICADA_Region_IEta_Before.png")

    afterCICADAHisto.Draw("HIST")
    theCanvas.SaveAs("CICADA_Region_IEta_After.png")

    CICADARatio = afterCICADAHisto.Clone()
    CICADARatio.SetTitle("CICADA After/Before")
    CICADARatio.Divide(beforeCICADAHisto)
    CICADARatio.Draw("HIST")
    CICADARatio.GetYaxis().SetRangeUser(0.85, 1.15)
    theCanvas.SaveAs("CICADA_REgion_IEta_Ratio.png")

    # Draw 2D Plots and ratios

    before2DCICADAHisto.Draw("COLZ")
    theCanvas.SaveAs("CICADA_2D_Before.png")

    after2DCICADAHisto.Draw("COLZ")
    theCanvas.SaveAs("CICADA_2D_After.png")

    CICADA_2D_Ratio = after2DCICADAHisto.Clone()
    CICADA_2D_Ratio.SetTitle("CICADA After/Before")
    CICADA_2D_Ratio.Divide(before2DCICADAHisto)
    CICADA_2D_Ratio.Draw("COLZ")
    theCanvas.SaveAs("CICADA_2D_Ratio.png")

    # Dump out factors for 1 and 2D shifts
    
    makeRatioInfoDump(CICADARatio, 'CICADARegions')

    make2DRatioInfoDump(CICADA_2D_Ratio, 'CICADARegions')

if __name__ == '__main__':
    main()
