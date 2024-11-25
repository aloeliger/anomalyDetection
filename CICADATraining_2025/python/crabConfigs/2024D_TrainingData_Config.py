from CRABClient.UserUtilities import config
import os

config = config()

config.General.requestName = 'CICADATraining2025_2024D_11Nov2024'
config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADATraining_2025/python/trainingNtuples_cff.py'
config.JobType.pyCfgParams=['isData=True']
config.JobType.maxMemoryMB=4000

#config.Data.inputDataset='/ZeroBias/Run2024D-v1/RAW'
config.Data.inputDataset='/ZeroBias/Run2024D-PromptReco-v1/MINIAOD'
config.Data.secondaryInputDataset='/ZeroBias/Run2024D-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting='FileBased'
config.Data.unitsPerJob = 1
config.Data.runRange='380310,380346,380360,380377,380385,380399,380446,380470,380481,380513,380564,380624,380649'
config.Data.publication=False
config.Data.outputDatasetTag = 'CICADATraining2025_2024D_11Nov2024'

config.Site.storageSite = 'T2_US_Wisconsin'
