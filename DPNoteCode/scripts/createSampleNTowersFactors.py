import ROOT
from rich.console import Console
import json
import os

console = Console()

def makeChain(listOfDirs):
    theChain = ROOT.TChain('l1UpgradeTree/L1UpgradeTree')
    for directory in listOfDirs:
        for root, dirs, files in os.walk(directory):
            for fileName in files:
                theChain.Add(f'{root}/{fileName}')
    return theChain

def makeNTowersVariable(theDataframe):
    nTowersFunction = """
    try {
    for (int i = 0; i < sumType.size(); ++i) {
       if (sumType.at(i) == 21 and sumBx.at(i) == 0) {
          return (double) sumIEt.at(i);
       }
    }
    return -999.0;
    }
    catch (const std::runtime_error& e) {
           return -2000.0;
    }
    """

    towerDF = theDataframe.Define(
        'NTowers',
        nTowersFunction
    )

    return towerDF;

def makeNTowersPlot(dataframe, identifier):
    nEntries = dataframe.Count().GetValue()

    console.log(f'# Data Entries: {nEntries}')
    
    towersHist = dataframe.Histo1D(
        (
            f'NTowers_{identifier}',
            f'NTowers_{identifier}',
            200,
            0.0,
            4000.0,
        ),
        'NTowers'
    )
    nTowersMean = dataframe.Mean("NTowers")
    nTowersStd = dataframe.StdDev("NTowers")

    towersHist = towersHist.GetValue()
    nTowersMean = nTowersMean.GetValue()
    nTowersStd = nTowersStd.GetValue()

    console.log(f'Average # of Towers: {nTowersMean}')
    console.log(f'# of Towers std: {nTowersStd}')

    towersHist.Scale(1.0/towersHist.Integral())

    theCanvas = ROOT.TCanvas(f'{identifier}_Canvas')

    towersHist.Draw("HIST")
    towersHist.SetLineColor(ROOT.kRed)
    towersHist.SetLineWidth(2)
    towersHist.GetXaxis().SetTitle("Towers")
    towersHist.GetYaxis().SetTitle("Fraction")

    theCanvas.SaveAs(f'{identifier}_Towers.png')

    return towersHist

def main():
    # dataDirectories = [
    #     '/hdfs/store/user/aloeliger/L1Ntuples_EZB0_RunC_2023_27Jul2023_0918',
    #     '/hdfs/store/user/aloeliger/L1Ntuples_ZB_RunB_2023_27Jul2023_0946',
    #     '/hdfs/store/user/aloeliger/L1Ntuples_ZB_RunC_2023_27Jul2023_0947',
    #     '/hdfs/store/user/aloeliger/L1Ntuples_ZB_RunD_2023_27Jul2023_0947',
    # ]
    dataDirectories = [
        '/hdfs/store/user/aloelige/ZeroBias/Paper_Ntuples_27Mar2024/'
    ]

    dataChain = makeChain(dataDirectories)
    data_df = ROOT.RDataFrame(dataChain)

    data_df = makeNTowersVariable(data_df)

    data_towers = makeNTowersPlot(data_df, 'Data')

    mc_samples = {
        'HtoLongLived': ['/hdfs/store/user/aloeliger/L1Ntuples_HToLongLived_2023_27Jul2023_0949/'],
        'SUEP': ['/hdfs/store/user/aloeliger/L1Ntuples_SUEP_2023_28Jul2023_1034'],
        'SUSYGGBBH': ['/hdfs/store/user/aloeliger/L1Ntuples_SUSYGGBBH_2023_27Jul2023_0949'],
        'TT': ['/hdfs/store/user/aloeliger/L1Ntuples_TT_2023_27Jul2023_0950'],
        'VBFHto2C': ['/hdfs/store/user/aloeliger/L1Ntuples_VBFHto2C_2023_27Jul2023_0950'],
    }

    for sample in mc_samples:
        console.log(sample)
        theChain = makeChain(mc_samples[sample])
        theDF = ROOT.RDataFrame(theChain)
        theDF = makeNTowersVariable(theDF)

        sample_towers = makeNTowersPlot(theDF, sample)

        theCanvas = ROOT.TCanvas(f'{sample}_factors_canvas')

        factors_histo = data_towers.Clone()
        factors_histo.SetNameTitle(f'{sample}_factors',f'{sample}_factors')
        factors_histo.Divide(sample_towers)
        factors_histo.Draw("HIST")
        factors_histo.SetLineColor(ROOT.kRed)
        factors_histo.SetLineWidth(2)
        factors_histo.GetXaxis().SetTitle("nTowers")
        factors_histo.GetYaxis().SetTitle("Scale Factor")

        theCanvas.SaveAs(f'{sample}_Factors_Towers.png')

        factors = {}

        for nBin in range(200):
            binNumber = nBin+1
            lowerTowers = nBin * (4000/200)
            upperTower = (nBin+1) * (400/200)

            factor = factors_histo.GetBinContent(binNumber)
            factors[lowerTowers] = factor

        with open(f'{sample}_Towers_PU_Factors.json', 'w+') as theFile:
            json.dump(factors, theFile)
    console.log("Done!")

if __name__ == '__main__':
    main()
