import FWCore.ParameterSet.Config as cms

from Configuration.Eras.Era_Run3_2024_cff import Run3_2024

import FWCore.ParameterSet.VarParsing as VarParsing
options = VarParsing.VarParsing('ANALYSIS')
options.register(
    'isData',
    False,
    VarParsing.VarParsing.multiplicity.singleton,
    VarParsing.VarParsing.varType.bool,
    "Use data configuration options or not",
)
options.register(
    'secondaryFiles',
    [],
    VarParsing.VarParsing.multiplicity.list,
    VarParsing.VarParsing.varType.string
)
options.parseArguments()

process = cms.Process("NTUPLIZE",Run3_2024)
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
process.load('Configuration.StandardSequences.MagneticField_cff')
process.load('Configuration.StandardSequences.RawToDigi_Data_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(options.maxEvents)
)

process.MessageLogger.cerr.FwkReport.reportEvery = 10000

# Included in previous configurations to attempt to get rid of some warnings.
process.MessageLogger.suppressWarning = cms.untracked.vstring(
    'l1UpgradeTree',
    'l1UpgradeEmuTree',
    'l1UpgradeTfMuonShowerTree',
    'l1AXOEmuTree',
    'emtfStage2Digis', 
    'l1uGTTestcrateTree', 
    'simDtTriggerPrimitiveDigis'
)

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(options.inputFiles),
                            secondaryFileNames = cms.untracked.vstring(options.secondaryFiles),
)


process.options = cms.untracked.PSet(
    # FailPath = cms.untracked.vstring(),
    IgnoreCompletely = cms.untracked.vstring(),
    Rethrow = cms.untracked.vstring(),
    # SkipEvent = cms.untracked.vstring(),
    allowUnscheduled = cms.obsolete.untracked.bool,
    canDeleteEarly = cms.untracked.vstring(),
    deleteNonConsumedUnscheduledModules = cms.untracked.bool(True),
    dumpOptions = cms.untracked.bool(False),
    emptyRunLumiMode = cms.obsolete.untracked.string,
    eventSetup = cms.untracked.PSet(
        forceNumberOfConcurrentIOVs = cms.untracked.PSet(
            allowAnyLabel_=cms.required.untracked.uint32
        ),
        numberOfConcurrentIOVs = cms.untracked.uint32(0)
    ),
    fileMode = cms.untracked.string('FULLMERGE'),
    forceEventSetupCacheClearOnNewRun = cms.untracked.bool(False),
    makeTriggerResults = cms.obsolete.untracked.bool,
    numberOfConcurrentLuminosityBlocks = cms.untracked.uint32(0),
    numberOfConcurrentRuns = cms.untracked.uint32(1),
    numberOfStreams = cms.untracked.uint32(0),
    numberOfThreads = cms.untracked.uint32(1),
    printDependencies = cms.untracked.bool(False),
    sizeOfStackForThreadsInKB = cms.optional.untracked.uint32,
    throwIfIllegalParameter = cms.untracked.bool(True),
    wantSummary = cms.untracked.bool(False)
)

from Configuration.AlCa.GlobalTag import GlobalTag
if options.isData:
    print("Treating config as data.")
    process.GlobalTag = GlobalTag(process.GlobalTag, '140X_dataRun3_Prompt_v4', '')
else:
    print("Treating config as simulation.")
    process.GlobalTag = GlobalTag(process.GlobalTag, '140X_mcRun3_2023_realistic_postBPix_v2', '')

process.raw2digi_step = cms.Path(process.RawToDigi)
process.endjob_step = cms.EndPath(process.endOfProcess)

process.schedule = cms.Schedule(process.raw2digi_step, process.endjob_step)
from PhysicsTools.PatAlgos.tools.helpers import associatePatAlgosToolsTask
associatePatAlgosToolsTask(process)

from L1Trigger.Configuration.customiseReEmul import L1TReEmulFromRAW
process = L1TReEmulFromRAW(process)

from L1Trigger.L1TNtuples.customiseL1Ntuple import L1NtupleRAWEMU
process = L1NtupleRAWEMU(process)

process.load("anomalyDetection.paperCode.CICADAInputNtuplizer_cfi")

process.load('anomalyDetection.anomalyTriggerSkunkworks.L1TTriggerBitsNtuplizer_cfi')

process.load('anomalyDetection.anomalyTriggerSkunkworks.unpackedScoreNtuplizer_cfi')
process.load('anomalyDetection.anomalyTriggerSkunkworks.unprefirableInformationNtuplizer_cfi')
process.load('anomalyDetection.anomalyTriggerSkunkworks.ECALTrigPrimAnalyzer_cfi')
process.load('anomalyDetection.anomalyTriggerSkunkworks.HCALTrigPrimAnalyzer_cfi')
process.load('anomalyDetection.DPNoteCode.npvNtuplizer_cfi')

process.NtuplePath = cms.Path(
    process.L1TTriggerBitsNtuplizer +
    process.CICADAInputNtuplizer +
    process.npvNtuplizer
    #process.unpackedCICADAScoreNtuplizer +
    #process.unprefirableInformationNtuplizer +
    #process.ECALTrigPrimAnalyzer +
    #process.HCALTrigPrimAnalyzer
)

process.schedule.append(process.NtuplePath)

process.TFileService.fileName = cms.string(options.outputFile)

print("schedule:")
print(process.schedule)
print("schedule contents:")
print([x for x in process.schedule])