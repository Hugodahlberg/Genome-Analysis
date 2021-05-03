#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 2:00:00
#SBATCH -J 12_htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user huda4885@student.uu.se
# Load modules
module load bioinfo-tools htseq/0.12.4 samtools


# Commands

sample=ERR2036630*.bam 

samtools index $sample
htseq-count -f bam -r pos -t CDS -i ID -s reverse $sample ../04_prokka/annotated_without_nt.gff > ../09_htseq/${sample}_cont.counts.txt


