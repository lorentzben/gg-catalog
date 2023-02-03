#!/bin/bash

#SBATCH --partition=batch
#SBATCH --job-name=06_SAM_TO_FASTQ
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --mem=32gb

#Replace this with your UGA email to get notified on completion
#SBATCH --mail-user="bjl34716@uga.edu"
#SBATCH --mail-type=BEGIN,END

cd /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref

# create fastq for the individual reads

singularity shell docker://lorentzb/samtools 

samtools sort /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/merged_reads.sam | samtools view -f 4 | samtools fastq -s R0 -1 R1 -2 R2

cd /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/concat-ref

samtools sort /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/concat-ref/SRR15214153.sam > samtools view -f 4 > samtools fastq -s R0 -1 R1 -2 R2