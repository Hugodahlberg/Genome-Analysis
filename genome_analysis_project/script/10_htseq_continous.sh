#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J 08_bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user huda4885@student.uu.se
# Load modules
module load bioinfo-tools htseq/0.12.4


# Commands

pathToBam="analysis/08_bwa/" 

htseq-count -f bam -r pos -t CDS -i ID -s reverse -n 2 ${pathToBam}ERR2036629* ${pathToBam}ERR2036630* ${pathToBam}ERR2036633* ${pathToBam}ERR2117288* ${pathToBam}ERR2117289* ${pathToBam}ERR2117292* analysis/04_prokka/annotated_without_nt.gff > analysis/09_htseq/readcounts_continous.txt

