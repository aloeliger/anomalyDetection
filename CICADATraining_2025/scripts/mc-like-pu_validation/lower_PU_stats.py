import ROOT
import os
from rich.console import Console
import numpy as np
import h5py
import tensorflow.keras as keras
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import json
import argparse

from pathlib import Path

from make_validation_plots import *

console = Console()

def main():
    #Get ZB sample
    all_data = [
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024C_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024D_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024E_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024G_11Nov2024/',
        #'/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024H_11Nov2024/',
        '/hdfs/store/user/aloelige/ZeroBias/CICADATraining2025_2024I_11Nov2024/',
    ]

    console.log('Making ZB DF')
    df, chains = make_df(
        all_data,
        [
            'l1EventTree/L1EventTree',
            'CICADAInputNtuplizer/CICADAInputTree',
            'L1TTriggerBitsNtuplizer/L1TTriggerBits',
            'npvNtuplizer/NPVTree',
        ],
        #debug
        #modulus_acceptance = 10
    )

    #debug
    #df = df.Range(100000)

    nEvents = df.Count()
    console.log(f'nEvents: {nEvents.GetValue()}')

    for npv in range(20, 51, 2):
        num_events = df.Filter(f'npv == {npv}').Count().GetValue()
        console.log(f'\tNPV == {npv}, # Events: {num_events}')

if __name__ == '__main__':
    main()
