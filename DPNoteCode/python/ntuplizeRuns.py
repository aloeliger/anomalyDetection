import FWCore.ParameterSet.Config as cms

from Configuration.Eras.Era_Run3_2023_cff import Run3_2023

process = cms.Process("USER", Run3_2023)
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
    input=cms.untracked.int32(-1),
)

process.MessageLogger.cerr.FwkReport.reportEvery = 10000

process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/4fdf73ed-0d56-4340-a5ca-193ad3a2b8e0.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/7c8934bc-1f4e-4c5b-8563-cc6310f7c64b.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/bb4a1bdd-474f-4c94-abd2-abfa427ffb18.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/20bc2e29-e5fe-40ab-a231-f1de9110d6f5.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/22daf7b7-8ee9-4795-b106-834dcdffb286.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/2698d3f5-0a5b-4ea6-8dd4-2aa1dcf70306.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/3a6fbc71-16d9-4bc9-8de0-8bab8d5ee4c9.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/4e8d1f23-2b73-4f7f-b4d6-a4f6283025c3.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/59efb726-6721-4333-a414-3168d0941c4a.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/696fdbe2-3699-4691-898f-4da11cf1bd60.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/7961dd66-da7b-461a-885d-883df68524c2.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/bbbd3f2a-0b0d-4e21-8c92-c4e82ab2ab79.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/c05e490e-0aa0-4c58-bc22-c6427861a7c4.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/cab90877-75dc-48bb-9491-68016f804df1.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/f4a2e252-d588-4d40-a8c8-e055832ce4ba.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/f8818903-83c7-4718-9a74-861150b2c407.root",
                                "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/16b153ac-eb1e-410f-bf32-44ef2294dbdc.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/20060548-3749-498c-9e3a-7ce523ee4f78.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/37084b6a-c3b1-4135-a2c3-0c21c7b3801d.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/4e42c60f-7454-4faf-baa4-90e7095a8e87.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/6391b320-3751-4db6-a72f-13839f94f4fb.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/6c331a1d-eaaa-478d-87b0-abd1b2d56d4a.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/86a0b23c-6c5a-4764-b3d4-0614ed2a87c6.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/b6d24861-e027-4c88-8689-5eb179ec0e5f.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/e6b81378-dedf-4076-a4f6-b35083659cf1.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/e7db754c-1f65-4a92-9d65-13e6b49a9138.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/ee244a9f-1cad-44c7-9782-adfea7ed31d8.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/fecca96f-7d8c-49dd-b6b7-397afc4dd5af.root",
                                "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/03af5410-38b2-4205-90f6-ef8862499d3b.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/049a82c9-373c-48ec-a82e-ff7fcbb4c28a.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/1308901c-3d3c-41db-8cb6-0c842cf22601.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/1a379067-0a29-480d-8b98-32e321b60b6f.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/1c247198-5cd9-422e-b5c5-8a5358a59c68.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/485b03f3-c4c9-4d7d-aeec-ddef26709f6b.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/9bf3dad1-be6c-49e7-a23f-8b15cef373d8.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/c09f07f6-ed1b-4fe2-9a41-a455544d6cb5.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/d2027514-01bb-4a86-802a-75c11e393b6f.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/d6f84615-1f90-42b9-8cf5-4ce198bf9a98.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/fa12b873-191d-48b9-a867-fc0218e14f33.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/fcd663ae-c8c3-4547-8314-08a4ee61ecb3.root",
	                        "/store/data/Run2023B/ZeroBias/MINIAOD/22Sep2023-v1/30000/ffac6d15-1ca9-4d89-9c30-6ff475dee0ed.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/0a2a2f90-ce71-4a8a-9841-1273696e795d.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/4923ca16-6201-424f-bc03-25cee255e208.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/763b933a-cfcc-46a4-956f-f9496d51d3a7.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/0cc17a32-f779-4874-8465-e93892953f71.root",
	                        #"/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/0d0cf431-8b30-486b-9112-4393a59874dc.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/1530c4e5-a961-4d06-aef4-2539040adbef.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/2aabae8f-49b5-4ce9-99ff-b6c19978b783.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/3f9efd64-1754-4e7d-be26-a52d284d936c.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/6cc0fb88-940b-42be-9619-bf88a5e9de68.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/6d654318-88b1-4e34-b584-d16d69c9905f.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/7939358e-a770-4024-a60b-b9bcf3129c59.root",
                                "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/2fd5b2ab-3a0f-4a4c-bcc4-039ac4a38a3b.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/30000/650045e2-0b12-40d9-8508-108c99b19c1c.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/22f23cdb-1d7c-454b-959d-b30543a490cb.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/e49d4d81-bc9b-46cf-a7c3-e570c69b7b16.root",
	                        "/store/data/Run2023C/ZeroBias/MINIAOD/22Sep2023_v1-v1/50000/0d0cf431-8b30-486b-9112-4393a59874dc.root",
                                "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/65bd4e0c-1a01-4921-b58a-b59f3f37ae1f.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/8268e6f9-28e7-4d2e-939d-622ce6550656.root",
                                "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/06347036-cf85-4b58-8f93-a0d125f446c8.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/0d07783b-5164-4802-9c9b-20b9faa586be.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/0f8968fd-e0e3-4976-a083-9527f19f44f0.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/0fce8462-173a-4e48-afd7-3432b264c6a7.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/1314bb28-e903-474c-99a2-87d4dbf2d996.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/1bf405c3-b5f6-43ae-b0a9-00c47df040cd.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/1e9734f9-cd9c-4457-a7bf-57281e50affc.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/224ea3ea-323a-4fec-ae94-6f424da173ba.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/27a7c941-9ce1-49df-956d-c9b19af1f6a7.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/28bcb40a-af0e-4e4a-b9d8-8748e204ff1e.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/2db2093f-8154-426d-bba6-647162942b07.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/31c0aa92-6c76-47c5-ac5a-c1226d6c5e59.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/34effe26-78f4-472d-87dd-025c8ee07ff2.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/3a9ba26d-2592-440b-852f-03ebc16dbbac.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/4a9490ae-0830-444d-b35f-5ea3c78866fe.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/4cdd45c7-b84c-4456-8400-607461232775.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/55d8c0e0-4d31-443a-994a-bb994f3c7df6.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/6324ac30-0aef-4bb7-92c5-fad54e5649be.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/63d679e5-529f-4315-982f-b0456de25add.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/64087e5e-655d-4f9f-8267-f4d40efc4e07.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/65bd4e0c-1a01-4921-b58a-b59f3f37ae1f.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/7c29f14e-b29c-4094-a717-62071f583c82.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/99aad5dd-9bde-4ce7-99a4-689730a6eedf.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/a7212fc2-2fd2-4df6-a00e-ac564283c21d.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/ab0aae9d-57cf-473a-af0c-a240cd283975.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/ae2bba3e-1103-431f-b67f-56959485a5c7.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/bb1a3ba9-6f04-4f58-a26f-20bd1ef341d5.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/c02402ac-5be9-492a-8a45-f335f7f56c44.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/cd9282b1-ae3b-41ec-a680-95b93769a8d3.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/cfc4ae5b-536e-47f1-bfcc-cc6074239bed.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/d9d88dba-e4f5-4765-98fb-1debb1864c37.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/dcaa731c-8b56-4a8c-b3fe-8bea72bbe020.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/e3867f9d-0f42-49f5-87de-0a084750234b.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/e6082604-f6f1-4425-8372-9994dab7a66f.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/e7b64acf-0c59-4052-bc9d-0051bd3d54fb.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/f24280bb-1a8a-4d70-a9c9-79af04244ccb.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/f4ca7c99-2499-4478-b0f6-b5a0fe497390.root",
	                        "/store/data/Run2023D/ZeroBias/MINIAOD/22Sep2023_v1-v1/40000/fc41413d-5546-4d61-b1c7-add575a2a8b5.root",
                            ),
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
process.GlobalTag = GlobalTag(process.GlobalTag, '130X_dataRun3_Prompt_v4', '')

process.load("anomalyDetection.DPNoteCode.npvNtuplizer_cfi")

process.npv_step = cms.Path(process.npvNtuplizer)
process.schedule = cms.Schedule(process.npv_step)

process.TFileService = cms.Service(
    "TFileService",
    fileName = cms.string("Data_DPS_NPV.root")
)
#process.TFileService.fileName("Data_DPS_NPV.root")

print("schedule:")
print(process.schedule)
print("schedule contents:")
print([x for x in process.schedule])
