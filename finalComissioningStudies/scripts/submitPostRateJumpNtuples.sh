#!/usr/bin/bash

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386945/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386945/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386945 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386945/dags/dag --memory-requirements=4000 --input-file-list=finalComissioningStudies/metadata/Run386945_Files.txt Run386945 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/python/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386951/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386951/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386951 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386951/dags/dag --memory-requirements=4000 --input-file-list=finalComissioningStudies/metadata/Run386951_Files.txt Run386951 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/python/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'
