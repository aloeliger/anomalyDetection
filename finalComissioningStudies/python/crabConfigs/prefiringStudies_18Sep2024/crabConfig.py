from CRABClient.UserUtilities import config
import os
import datetime

config = config()

config.General.requestName = 'pileupStudies_18Sep2024'
config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/paperCode/python/makeCICADANtuplesFromRAW.py'
config.JobType.pyCfgParams=['isData=True']
config.JobType.maxMemoryMB=4000
config.JobType.inputFiles = [f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADA']

config.Data.inputDataset='/ZeroBias/Run2024G-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting='FileBased'
config.Data.unitsPerJob = 1
config.Data.runRange='385764'
config.Data.publication=False
config.Data.outputDatasetTag = 'pileupStudies_18Sep2024'

config.Site.storageSite = 'T2_US_Wisconsin'
