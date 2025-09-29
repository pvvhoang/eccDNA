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
# # 3) Getting copy number calls

# Ref: https://github.com/AmpliconSuite/CoRAL

cd /g/data/ur22/vp8928/009eccDNAEns/AALong/CoRAL
./scripts/call_cnvs.sh /g/data/ur22/vp8928/009eccDNAEns/data/POU14119A1/output/POU14119A1.sorted.aligned.bam ./reference/hg38full_ref_5k.cnn /g/data/ur22/vp8928/009eccDNAEns/AALong/CN

#=====================================

### cd /g/data/ur22/vp8928/009eccDNAEns/AALong
### dos2unix ./../BashScriptGadi_NewDataCN.sh
### chmod +x ./../BashScriptGadi_NewDataCN.sh
### qsub ./../BashScriptGadi_NewDataCN.sh

### PBS JOB 98910552.gadi-pbs
