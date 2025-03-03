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

#include "TTree.h"
#include "CommonTools/UtilAlgos/interface/TFileService.h"

#include <string>

class axol1tlScoreNtuplizer : public edm::one::EDAnalyzer<edm::one::SharedResources>
{
public:
  explicit axol1tlScoreNtuplizer(const edm::ParameterSet&);
  ~axol1tlScoreNtuplizer() override=default;
  static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);
    
private:
  void beginJob() override {};
  void analyze(const edm::Event&, const edm::EventSetup&) override;
  void endJob() override {};

  edm::EDGetTokenT<float> scoreToken;
  edm::Service<TFileService> theFileService;
  TTree* outputTree;
  std::string varName;
  float score;
};

axol1tlScoreNtuplizer::axol1tlScoreNtuplizer(const edm::ParameterSet& iConfig):
  scoreToken(consumes<float>(iConfig.getParameter<edm::InputTag>("scoreToken"))),
  varName(iConfig.getParameter<std::string>("varName"))
{
  usesResource("TFileService");
  outputTree = theFileService->make<TTree>("AXOL1TLScoreTree", "re-emulated AXOL1Tl score");
  outputTree -> Branch(varName.c_str(), &score);
}

void axol1tlScoreNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
  score = 0.0;
  edm::Handle<float> scoreHandle;
  iEvent.getByToken(scoreToken, scoreHandle);
  score = *scoreHandle;

  outputTree->Fill();
}

void axol1tlScoreNtuplizer::fillDescriptions(edm::ConfigurationDescriptions& descriptions)
{
  edm::ParameterSetDescription desc;
  desc.add<std::string>("varName", "AXOScore");
  desc.add<edm::InputTag>("scoreToken");
  descriptions.addDefault(desc);
}

DEFINE_FWK_MODULE(axol1tlScoreNtuplizer);
