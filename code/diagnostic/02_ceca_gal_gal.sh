#!/bin/bash

#SBATCH --partition=batch
#SBATCH --job-name=02_MINIMAP2_CECA
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --mem=32gb

#Replace this with your UGA email to get notified on completion
#SBATCH --mail-user="bjl34716@uga.edu"
#SBATCH --mail-type=BEGIN,END

cd /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/gal-gal

singularity run docker://lorentzb/minimap2:1.0 minimap2 -ax map-hifi /scratch/bjl34716/gg-catalog/refs/GalGal-reference.fna.gz /scratch/bjl34716/gg-catalog/zhang/reads/cecum/SRR15214153.fastq > SRR15214153_gal_gal.sam