#!/usr/bin/env python3
from .sample import sample
import os

hdfsPath = "/hdfs/store/user/aloeliger/Ztoee_wminiCICADA/v_2/RunB/"

theFiles = []
chains = [
    'basicEventInfoAnalyzer/basicInfo',
    #'miniCICADAAnalyzer/miniCICADAScoreTree',
    'miniCICADAAnalyzerCICADAv1/miniCICADAScoreTree',
    'electronInformationAnalyzer/ElectronInformation'
]

for root, dirs, files in os.walk(hdfsPath, topdown=True):
    for name in files:
        theFiles.append(os.path.join(root, name))

RunBSample = sample(
    listOfFiles=theFiles,
    listOfChains=chains,
)