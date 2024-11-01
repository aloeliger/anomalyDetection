import FWCore.ParameterSet.Config as cms

CICADAInputNtuplizer = cms.EDAnalyzer(
    'CICADAInputNtuplizer',
    emuRegionsToken = cms.InputTag("caloLayer1Digis")
)
