import os
import ROOT

class Sample():
    def __init__(
            self,
            list_of_paths: list[str],
            list_of_trees: list[str],
            limit_files: int = None,
            modulus_acceptance: int = None,
    ):
        self.list_of_paths = list_of_paths
        self.list_of_trees = list_of_trees
        self.limit_files = limit_files
        self.modulus_acceptence = modulus_acceptance
        chain, df, nFiles = Sample.build_sample(
            list_of_paths,
            list_of_trees,
            limit_files,
            modulus_acceptance
        )

        self.df = df
        self.chain = chain
        self.nFiles = nFiles

    @staticmethod
    def build_sample(list_of_paths: list[str], list_of_trees: list[str], limit_files: int = None, modulus_acceptance: int = None):
        assert(len(list_of_trees) >= 1), "sample requires at least one tree!"
        assert(len(list_of_paths) >= 1), "sample requires at least one path!"
        list_of_chains = [
            ROOT.TChain(tree) for tree in list_of_trees
        ]
        nConsideredFiles = 0
        nFiles = 0
        for path in list_of_paths:
            for root, dirs, files in os.walk(path):
                for fileName in files:
                    theFile = f'{root}/{fileName}'
                    if limit_files is not None and nFiles >= limit_files:
                        break
                    nConsideredFiles += 1
                    if modulus_acceptance is not None and nConsideredFiles % modulus_acceptance != 0:
                        continue
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

    

class GroupedSample():
    def __init__(
            self,
            name: str,
            nGroups: int,
            list_of_paths: list[str],
            list_of_trees: list[str],
    ):
        self.name = name
        self.nGroups = nGroups
        
        self.list_of_paths = list_of_paths
        self.list_of_trees = list_of_trees

        self.list_of_files = self.list_files(self.list_of_paths)
        self.nFiles = len(self.list_of_files)

        self.grouped_files = self.group_files(self.list_of_files, self.nGroups)
        self.grouped_dfs, self.grouped_chains = self.create_group_data()
        
    def list_files(self, list_of_paths):
        list_of_files = []
        for path in list_of_paths:
            for root, dirs, files in os.walk(path):
                for file_name in files:
                    theFile = f'{root}/{file_name}'
                    list_of_files.append(theFile)
        return list_of_files

    def group_files(self, list_of_files, nGroups):
        overall_list = []
        for i in range(nGroups):
            overall_list.append([])
        for index, file_name in enumerate(list_of_files):
            group_num = index % nGroups
            overall_list[group_num].append(file_name)
        #Let's go through the overall list and remove anything that is an
        #empty list
        for i in range(overall_list.count([])):
            overall_list.remove([])
        return overall_list
        
    def create_group_data(self):
        grouped_chains = []
        grouped_dfs = []
        for i in range(len(self.grouped_files)):
            list_of_chains = [ROOT.TChain(tree) for tree in self.list_of_trees]
            for file_name in self.grouped_files[i]:
                for chain in list_of_chains:
                    chain.Add(file_name)
            primary_chain = list_of_chains[0]
            remainder = list_of_chains[1:]
            if remainder != []:
                for chain in remainder:
                    primary_chain.AddFriend(chain)
            grouped_chains.append(primary_chain)
            grouped_dfs.append(ROOT.RDataFrame(primary_chain))
        
        return grouped_dfs, grouped_chains        
