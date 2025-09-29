#!/bin/bash
##
#PBS -l ncpus=28
#PBS -l walltime=48:00:00
#PBS -l mem=128GB
#PBS -l wd
#PBS -M vu.v.pham@unsw.edu.au
#PBS -m abe
#PBS -j oe
#PBS -P ur22
#PBS -l other=gdata
#PBS -l storage=gdata/ur22
#PBS -q normalbw
#PBS -W umask=027
#PBS -l jobfs=1GB
#######################################################################################
#######################################################################################

#######################################################################################
source /g/data/ur22/vp8928/miniconda3/bin/activate
conda activate CoRALEnv2

module load samtools/1.12
module load bwa/0.7.17
##module load jre/1.8.0_121
module load R/4.2.1

#=====================================
# 4.1) CoRAL.py seed
# seed: Identify and filter copy number gain regions where amplifications exist
# Ref: https://github.com/AmpliconSuite/CoRAL

cd /g/data/ur22/vp8928/009eccDNAEns/AALong
# /g/data/ur22/vp8928/009eccDNAEns/AALong/CoRAL/src/CoRAL.py seed --cn_seg /g/data/ur22/vp8928/009eccDNAEns/AALong/CN/POU14119A2.sorted.aligned.cns
/g/data/ur22/vp8928/009eccDNAEns/AALong/CoRAL/src/CoRAL.py seed --cn_seg /g/data/ur22/vp8928/009eccDNAEns/AALong/CN/POU14119A1.sorted.aligned.cns

#=====================================

### cd /g/data/ur22/vp8928/009eccDNAEns/AALong
### dos2unix ./../BashScriptGadi_NewData01Seed.sh
### chmod +x ./../BashScriptGadi_NewData01Seed.sh
### qsub ./../BashScriptGadi_NewData01Seed.sh

### PBS JOB 98910552.gadi-pbs
