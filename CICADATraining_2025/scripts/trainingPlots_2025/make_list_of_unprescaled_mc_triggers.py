#!/usr/bin/env python3
#Script to quikcly toss together an estimate of what unprescaled triggers I can use for all years

import ROOT
import src.make_rate_plots as rp
import src.make_score_plots as sp
from src.sample import Sample
from src.utils import *
from rich.console import Console
import json
import os

console = Console()

def main():
    console.log('Making samples')
    trees = [
        'l1EventTree/L1EventTree',
        'CICADAInputNtuplizer/CICADAInputTree',
        'npvNtuplizer/NPVTree',
        'L1TTriggerBitsNtuplizer/L1TTriggerBits'
    ]
    samples = {
        'GluGluHToGG': Sample(
            ['/hdfs/store/user/aloelige/GluGluHToGG_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_GluGluHToGG_Run3Winter24_10Jan2025/',],
            trees,
            limit_files=1,
        ),
        'GluGluHToTauTau': Sample(
            ['/hdfs/store/user/aloelige/GluGluHToTauTau_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_GluGluHToTauTau_Run3Winter24_10Jan2025/',],
            trees,
            limit_files=1,
        ),
        'HTo2LongLivedTo4b': Sample(
            ['/hdfs/store/user/aloelige/HTo2LongLivedTo4b_MH-125_MFF-12_CTau-900mm_TuneCP5_13p6TeV_pythia8/CICADATraining2025_HTo2LongLivedTo4b_Run3Winter24_10Jan2025/',],
            trees,
            limit_files=1,
        ),
        'TT': Sample(
            ['/hdfs/store/user/aloelige/TT_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_TT_Run3Winter24_13Jan2025/',],
            trees,
            limit_files=1,
        ),
        'VBFHToTauTau': Sample(
            ['/hdfs/store/user/aloelige/VBFHToTauTau_M125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_VBFHToTauTau_Run3Winter24_13Feb2025/',],
            trees,
            limit_files=1,
        ),
        'VBFHto2B': Sample(
            ['/hdfs/store/user/aloelige/VBFHto2B_M-125_TuneCP5_13p6TeV_powheg-pythia8/CICADATraining2025_VBFHTo2B_Run3Winter24_13Feb2025/',],
            trees,
            limit_files=1,
        ),
    }

    unprescaled_triggers = []
    for sample in samples:
        console.print(sample)
        unprescaled_triggers.append(get_list_of_unprescaled_triggers(samples[sample]))
        #console.print(unprescaled_triggers)

    unprescaled_triggers = set.intersection(*map(set,unprescaled_triggers))
    unprescaled_triggers = sorted(unprescaled_triggers)
    console.print(unprescaled_triggers)
    

    cmssw_base = os.getenv('CMSSW_BASE')
    json_output_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_mc_trigger_list.json'

    with open(json_output_location, 'w') as theFile:
        json.dump(unprescaled_triggers, theFile)

if __name__ == '__main__':
    main()
