import FWCore.ParameterSet.Config as cms

axol1tlScoreNtuplizerv3 = cms.EDAnalyzer(
    'axol1tlScoreNtuplizer',
    scoreToken = cms.InputTag('axol1tlProducerv3', 'AXOScore'),
    varName = cms.string('axol1tl_v3')
)

axol1tlScoreNtuplizerv4 = cms.EDAnalyzer(
    'axol1tlScoreNtuplizer',
    scoreToken = cms.InputTag('axol1tlProducerv4', 'AXOScore'),
    varName = cms.string('axol1tl_v4')
)

axol1tlScoreNtuplizerv5 = cms.EDAnalyzer(
    'axol1tlScoreNtuplizer',
    scoreToken = cms.InputTag('axol1tlProducerv5', 'AXOScore'),
    varName = cms.string('axol1tl_v5')
)
