#!/usr/bin/bash

#farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission/Run386668/ --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission/Run386668 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission/Run386668/dags/dag --memory-requirements=4000 --input-file-list=Run386668_Files.txt RateJumpBefore "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/prefiringStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName'

echo "386640"

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386640/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386640/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_JetMET/Run386640 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386640/dags/dag --memory-requirements=4000 --input-file-list=./finalComissioningStudies/metadata/Run386640_JetMET_Files.txt Run386640 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

echo "386661"

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386661/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386661/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_JetMET/Run386661 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386661/dags/dag --memory-requirements=4000 --input-file-list=./finalComissioningStudies/metadata/Run386661_JetMET_Files.txt Run386661 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

echo "386668"

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386668/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386668/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_JetMET/Run386668 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386668/dags/dag --memory-requirements=4000 --input-file-list=./finalComissioningStudies/metadata/Run386668_JetMET_Files.txt Run386668 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

echo "386673"

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386673/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386673/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_JetMET/Run386673 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386673/dags/dag --memory-requirements=4000 --input-file-list=./finalComissioningStudies/metadata/Run386673_JetMET_Files.txt Run386673 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

echo "386679"

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386679/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386679/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_JetMET/Run386679 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386679/dags/dag --memory-requirements=4000 --input-file-list=./finalComissioningStudies/metadata/Run386679_JetMET_Files.txt Run386679 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

echo "386694"

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386694/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386694/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_JetMET/Run386694 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_JetMET/Run386694/dags/dag --memory-requirements=4000 --input-file-list=./finalComissioningStudies/metadata/Run386694_JetMET_Files.txt Run386694 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'
