#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:45:00
#SBATCH -J 07_fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user huda4885@student.uu.se
# Load modules
module load bioinfo-tools FastQC/0.11.9

#Commands

fastqc -t 2 ../../rawdata/RNA_trimmed_reads/ERR2036629_*.trim.fastq.gz -o .


