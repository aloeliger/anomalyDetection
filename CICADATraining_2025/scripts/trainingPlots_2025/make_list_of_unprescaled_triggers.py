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
        'RunC': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',],
            trees,
            limit_files=1,
        ),
        'RunD': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',],
            trees,
            limit_files=1,
        ),
        'RunE': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',],
            trees,
            limit_files=1,
        ),
        'RunG': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',],
            trees,
            limit_files=1,
        ),
        'RunH': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',],
            trees,
            limit_files=1,
        ),
        'RunI': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',],
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
    json_output_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'

    with open(json_output_location, 'w') as theFile:
        json.dump(unprescaled_triggers, theFile)

if __name__ == '__main__':
    main()
