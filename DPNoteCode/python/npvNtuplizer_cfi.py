import FWCore.ParameterSet.Config as cms

npvNtuplizer = cms.EDAnalyzer(
    'npvNtuplizer',
    vertexToken = cms.InputTag("offlineSlimmedPrimaryVertices"),
)
