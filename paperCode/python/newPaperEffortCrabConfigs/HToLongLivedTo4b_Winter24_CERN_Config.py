from CRABClient.UserUtilities import config
import os
import datetime

today = datetime.date.today().strftime('%d%b%Y')
cmssw_base = os.getenv('CMSSW_BASE')

config = config()

config.General.requestName = f'AnomalyDetectionPaper2025_HToLongLived4b_Winter24_CERN_{today}'

config.General.workArea = './crab'
config.General.transferOutputs = True

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = f'{cmssw_base}/src/anomalyDetection/paperCode/python/makeCICADANtuplesFromRAW.py'
config.JobType.pyCfgParams=['useNPVNtuplizer=True', 'includeRecoObjects=True']
config.JobType.inputFiles=[f'{cmssw_base}/src/anomalyDetection/CICADA']
config.JobType.maxMemoryMB=4000

#config.Data.inputDataset='/SingleNeutrino_E-10-gun/Run3Winter24MiniAOD-133X_mcRun3_2024_realistic_v9-v3/MINIAODSIM'
#config.Data.secondaryInputDataset='/SingleNeutrino_E-10-gun/Run3Winter24Digi-133X_mcRun3_2024_realistic_v9-v3/GEN-SIM-RAW'
config.Data.inputDataset='/HTo2LongLivedTo4b_MH-125_MFF-12_CTau-900mm_TuneCP5_13p6TeV_pythia8/Run3Winter24MiniAOD-133X_mcRun3_2024_realistic_v8-v2/MINIAODSIM'
config.Data.secondaryInputDataset='/HTo2LongLivedTo4b_MH-125_MFF-12_CTau-900mm_TuneCP5_13p6TeV_pythia8/Run3Winter24Digi-133X_mcRun3_2024_realistic_v8-v2/GEN-SIM-RAW'
config.Data.inputDBS = 'global'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 1
config.Data.publication = False
config.Data.outputDatasetTag = f'AnomalyDetectionPaper2025_HToLongLivedTo4b_Winter24_CERN_{today}'
config.Data.outLFNDirBase = '/store/group/phys_exotica/axol1tl/CICADANtuples'

config.Site.storageSite = 'T2_CH_CERN'
