from detailed_rate_table_calculator import *
import ROOT
from rich.console import Console
from rich.table import Table
from rich.progress import track, Progress
import numpy as np
import json
from pathlib import Path
import tensorflow.keras as keras
import matplotlib.pyplot as plt
import math
import argparse

console = Console()

def main(args):
    console.log('[green]Start[/green]')
    console.log('Finding run information')
    all_data = [
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
    ]

    console.log('Making DF')
    df, chains = make_df(
        all_data,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits',
            'npvNtuplizer/NPVTree',
        ],
    )

    console.log('Available runs')
    available_runs = df.AsNumpy(['run'])['run']
    unique_runs = np.unique(available_runs)
    console.log(unique_runs)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    args = parser.parse_args()

    main(args)
