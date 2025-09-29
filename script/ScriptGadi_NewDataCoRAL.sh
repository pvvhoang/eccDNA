# This one is for running on Gadi

#=====================================
# 1) Prepare data
# bam file
# \script\s01align_Katana.sh
# raw: /g/data/ur22/Data/ecDNA_Ensieh/data
# bam: /g/data/ur22/vp8928/009eccDNAEns/data
#=====================================

#=====================================
# # 1.2) Tao moi truong ao
# cd /g/data/ur22/vp8928
# 
# # Cài đặt Miniconda bằng bash
# # Download
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# 
# # Install
# bash Miniconda3-latest-Linux-x86_64.sh
# 
# # Input yes if Terminal ask any question
# 
# # Delete bash file after installed
# rm -rf Miniconda3-latest-Linux-x86_64.sh
# 
# # Cập nhật Conda
# # Check current conda version (may need to close and open bash screen again)
# conda --version
# # /g/data/ur22/vp8928/miniconda3/bin/conda --version
# 
# # Update conda
# conda update conda

# Cách tạo môi trường ảo Python với Miniconda
# Tạo môi trường ảo Python trong Terminal
conda create -n CoRALEnv2 python=3.9.2
# conda create --name CoRALEnv2 python=3.9.2 R=4.3.1 -y

# Cách cài đặt packages cho môi trường ảo Python
# Cài đặt packages trong Terminal
conda activate CoRALEnv2

# With Pip
# pip install pandas

# With conda-forge
# conda install -c conda-forge pandas

# Cách xem danh sách môi trường ảo Python
# Way 1
conda env list

# Way 2
# conda info --envs

# remove env
# rm -rf venv
# conda remove -n ENV_NAME --all
#=====================================

#=====================================

# 2.1) install cnvkit (Please remember to install in the virtual environment)
# Should install cnvkit in a new virtual environment

# ref: https://github.com/etal/cnvkit

# Using Conda

conda env list
conda activate CoRALEnv2

pip list

# Configure the sources where conda will find packages
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

conda install cnvkit

conda install numpy==1.26.4 
conda install scipy 
conda install pandas==1.5.3 
conda install matplotlib reportlab biopython pyfaidx pysam pyvcf

# /g/data/ur22/vp8928/009eccDNAEns/AALong/CoRAL/requirements.txt
# cnvkit
# cvxopt
# gurobipy
# intervaltree
# matplotlib
# numpy
# pandas
# pysam

conda install cvxopt
# conda install gurobipy
pip install gurobipy
conda install intervaltree

R

> if (!require("BiocManager", quietly=TRUE)) install.packages("BiocManager")
> BiocManager::install("DNAcopy")

q()

# test
# git clone https://github.com/etal/cnvkit
cd /g/data/ur22/vp8928/009eccDNAEns/cnvkit/test/
make

#=====================================

#=====================================

# 2.2) install coRAL (Please remember to install in the virtual environment)
# Should install coRAL in a new virtual environment

# ref: https://github.com/AmpliconSuite/CoRAL

# Using Conda

conda env list
conda activate CoRALEnv2

# 1. Clone source
cd /g/data/ur22/vp8928/009eccDNAEns/AALong
git clone https://github.com/AmpliconSuite/CoRAL
cd CoRAL

# 2. Install packages (see 2.1 above, install cnvkit)

# 3. Download a Gurobi optimizer license (free for academic use)

# 4. Finish installing CNVkit dependencies (recommended) (see 2.1 above, install cnvkit)

#=====================================

#=====================================
# 3) Getting copy number calls

# Run BashScriptGadi_NewDataCN.sh

#=====================================

#=====================================

# 4) Command line arguments to run CoRAL

# 4.1) CoRAL.py seed
# seed: Identify and filter copy number gain regions where amplifications exist

# Run BashScriptGadi_NewData01Seed.sh

# 4.2.) CoRAL.py reconstruct
# reconstruct: Perform breakpoint graph construct and cycle decomposition on the amplified seeds.

# Run BashScriptGadi_NewData02reconstruct.sh

# 4.3.) CoRAL.py plot
# plot: Create plots of decomposed cycles and/or breakpoint graph sashimi plot.

# Run BashScriptGadi_NewData03plot.sh

#=====================================

#=====================================
# 5) Visualise
# https://github.com/AmpliconSuite/CycleViz?tab=readme-ov-file

source /g/data/ur22/vp8928/miniconda3/bin/activate
conda activate CoRALEnv2

# conda install intervaltree 'matplotlib-base>=2.0.0' numpy pyyaml

# cd /g/data/ur22/vp8928/009eccDNAEns/AALong
# git clone https://github.com/AmpliconSuite/CycleViz

# cd /g/data/ur22/vp8928/009eccDNAEns/AALong
# cd CycleViz/
# # (CoRALEnv2) [vp8928@gadi-login-09 CycleViz]$ echo $PWD
# # /g/data/ur22/vp8928/009eccDNAEns/AALong/CycleViz
# echo export CV_SRC=$PWD >> ~/.bashrc
# source ~/.bashrc

# conda install mscorefonts
# python3
# import matplotlib.font_manager
# matplotlib.font_manager._load_fontmanager(try_read_cache=False)
# exit()

cd /g/data/ur22/vp8928/009eccDNAEns/AALong
mkdir longread_visualisation
cd longread_visualisation

