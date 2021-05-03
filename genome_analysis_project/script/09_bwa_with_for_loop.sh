#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J 08_bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user huda4885@student.uu.se
# Load modules
module load bioinfo-tools bwa samtools


# Commands

cd $SNIC_TMP

mkdir input1
mkdir input2
mkdir reference

cp ~/genome_analysis/Genome-Analysis/genome_analysis_project/analysis/04_prokka/annotated.fn* reference
cp /proj/g2021012/3_Christel_2017/RNA_trimmed_reads/ERR*_P1* input1
cp /proj/g2021012/3_Christel_2017/RNA_trimmed_reads/ERR*_P2* input2

cd input1

for i in * 
	do
            PREFIX=${i%_*}
            bwa mem -t 2 ../reference/annotated.fna $i ../input2/${PREFIX}_P2.trim.fastq.gz > ${PREFIX}trimmed.sam
            samtools sort -@ 2 -o ${PREFIX}trimmed.sorted.bam ${PREFIX}trimmed.sam
            cp ${PREFIX}trimmed.sorted.bam ~/genome_analysis/Genome-Analysis/genome_analysis_project/analysis/08_bwa
        done
