#!/bin/bash
##
#PBS -l ncpus=12
#PBS -l walltime=12:00:00
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

cd /g/data/ur22/vp8928/009eccDNAEns/AALong

./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --graph POU14119A1_amplicon1_graph.txt --output_prefix POU14119A1_amplicon1 --plot_graph
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --graph POU14119A1_amplicon2_graph.txt --output_prefix POU14119A1_amplicon2 --plot_graph
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --graph POU14119A1_amplicon3_graph.txt --output_prefix POU14119A1_amplicon3 --plot_graph
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --graph POU14119A1_amplicon4_graph.txt --output_prefix POU14119A1_amplicon4 --plot_graph
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --graph POU14119A1_amplicon5_graph.txt --output_prefix POU14119A1_amplicon5 --plot_graph
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --graph POU14119A1_amplicon6_graph.txt --output_prefix POU14119A1_amplicon6 --plot_graph

./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --cycles POU14119A1_amplicon1_cycles.txt --output_prefix POU14119A1_amplicon1 --plot_cycles
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --cycles POU14119A1_amplicon2_cycles.txt --output_prefix POU14119A1_amplicon2 --plot_cycles
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --cycles POU14119A1_amplicon3_cycles.txt --output_prefix POU14119A1_amplicon3 --plot_cycles
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --cycles POU14119A1_amplicon4_cycles.txt --output_prefix POU14119A1_amplicon4 --plot_cycles
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --cycles POU14119A1_amplicon5_cycles.txt --output_prefix POU14119A1_amplicon5 --plot_cycles
./CoRAL/src/CoRAL.py plot --ref GRCh38 --bam ./../data/POU14119A1/output/POU14119A1.sorted.aligned.bam --cycles POU14119A1_amplicon6_cycles.txt --output_prefix POU14119A1_amplicon6 --plot_cycles

#=====================================

### cd /g/data/ur22/vp8928/009eccDNAEns/AALong
### dos2unix ./../BashScriptGadi_NewData03plot.sh
### chmod +x ./../BashScriptGadi_NewData03plot.sh
### qsub ./../BashScriptGadi_NewData03plot.sh

### PBS JOB 98910552.gadi-pbs
