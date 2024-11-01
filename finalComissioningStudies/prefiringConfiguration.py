import FWCore.ParameterSet.Config as cms

from Configuration.Eras.Era_Run3_2024_cff import Run3_2024

import FWCore.ParameterSet.VarParsing as VarParsing
options = VarParsing.VarParsing('analysis')
options.register(
    'isData',
    False,
    VarParsing.VarParsing.multiplicity.singleton,
    VarParsing.VarParsing.varType.bool,
    "Use data configuration options or not",
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
    'emtfStage2Digis', 
    'l1uGTTestcrateTree', 
    'simDtTriggerPrimitiveDigis'
)

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(options.inputFiles),
)

# process.source = cms.Source(
#     "PoolSource",
#     fileNames = cms.untracked.vstring(
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/2eeeeee8-b762-4d91-a1fc-f09d60ab0fe1.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/aaa8bff5-2714-457b-935a-89602febe466.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/18723533-5b84-46dd-82e2-e9f717be52fc.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/11196b2b-b211-491a-91e4-11ff945a626b.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/e3977681-0abf-4df6-97a2-c6f86bcb73ec.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/efc7f715-0843-4bab-be70-ff810f94bf9b.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/6ce66594-3a97-4728-be30-408dfdca3fe9.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/922f81c1-d1da-4fe9-9389-4a1ad48da7a1.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/f90c1ff8-6a98-4c4c-81c9-d59b9c56baff.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/3880e42d-a5b7-4d3a-acd4-838ee669de78.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/fc265b29-c858-42b7-a45c-c4513f5345b7.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/86b9fdcf-5a49-4070-93e7-797333b62ffc.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/86d1edb2-5bdc-4c4b-840e-925d0fcd2707.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/54c70daa-ec36-4977-86ac-5105c6630097.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/b419f219-0858-48bf-93e3-d9a58a235fc7.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/ac5aa375-30d2-4062-b239-017573e2ab82.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/d262b58f-9be9-465c-8e15-0b9d26f5d354.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/77b435e0-6514-449c-aa7f-98e3943adce4.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/e0bd22d9-8fcc-4d66-b1f6-f35443a810e5.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/d36e683c-84d4-4806-a038-cb22b50e25e9.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/1677232f-a92c-4877-a993-0f6a7a2c0077.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/2accb2ab-685b-4744-bc67-abd67537f15b.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/519cb7f7-d826-4d83-819e-de59ec64ae4f.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/49b2aac1-84b1-4409-9840-d90cb514a4bb.root",
#         "/store/data/Run2024G/JetMET0/RAW/v1/000/385/764/00000/fc060b46-0763-4b50-ac0d-53353a50129a.root",
#     )
# )

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

# process.load('L1Trigger.L1TCaloLayer1.L1TCaloSummaryCICADAv1p1p0')
# process.load('L1Trigger.L1TCaloLayer1.L1TCaloSummaryCICADAv2p1p0')
# process.load('L1Trigger.L1TCaloLayer1.L1TCaloSummaryCICADAv1p1p1')
# process.load('L1Trigger.L1TCaloLayer1.L1TCaloSummaryCICADAv2p1p1')
# process.load('L1Trigger.L1TCaloLayer1.L1TCaloSummaryCICADAv1p1p2')
# process.load('L1Trigger.L1TCaloLayer1.L1TCaloSummaryCICADAv2p1p2')
# process.productionTask = cms.Task(
#     process.L1TCaloSummaryCICADAv1p1p0,
#     process.L1TCaloSummaryCICADAv2p1p0,
#     process.L1TCaloSummaryCICADAv1p1p1,
#     process.L1TCaloSummaryCICADAv2p1p1,
#     process.L1TCaloSummaryCICADAv1p1p2,
#     process.L1TCaloSummaryCICADAv2p1p2,
# )
# process.productionPath = cms.Path(process.productionTask)
# process.schedule.append(process.productionPath)