# sample 2
# amplicon 2
# $CV_SRC/convert_cycles_file.py -c ./../POU14119A2_amplicon2_cycles.txt -g ./../POU14119A2_amplicon2_graph.txt
$CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon2_graph.txt --cycles_file ./../POU14119A2_amplicon2_cycles.txt --cycle 3 --ref hg38 --gene_fontsize 7
# amplicon 3
# $CV_SRC/convert_cycles_file.py -c ./../POU14119A2_amplicon3_cycles.txt -g ./../POU14119A2_amplicon3_graph.txt
$CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file ./../POU14119A2_amplicon3_cycles.txt --cycle 1 --ref hg38 --gene_fontsize 7
$CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file ./../POU14119A2_amplicon3_cycles.txt --cycle 3 --ref hg38 --gene_fontsize 7
$CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file ./../POU14119A2_amplicon3_cycles.txt --cycle 4 --ref hg38 --gene_fontsize 7
$CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file ./../POU14119A2_amplicon3_cycles.txt --cycle 5 --ref hg38 --gene_fontsize 7

# sample 1
# amplicon 2
# $CV_SRC/convert_cycles_file.py -c ./../POU14119A1_amplicon2_cycles.txt -g ./../POU14119A1_amplicon2_graph.txt
# Bushman oncogene file for the gene_subset_file to make more readable plots
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 1 --ref hg38
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 2 --ref hg38
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 3 --ref hg38
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 4 --ref hg38
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 5 --ref hg38
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 6 --ref hg38
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 7 --ref hg38
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 8 --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 1 --gene_subset_file Bushman --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 2 --gene_subset_file Bushman --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 3 --gene_subset_file Bushman --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 4 --gene_subset_file Bushman --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 5 --gene_subset_file Bushman --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 6 --gene_subset_file Bushman --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 7 --gene_subset_file Bushman --ref hg38
$CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file ./../POU14119A1_amplicon2_cycles.txt --path 8 --gene_subset_file Bushman --ref hg38

conda deactivate

#=====================================
# #=====================================
# # 5) Visualise
# # https://github.com/AmpliconSuite/CycleViz?tab=readme-ov-file
# 
# source /g/data/ur22/vp8928/miniconda3/bin/activate
# conda activate CoRALEnv2
# 
# # conda install intervaltree 'matplotlib-base>=2.0.0' numpy pyyaml
# 
# # cd /g/data/ur22/vp8928/009eccDNAEns/AALong
# # git clone https://github.com/AmpliconSuite/CycleViz
# 
# # cd /g/data/ur22/vp8928/009eccDNAEns/AALong
# # cd CycleViz/
# # # (CoRALEnv2) [vp8928@gadi-login-09 CycleViz]$ echo $PWD
# # # /g/data/ur22/vp8928/009eccDNAEns/AALong/CycleViz
# # echo export CV_SRC=$PWD >> ~/.bashrc
# # source ~/.bashrc
# 
# # conda install mscorefonts
# # python3
# # import matplotlib.font_manager
# # matplotlib.font_manager._load_fontmanager(try_read_cache=False)
# # exit()
# 
# cd /g/data/ur22/vp8928/009eccDNAEns/AALong
# # mkdir visualisation
# cd visualisation
# 
# # sample 2
# # amplicon 2
# $CV_SRC/convert_cycles_file.py -c ./../POU14119A2_amplicon2_cycles.txt -g ./../POU14119A2_amplicon2_graph.txt
# $CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon2_graph.txt --cycles_file POU14119A2_amplicon2_BPG_converted_cycles.txt --cycle 3 --ref hg38 --gene_fontsize 4
# # amplicon 3
# $CV_SRC/convert_cycles_file.py -c ./../POU14119A2_amplicon3_cycles.txt -g ./../POU14119A2_amplicon3_graph.txt
# $CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file POU14119A2_amplicon3_BPG_converted_cycles.txt --cycle 1 --ref hg38 --gene_fontsize 4
# $CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file POU14119A2_amplicon3_BPG_converted_cycles.txt --cycle 3 --ref hg38 --gene_fontsize 4
# $CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file POU14119A2_amplicon3_BPG_converted_cycles.txt --cycle 4 --ref hg38 --gene_fontsize 4
# $CV_SRC/CycleViz.py -g ./../POU14119A2_amplicon3_graph.txt --cycles_file POU14119A2_amplicon3_BPG_converted_cycles.txt --cycle 5 --ref hg38 --gene_fontsize 4
# 
# # sample 1
# # amplicon 2
# $CV_SRC/convert_cycles_file.py -c ./../POU14119A1_amplicon2_cycles.txt -g ./../POU14119A1_amplicon2_graph.txt
# # Bushman oncogene file for the gene_subset_file to make more readable plots
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 1
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 2
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 3
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 4
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 5
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 6
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 7
# $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 8
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 1 --gene_subset_file Bushman
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 2 --gene_subset_file Bushman
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 3 --gene_subset_file Bushman
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 4 --gene_subset_file Bushman
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 5 --gene_subset_file Bushman
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 6 --gene_subset_file Bushman
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 7 --gene_subset_file Bushman
# # $CV_SRC/LinearViz.py -g ./../POU14119A1_amplicon2_graph.txt --cycles_file POU14119A1_amplicon2_BPG_converted_cycles.txt --path 8 --gene_subset_file Bushman
# 
# conda deactivate
# 
# #=====================================

#***