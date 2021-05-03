#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J 08_bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user huda4885@student.uu.se
# Load modules
module load bioinfo-tools bwa samtools







bwa mem -t 2 analysis/04_prokka/annotated.fna  rawdata/RNA_trimmed_reads/ERR2036629_P1.trim.fastq.gz rawdata/RNA_trimmed_reads/ERR2036629_P2.trim.fastq.gz > analysis/08_bwa/ERR2036629_aligned.sam

