#!/bin/bash
##
#PBS -l ncpus=1
#PBS -l walltime=10:00:00
#PBS -l mem=190GB
#PBS -l wd
#PBS -M vu.v.pham@unsw.edu.au
#PBS -m abe
#PBS -j oe
#PBS -P ur22
#PBS -q copyq
#PBS -W umask=027
#PBS -l jobfs=190GB
#PBS -l storage=gdata/ur22
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
# 4.2.) CoRAL.py reconstruct
# reconstruct: Perform breakpoint graph construct and cycle decomposition on the amplified seeds.
# Ref: https://github.com/AmpliconSuite/CoRAL

cd /g/data/ur22/vp8928/009eccDNAEns/AALong
./CoRAL/src/CoRAL.py reconstruct --lr_bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --cnv_seed ./CN/POU14119A1.sorted.aligned_CNV_SEEDS.bed --output_prefix POU14119A1 --cn_seg ./CN/POU14119A1.sorted.aligned.cns

#=====================================

### cd /g/data/ur22/vp8928/009eccDNAEns/AALong
### dos2unix ./../BashScriptGadi_NewData02reconstruct.sh
### chmod +x ./../BashScriptGadi_NewData02reconstruct.sh
### qsub ./../BashScriptGadi_NewData02reconstruct.sh

### PBS JOB 98910552.gadi-pbs