# from anomalyDetection.anomalyTriggerSkunkworks.L1TCaloSummaryTestNtuplizer_cfi import L1TCaloSummaryTestNtuplizer
# process.CICADAv1p1p0Ntuplizer = L1TCaloSummaryTestNtuplizer.clone(
#     scoreSource = cms.InputTag("L1TCaloSummaryCICADAv1p1p0", "CICADAScore"),
#     ecalToken = cms.InputTag('simEcalTriggerPrimitiveDigis'),
#     hcalToken = cms.InputTag('simHcalTriggerPrimitiveDigis'),
#     outputScoreName = cms.string('CICADA_v1p1p0'),
#     includePUInfo = cms.bool(False),   
# )
# process.CICADAv2p1p0Ntuplizer = L1TCaloSummaryTestNtuplizer.clone(
#     scoreSource = cms.InputTag("L1TCaloSummaryCICADAv2p1p0", "CICADAScore"),
#     ecalToken = cms.InputTag('simEcalTriggerPrimitiveDigis'),
#     hcalToken = cms.InputTag('simHcalTriggerPrimitiveDigis'),
#     outputScoreName = cms.string('CICADA_v2p1p0'),
#     includePUInfo = cms.bool(False),   
# )
# process.CICADAv1p1p1Ntuplizer = L1TCaloSummaryTestNtuplizer.clone(
#     scoreSource = cms.InputTag("L1TCaloSummaryCICADAv1p1p1", "CICADAScore"),
#     ecalToken = cms.InputTag('simEcalTriggerPrimitiveDigis'),
#     hcalToken = cms.InputTag('simHcalTriggerPrimitiveDigis'),
#     outputScoreName = cms.string('CICADA_v1p1p1'),
#     includePUInfo = cms.bool(False),   
# )
# process.CICADAv2p1p1Ntuplizer = L1TCaloSummaryTestNtuplizer.clone(
#     scoreSource = cms.InputTag("L1TCaloSummaryCICADAv2p1p1", "CICADAScore"),
#     ecalToken = cms.InputTag('simEcalTriggerPrimitiveDigis'),
#     hcalToken = cms.InputTag('simHcalTriggerPrimitiveDigis'),
#     outputScoreName = cms.string('CICADA_v2p1p1'),
#     includePUInfo = cms.bool(False),   
# )
# process.CICADAv1p1p2Ntuplizer = L1TCaloSummaryTestNtuplizer.clone(
#     scoreSource = cms.InputTag("L1TCaloSummaryCICADAv1p1p2", "CICADAScore"),
#     ecalToken = cms.InputTag('simEcalTriggerPrimitiveDigis'),
#     hcalToken = cms.InputTag('simHcalTriggerPrimitiveDigis'),
#     outputScoreName = cms.string('CICADA_v1p1p2'),
#     includePUInfo = cms.bool(False),   
# )
# process.CICADAv2p1p2Ntuplizer = L1TCaloSummaryTestNtuplizer.clone(
#     scoreSource = cms.InputTag("L1TCaloSummaryCICADAv2p1p2", "CICADAScore"),
#     ecalToken = cms.InputTag('simEcalTriggerPrimitiveDigis'),
#     hcalToken = cms.InputTag('simHcalTriggerPrimitiveDigis'),
#     outputScoreName = cms.string('CICADA_v2p1p2'),
#     includePUInfo = cms.bool(False),   
# )
process.load("anomalyDetection.paperCode.CICADAInputNtuplizer_cfi")

process.load('anomalyDetection.anomalyTriggerSkunkworks.L1TTriggerBitsNtuplizer_cfi')

# Add trained keras models to the ntuples
process.load("anomalyDetection.paperCode.kerasModels_cfi")
process.kerasModelsSequence = cms.Sequence(
    process.CICADA_v1p2p0_Ntuplizer +
    process.CICADA_v2p2p0_Ntuplizer +
    process.CICADA_vXp2p0_Teacher_Ntuplizer +

    process.CICADA_v1p2p0N_Ntuplizer +
    process.CICADA_v2p2p0N_Ntuplizer +
    process.CICADA_vXp2p0N_Teacher_Ntuplizer +

    process.CICADA_v1p2p1_Ntuplizer +
    process.CICADA_v2p2p1_Ntuplizer +
    process.CICADA_vXp2p1_Teacher_Ntuplizer +

    process.CICADA_v1p2p1N_Ntuplizer +
    process.CICADA_v2p2p1N_Ntuplizer +
    process.CICADA_vXp2p1N_Teacher_Ntuplizer +

    process.CICADA_v1p2p2_Ntuplizer +
    process.CICADA_v2p2p2_Ntuplizer +
    process.CICADA_vXp2p2_Teacher_Ntuplizer +
    
    process.CICADA_v1p2p2N_Ntuplizer +
    process.CICADA_v2p2p2N_Ntuplizer +
    process.CICADA_vXp2p2N_Teacher_Ntuplizer
)

process.gadgetModelsSequence = cms.Sequence(
    process.GADGET_v1p0p0_Ntuplizer +
    process.GADGET_v1p0p0_Teacher_Ntuplizer
)

process.load('anomalyDetection.anomalyTriggerSkunkworks.unpackedScoreNtuplizer_cfi')
process.load('anomalyDetection.anomalyTriggerSkunkworks.unprefirableInformationNtuplizer_cfi')
process.load('anomalyDetection.anomalyTriggerSkunkworks.ECALTrigPrimAnalyzer_cfi')
process.load('anomalyDetection.anomalyTriggerSkunkworks.HCALTrigPrimAnalyzer_cfi')

process.NtuplePath = cms.Path(
    #process.CICADAv1p1p0Ntuplizer +
    #process.CICADAv2p1p0Ntuplizer +
    #process.CICADAv1p1p1Ntuplizer +
    #process.CICADAv2p1p1Ntuplizer +
    #process.CICADAv1p1p2Ntuplizer +
    #process.CICADAv2p1p2Ntuplizer +
    process.L1TTriggerBitsNtuplizer +
    process.CICADAInputNtuplizer +
    #process.kerasModelsSequence +
    #process.gadgetModelsSequence +
    process.unpackedCICADAScoreNtuplizer +
    process.unprefirableInformationNtuplizer +
    process.ECALTrigPrimAnalyzer +
    process.HCALTrigPrimAnalyzer
)

process.schedule.append(process.NtuplePath)

process.TFileService.fileName = cms.string(options.outputFile)

print("schedule:")
print(process.schedule)
print("schedule contents:")
print([x for x in process.schedule])
