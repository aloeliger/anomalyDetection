# A quick utility for building samples and dataframes
import os
import ROOT

class Sample():
    def __init__(
            self,
            list_of_paths: list[str],
            list_of_trees: list[str],
            limit_files: int = None,
    ):
        self.list_of_paths = list_of_paths
        self.list_of_trees = list_of_trees
        self.limit_files = limit_files
        chain, df, nFiles = Sample.build_sample(
            list_of_paths,
            list_of_trees,
            limit_files,
        )

        self.df = df
        self.chain = chain
        self.nFiles = nFiles
    
    @staticmethod
    def build_sample(list_of_paths: list[str], list_of_trees: list[str], limit_files: int = None):
        assert(len(list_of_trees) >= 1), "sample requires at least one tree!"
        assert(len(list_of_paths) >= 1), "sample requires at least one path!"
        list_of_chains = [
            ROOT.TChain(tree) for tree in list_of_trees
        ]
        nFiles = 0
        for path in list_of_paths:
            for root, dirs, files in os.walk(path):
                for fileName in files:
                    theFile = f'{root}/{fileName}'
                    if limit_files is not None and nFiles >= limit_files:
                        break
                    nFiles += 1
                    for chain in list_of_chains:
                        chain.Add(theFile)
                if limit_files is not None and nFiles >= limit_files:
                    break
        primary_chain = list_of_chains[0]
        remainder = list_of_chains[1:]
        if remainder != []:
            for chain in remainder:
                primary_chain.AddFriend(chain)
        dataframe = ROOT.RDataFrame(primary_chain)
        return primary_chain, dataframe, nFiles

def construct_data_samples(limit_files=None):
    data_paths = {
        # 'RunC': ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024'],
        # 'RunD': ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024'],
        # 'RunE': ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024'],
        # 'RunG': ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024'],
        # 'RunH': ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024'],
        # 'RunH': ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024'],
        # 'Data': [
        #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024',
        #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024',
        #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024',
        #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024',
        #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024',
        #     '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024',
        # ],
        'RunI': ['/hdfs/store/user/aloelige/ZeroBias/AnomalyDetectionPaper2025_ZeroBias_Run2024I_20Mar2025/'],
        'RunI_SpecificRuns': ['/hdfs/store/user/aloelige/ZeroBias/AnomalyDetectionPaper2025_ZeroBias_Run2024I_SpecificRuns_20Mar2025'],
        'Data': [
            '/hdfs/store/user/aloelige/ZeroBias/AnomalyDetectionPaper2025_ZeroBias_Run2024I_20Mar2025/',
        ]
    }

    data_trees = [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        #'l1UpgradeTree/L1UpgradeTree',
        'l1UpgradeEmuTree/L1UpgradeTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits',
        'CICADAv2p1p2Ntuplizer/L1TCaloSummaryOutput',
        'CICADAv2p2p0Ntuplizer/L1TCaloSummaryOutput',
        'axol1tlScoreNtuplizerv3/AXOL1TLScoreTree',
        'axol1tlScoreNtuplizerv4/AXOL1TLScoreTree',
        'simpleSumNtuplizer/simpleEtSums',
    ]

    sample_collection = {}

    for sample in data_paths:
        sample_collection[sample] = Sample(
            data_paths[sample],
            data_trees,
            limit_files,
        )

    return sample_collection

def construct_mc_samples(limit_files=None):
    mc_paths = {
        'SingleNeutrino': ['/hdfs/store/user/aloelige/SingleNeutrino_E-10-gun/AnomalyDetectionPaper2025_SingleNeutrino_Winter24_28Mar2025/'],
        
    }
    mc_trees = [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        #'l1UpgradeTree/L1UpgradeTree',
        'l1UpgradeEmuTree/L1UpgradeTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits',
        'CICADAv2p1p2Ntuplizer/L1TCaloSummaryOutput',
        'CICADAv2p2p0Ntuplizer/L1TCaloSummaryOutput',
        'axol1tlScoreNtuplizerv3/AXOL1TLScoreTree',
        'axol1tlScoreNtuplizerv4/AXOL1TLScoreTree',
        'axol1tlScoreNtuplizerv5/AXOL1TLScoreTree',
        'simpleSumNtuplizer/simpleEtSums',
    ]

    sample_collection={}
    for sample in mc_paths:
        sample_collection[sample] = Sample(
            mc_paths[sample],
            mc_trees,
            limit_files
        )
    return sample_collection
