#!/bin/bash

#PBS -l select=1:ncpus=5:mem=180gb
#PBS -l walltime=48:00:00
#PBS -M vu.v.pham@unsw.edu.au
#PBS -m ae
#PBS -j oe
#PBS -o /srv/scratch/z3538133/009eccDNAEns/POU14119A1

#=====================================

# which apptainer
# /usr/bin/apptainer

# which singularity
# /usr/bin/singularity

# ls -lart /usr/bin/singularity
# /usr/bin/singularity -> apptainer

# Loading
module load java/21.0.3_9-openjdk
module load nextflow/24.04.4
# z3538133@katana2:~ $ singularity version
# 1.3.4-1.el8

# nextflow run epi2me-labs/wf-alignment --help

# update a workflow to the latest version 
# nextflow pull epi2me-labs/wf-alignment

# downloaded and unpacked
# cd /srv/scratch/z3538133/009eccDNAEns/example
# wget https://ont-exd-int-s3-euwst1-epi2me-labs.s3.amazonaws.com/wf-alignment/wf-alignment-demo.tar.gz
# tar -xzvf wf-alignment-demo.tar.gz

cd /srv/scratch/z3538133/009eccDNAEns/POU14119A1

# cp /srv/scratch/z3538133/009eccDNAEns/references/Homo_sapiens/NCBI/GRCh38/Sequence/WholeGenomeFasta/genome.fa /srv/scratch/z3538133/009eccDNAEns/references/use

# run 
nextflow run epi2me-labs/wf-alignment \
    --fastq '/srv/scratch/z3538133/009eccDNAEns/fastq/POU14119A1' \
    --references '/srv/scratch/z3538133/009eccDNAEns/references/use' \
    -profile singularity

#=====================================

### cd /srv/scratch/z3538133/009eccDNAEns/script
### dos2unix s01align_Katana.sh
### chmod +x s01align_Katana.sh
### qsub s01align_Katana.sh
