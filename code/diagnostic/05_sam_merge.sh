#!/bin/bash

#SBATCH --partition=batch
#SBATCH --job-name=05_SAM_MERGE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --mem=32gb

#Replace this with your UGA email to get notified on completion
#SBATCH --mail-user="bjl34716@uga.edu"
#SBATCH --mail-type=BEGIN,END

cd /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref

# sort gal-gal

singularity run docker://lorentzb/samtools samtools sort /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/gal-gal/SRR15214153_gal_gal.sam -o /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/gal-gal/SRR15214153_gal_gal_sorted.sam

# sort glycine-max

singularity run docker://lorentzb/samtools samtools sort /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/glycine-max/SRR15214153_glycine_max.sam -o /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/glycine-max/SRR15214153_glycine_max_sorted.sam

# sort zea-mays

singularity run docker://lorentzb/samtools samtools sort /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/zea-mays/SRR15214153_zea_mays.sam -o /scratch/bjl34716/nf_dev/gg-catalog/compare-minimap/indv-ref/zea-mays/SRR15214153_zea_mays_sorted.sam

# merge sams

singularity run docker://lorentzb/samtools samtools merge merged_reads.sam */*_sorted.sam 


