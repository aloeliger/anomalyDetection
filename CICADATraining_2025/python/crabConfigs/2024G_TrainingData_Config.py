from CRABClient.UserUtilities import config
import os

config = config()

config.General.requestName = 'CICADATraining2025_2024G_11Nov2024'
config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADATraining_2025/python/trainingNtuples_cff.py'
config.JobType.pyCfgParams=['isData=True']
config.JobType.maxMemoryMB=4000

#config.Data.inputDataset='/ZeroBias/Run2024G-v1/RAW'
config.Data.inputDataset='/ZeroBias/Run2024G-PromptReco-v1/MINIAOD'
config.Data.secondaryInputDataset='/ZeroBias/Run2024G-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting='FileBased'
config.Data.unitsPerJob = 1
config.Data.runRange='383814,383907,384014,384069,384202,384264,383832,383948,384029,3844128,384209,384291,383854,383996,384052,384188,384239,384322'
config.Data.publication=False
config.Data.outputDatasetTag = 'CICADATraining2025_2024G_11Nov2024'

config.Site.storageSite = 'T2_US_Wisconsin'
