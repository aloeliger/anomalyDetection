from CRABClient.UserUtilities import config
import os

config = config()

config.General.requestName = 'CICADATraining2025_2024E_11Nov2024'
config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADATraining_2025/python/trainingNtuples_cff.py'
config.JobType.pyCfgParams=['isData=True']
config.JobType.maxMemoryMB=4000

#config.Data.inputDataset='/ZeroBias/Run2024E-v1/RAW'
config.Data.inputDataset='/ZeroBias/Run2024E-PromptReco-v1/MINIAOD'
config.Data.secondaryInputDataset='/ZeroBias/Run2024E-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting='FileBased'
config.Data.unitsPerJob = 1
config.Data.runRange='381022,381065,381075,381115,381151,381164,381190,381199,381212,381218,381286,381309,381365,381380,381417,381443,381480,381484,381499,381516'
config.Data.publication=False
config.Data.outputDatasetTag = 'CICADATraining2025_2024E_11Nov2024'

config.Site.storageSite = 'T2_US_Wisconsin'
