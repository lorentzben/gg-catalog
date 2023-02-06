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

singularity run docker://lorentzb/samtools samtools sort /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/merged_reads.sam -o sorted_merged.sam
singularity run docker://lorentzb/samtools samtools view -f 4 sorted_merged.sam -o viewed_sorted_merged.sam 
singularity run docker://lorentzb/samtools samtools fastq -1 merged-clean.fastq.gz -n viewed_sorted_merged.sam

cd /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/concat-ref

singularity run docker://lorentzb/samtools samtools sort /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/concat-ref/SRR15214153.sam -o sorted_concat.sam
singularity run docker://lorentzb/samtools samtools view -f 4 sorted_concat.sam -o viewed_sorted_concat.sam
singularity run docker://lorentzb/samtools samtools fastq -1 concat-db-clean.fastq.gz -n viewed_sorted_concat.sam

# TODO rm -rf *.sam 