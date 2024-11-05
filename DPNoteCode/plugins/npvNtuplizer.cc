#include <memory>
#include <iostream>

#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/one/EDAnalyzer.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/Framework/interface/MakerMacros.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/Utilities/interface/InputTag.h"
#include "FWCore/ServiceRegistry/interface/Service.h"

#include "DataFormats/VertexReco/interface/Vertex.h"

#include "CommonTools/UtilAlgos/interface/TFileService.h"

#include "TTree.h"

#include <string>


class npvNtuplizer : public edm::one::EDAnalyzer<edm::one::SharedResources>
{
public:
  explicit npvNtuplizer(const edm::ParameterSet&);
  ~npvNtuplizer() = default;

private:
  void beginJob() override {};
  void analyze(const edm::Event&, const edm::EventSetup&) override;
  void endJob() override {};

  edm::EDGetTokenT<std::vector<reco::Vertex>> vertexToken;

  TTree* npvTree;
  edm::Service<TFileService> theFileService;
  
  int run;
  int lumi;
  int evt;
  int npv;
};

npvNtuplizer::npvNtuplizer(const edm::ParameterSet& iConfig):
  vertexToken( consumes<std::vector<reco::Vertex>>(iConfig.getParameter<edm::InputTag>("vertexToken")))
{
  usesResource("TFileService");

  npvTree = theFileService->make<TTree>("NPVTree","Reconstructed Vertex Information");
  npvTree->Branch("run", &run);
  npvTree->Branch("lumi", &lumi);
  npvTree->Branch("evt", &evt);
  npvTree->Branch("npv", &npv);
}

void npvNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
  edm::Handle<std::vector<reco::Vertex>> vertexHandle;
  iEvent.getByToken(vertexToken, vertexHandle);

  run = iEvent.id().run();
  lumi = iEvent.id().luminosityBlock();
  evt = iEvent.id().event();

  npv = vertexHandle->size();

  npvTree->Fill();
}

DEFINE_FWK_MODULE(npvNtuplizer);
