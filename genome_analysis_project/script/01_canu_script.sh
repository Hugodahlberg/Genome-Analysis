#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 16:00:00
#SBATCH -J 01_canu
#SBATCH --mail-type=ALL
#SBATCH --mail-user huda4885@student.uu.se
# Load modules
module load bioinfo-tools
module load canu
# Your commands
canu -d analysis/01_canu/ -p assembly  genomeSize=3m -pacbio rawdata/DNA_raw_data/ERR2028*
