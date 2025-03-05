from CRABClient.UserUtilities import config
import os

config = config()

config.General.requestName = 'CICADATraining2025_2024I_4Mar2025'
config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADATraining_2025/python/trainingNtuples_cff.py'
config.JobType.pyCfgParams=['isData=True', 'includeNPVNtuplizer=True']
config.JobType.maxMemoryMB=4000

#config.Data.inputDataset='/ZeroBias/Run2024I-v1/RAW'
config.Data.inputDataset='/ZeroBias/Run2024I-PromptReco-v1/MINIAOD'
config.Data.secondaryInputDataset='/ZeroBias/Run2024I-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting='FileBased'
config.Data.unitsPerJob = 1
config.Data.runRange='386478,386509,386554,386594,386604,386618,386640,386661,386668,386673,386679,386694,386704,386852,386864,386873,386885,386917,386924,386945,386951'
config.Data.publication=False
config.Data.outputDatasetTag = 'CICADATraining2025_2024I_4Mar2025'

config.Site.storageSite = 'T2_US_Wisconsin'
