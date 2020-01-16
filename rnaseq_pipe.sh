#!/bin/bash

#SBATCH --job-name="rnaseq"

#SBATCH -p short

#SBATCH -N 1

#SBATCH -n 40

#SBATCH -t 48:00:00 

#SBATCH --mail-user=nathan.wyatt23@gmail.com

#SBATCH --mail-type=BEGIN,END,FAIL

#SBATCH -o "stdout.%j.%N"

#SBATCH -e "stderr.%j.%N"

module load hisat2
module load samtools
module load stringtie


#build index of the reference fasta for aligments
hisat2-build -f -p 40 pa14_assembly.v7.fasta pa14

#align rna sequencing and convert to sorted bam files
#for sample in *.fastq.gz 
#	do
#	hisat2 --max-intronlen 5000 -p 40 -x pa14 -U $sample -S $sample.sam
#	done

#for sample in *.sam 
#	do
#	samtools view -@ 40 -b $sample -o $sample.bam
#	done

#for sample in *.bam 
#	do 
#	samtools sort -@ 40 -o $sample.sorted.bam $sample
#	done   


#use stringtie to assemble transcripts 
#for sample in *.sorted.bam 
#	do
#	stringtie $sample -o $sample.stringtie.gtf -p 40  
#	done

#merge transcripts from different samples into a unified set of non-redundant transcripts

stringtie --merge -o pa14Merged.gtf *.gtf



#End of file
