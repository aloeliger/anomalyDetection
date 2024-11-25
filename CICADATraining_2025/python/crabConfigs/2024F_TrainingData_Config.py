from CRABClient.UserUtilities import config
import os

config = config()

config.General.requestName = 'CICADATraining2025_2024F_11Nov2024'
config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADATraining_2025/python/trainingNtuples_cff.py'
config.JobType.pyCfgParams=['isData=True']
config.JobType.maxMemoryMB=4000

#config.Data.inputDataset='/ZeroBias/Run2024F-v1/RAW'
config.Data.inputDataset='/ZeroBias/Run2024F-PromptReco-v1/MINIAOD'
config.Data.secondaryInputDataset='/ZeroBias/Run2024F-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting='FileBased'
config.Data.unitsPerJob = 1
config.Data.runRange='382250,382258,382299,382313,382239,382343,382504,382568,382580,382594,382617,382626,382649,382654,382684'
config.Data.publication=False
config.Data.outputDatasetTag = 'CICADATraining2025_2024F_11Nov2024'

config.Site.storageSite = 'T2_US_Wisconsin'
