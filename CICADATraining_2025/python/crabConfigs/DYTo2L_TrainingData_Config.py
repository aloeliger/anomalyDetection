from CRABClient.UserUtilities import config
import os

config = config()

config.General.requestName = 'CICADATraining2025_DYTo2L_Run3Winter24_10Jan2025'
config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADATraining_2025/python/trainingNtuples_cff.py'
#config.JobType.pyCfgParams=['isData=True']
config.JobType.maxMemoryMB=4000

#config.Data.inputDataset='/ZeroBias/Run2024C-v1/RAW'
config.Data.inputDataset='/DYTo2L_MLL-50_TuneCP5_13p6TeV_pythia8/Run3Winter24Digi-KeepSi_133X_mcRun3_2024_realistic_v8-v2/GEN-SIM-RAW'
#config.Data.secondaryInputDataset='/ZeroBias/Run2024C-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting='FileBased'
config.Data.unitsPerJob = 1
#config.Data.runRange='379416,379420,379425,379442,379456,379470,379530,379617,379660,379729,379765,379866,380001,380005,380030,380043,380043,380049,380066,380074'
config.Data.publication=False
config.Data.outputDatasetTag = 'CICADATraining2025_DYTo2L_Run3Winter24_10Jan2025'

config.Site.storageSite = 'T2_US_Wisconsin'
