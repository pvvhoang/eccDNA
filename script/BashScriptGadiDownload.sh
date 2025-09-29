#!/bin/bash
##
#PBS -l ncpus=1
#PBS -l walltime=10:00:00
#PBS -l mem=64GB
#PBS -l wd
#PBS -M vu.v.pham@unsw.edu.au
#PBS -m abe
#PBS -j oe
#PBS -P ur22
#PBS -q copyq
#PBS -W umask=027
#PBS -l jobfs=1GB
#######################################################################################
#######################################################################################

#######################################################################################

#=====================================
# 1) Download data

cd /g/data/ur22/Data/ecDNA_Ensieh/data

wget -c -O POU14119A1.tar https://mydata.ramaciotti.unsw.edu.au/s/jfJykWTCEMWNHcn/download/POU14119A1.tar

wget -c -O POU14119A2.tar https://mydata.ramaciotti.unsw.edu.au/s/JeDxbPS4xpFfQXF/download/POU14119A2.tar

#=====================================

### /g/data/ur22/vp8928/009eccDNAEns
### dos2unix /g/data/ur22/vp8928/009eccDNAEns/BashScriptGadiDownload.sh
### chmod +x /g/data/ur22/vp8928/009eccDNAEns/BashScriptGadiDownload.sh
### qsub /g/data/ur22/vp8928/009eccDNAEns/BashScriptGadiDownload.sh
