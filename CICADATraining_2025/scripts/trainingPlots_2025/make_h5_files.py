import ROOT
import h5py
from src.sample import Sample
from src.utils import *
import src.make_score_plots as sp
from pathlib import Path
from rich.console import Console
from rich.progress import track
import tensorflow.keras as keras
import os
import json
import argparse
import numpy as np

console = Console()

def main(args):
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
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunD': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunE': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunG': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunH': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
        'RunI': Sample(
            ['/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',],
            trees,
            limit_files=args.limit_files,
            modulus_acceptance=args.modulus_acceptance,
        ),
    }

    console.log('Definitions')
    cmssw_base = os.getenv('CMSSW_BASE')
    json_location = f'{cmssw_base}/src/anomalyDetection/CICADATraining_2025/metadata/unprescaled_trigger_list.json'
    with open(json_location) as theFile:
        unprescaled_trigger_list = json.load(theFile)

    for sample in samples:
        console.log(f'\t{sample}')
        samples[sample].df = filter_bad_events(samples[sample].df)
        samples[sample].df = define_cicada_average_variable(samples[sample].df)
        samples[sample].df = make_pure_event_variable_from_list(samples[sample].df, unprescaled_trigger_list)

    output_location = Path(args.output_dir)
    output_location.mkdir(exist_ok=True, parents=True)

    #hdfs_output_location = f'/store/user/aloeliger/{output_location}'
    #os.system(f'hdfs dfs -mkdir {hdfs_output_location}')

    for sample in track(samples):
        file_name = f'{sample}.h5'
        the_sample = samples[sample]

        inputs, purity, npvs, cicada_averages = sp.get_all_inputs(the_sample.df)
        purity = purity.astype(dtype='?')

        with h5py.File(output_location/file_name, 'w') as theFile:
            theFile.create_dataset('inputs', data=inputs)
            theFile.create_dataset('purity', data=purity)
            theFile.create_dataset('npvs', data=npvs)
            theFile.create_dataset('cicada_averages', data=cicada_averages)
        #os.system(f'hdfs dfs -moveFromLocal {output_location/file_name} {hdfs_output_location}/{file_name}')
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Make h5 files for faster matplotlib analysis')

    parser.add_argument(
        '--limit_files',
        type=int,
    )
    parser.add_argument(
        '--modulus_acceptance',
        type=int,
    )
    parser.add_argument(
        '--output_dir',
        nargs='?',
        default='PlotH5Files',
    )

    args = parser.parse_args()

    main(args)
