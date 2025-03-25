# Main repository for Anomaly Detection work and submodules.
## Current Setup Instructions
```
cmsrel CMSSW_15_0_0
cd CMSSW_15_0_0/src/
git cms-addpkg L1Trigger/L1TCaloLayer1
git clone --recursive git@github.com:aloeliger/anomalyDetection.git
cd anomalyDetection
source finalize_setup.sh
```
### Paper code
This repository is a mix of a large number of different sub-projects (and even repositories) I have created working on the CICADA project. I am trying to centralize all paper under the `paperCode` directory.
In particular, for making initial Ntuples, I am using `paperCode/python/makeCICADANtuplesFromRAW.py`.

This configuration is designed to run the last two models of both CICADA architectures (1.1.1, 1.1.2, 2.1.1, & 2.1.2 as of the writing of this), make enough input to make new models, and include L1Ntuple information. Running this many emulators at once is why we are working with some non-standard emulation code and configurations I have included.

This configuration is designed to run on RAW datatier files. I will be adding/modifying it in the future for MINI and MINI+RAW files. It is currently set-up for MC, I will be modifying it in the future to have a flag for data

The configuration should use most of the basic options for `analysis` described [here](https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideAboutPythonConfigFile#VarParsing_Example)

In general, to run this configuration for a specific file, you can do:
```
cmsRun makeCICADANtuplesFromRAW.py inputFiles=/store/mc/campaign/sample/tier/file.root outputFile=file:./TestFile.root maxEvents=-1
```
