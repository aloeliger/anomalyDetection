#!/usr/bin/bash
git clone https://github.com/Xilinx/HLS_arbitrary_Precision_Types hls

#Now, we first try compiling the CICADA firmware models
cd hls4mlEmulatorExtras/
make install #important to do this instead of just making it.
cd ../CICADA/
make #if this causes errors, stop, either try to fix them or reach out to me/someone
cd ../../
scram b -j 8 #make everything else,may complain about some scripts or non-cmssw files. Should work. mostly.
cd anomalyDetection
