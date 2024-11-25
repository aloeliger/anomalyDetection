import ROOT
from rich.console import Console
import json
import numpy as np
from createSampleNPVFactors import makeChain

console = Console()

def normalDistribution(x, mu, sigma):
    return (1.0/ (np.sqrt(2.0*np.pi)*sigma)) * np.exp((-1.0*(x-mu)**2)/(2.0*sigma**2))

def deriveWeightForSample(theDF, sample, dataPU):
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
    npvMean = theDF.Mean('nPV')
    npvStd = theDF.StdDev('nPV')
    
    theHist = theHist.GetValue()
    npvMean = np.round(npvMean.GetValue())
    npvStd = npvStd.GetValue()

    console.log(f'NPV Mean: {npvMean}')
    console.log(f'NPV Std: {npvStd}')

    theCanvas = ROOT.TCanvas(f'{sample}_Canvas')
    theHist.Scale(1.0/theHist.Integral())
    theHist.Draw("HIST")
    theHist.SetLineColor(ROOT.kRed)
    theHist.SetLineWidth(2)
    theHist.GetXaxis().SetTitle("NPV")
    theHist.GetYaxis().SetTitle("Fraction")

    shiftedHistogram = ROOT.TH1D(
        'shifted_NPV_{sample};NPV;Fraction',
        'shifted_NPV_{sample};NPV;Fraction',
        100,
        0.0,
        100.0,
    )

    binShift = int(dataPU - npvMean)
    console.log(f'Bin shift: {binShift}')

    for i in range(100):
        oldHistoBin = i+1
        newBinLocation = oldHistoBin+binShift
        if newBinLocation <= 0 or newBinLocation >= 101:
            continue
        shiftedHistogram.SetBinContent(
            newBinLocation,
            theHist.GetBinContent(
                oldHistoBin
            )
        )
    shiftedHistogram.Draw("HIST SAME")
    shiftedHistogram.SetLineColor(ROOT.kBlue)
    shiftedHistogram.SetLineWidth(2)
    
    theCanvas.SaveAs(f'{sample}_NPVPlusShift.png')

    factorHist = shiftedHistogram.Clone()
    factorHist.SetNameTitle(f"{sample}_NPVPlusShift_Factors", f"{sample}_NPVPlusShift_Factors")
    factorHist.Divide(theHist)

    factorHist.Draw("HIST")
    factorHist.GetXaxis().SetTitle("NPV")
    factorHist.GetYaxis().SetTitle("Weight")

    theCanvas.SaveAs(f'{sample}_NPVPlusShift_Factors.png')

    factors = {}
    for i in range(100):
        binNumber = i+1
        factor = factorHist.GetBinContent(binNumber)
        factors[i] = factor
    return factors

def main():
    dataAveragePU = 57.0

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

        weights = deriveWeightForSample(theDF, sample, dataAveragePU)

        with open(f'{sample}_NPVPlusShift_Factors.json', 'w+') as theFile:
            json.dump(weights, theFile, indent=3)

    console.log('Done!')

if __name__ == '__main__':
    main()
