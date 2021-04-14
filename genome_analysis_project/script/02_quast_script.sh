#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J 02_quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user huda4885@student.uu.se
# Load modules
module load bioinfo-tools
module load quast
# Your commands
quast.py -r reference/reference/OBMB01.fasta --threads 2 analysis/01_canu/assembly.contigs.fasta 
