#!/usr/bin/bash

#farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission/Run386668/ --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission/Run386668 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission/Run386668/dags/dag --memory-requirements=4000 --input-file-list=Run386668_Files.txt RateJumpBefore "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/prefiringStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName'

# mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386668/dags/

# farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386668/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386668 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386668/dags/dag --memory-requirements=4000 --input-file-list=Run386668_Files.txt Run386668 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/prefiringStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

# mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386673/dags/

# farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386673/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386673 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386673/dags/dag --memory-requirements=4000 --input-file-list=Run386673_Files.txt Run386673 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/prefiringStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

# mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386661/dags/

# farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386661/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386661 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386661/dags/dag --memory-requirements=4000 --input-file-list=Run386661_Files.txt Run386661 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/prefiringStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

# mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386640/dags/

# farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386640/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386640 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386640/dags/dag --memory-requirements=4000 --input-file-list=Run386640_Files.txt Run386640 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/prefiringStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

# mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386679/dags/

# farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386679/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386679 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386679/dags/dag --memory-requirements=4000 --input-file-list=Run386679_Files.txt Run386679 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/prefiringStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'

mkdir -p /nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386694/dags/

farmoutAnalysisJobs --submit-dir=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386694/submit --assume-input-files-exist --input-dir=/ --output-dir=/store/user/aloeliger/rateJumpSubmission_TPGs/Run386694 --output-dag-file=/nfs_scratch/aloeliger/rateJumpSubmission_TPGs/Run386694/dags/dag --memory-requirements=4000 --input-file-list=Run386694_Files.txt Run386694 "$CMSSW_BASE" "$CMSSW_BASE/src/anomalyDetection/finalComissioningStudies/prefiringConfiguration.py" 'inputFiles=$inputFileNames' 'outputFile=$outputFileName' 'isData=True'
