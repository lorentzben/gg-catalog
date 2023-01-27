#!/bin/bash

#SBATCH --partition=batch
#SBATCH --job-name=GENERATE_INDEX
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --mem=16gb

#Replace this with your UGA email to get notified on completion
#SBATCH --mail-user="bjl34716@uga.edu"
#SBATCH --mail-type=BEGIN,END,


SUBDIR=$(pwd)

if [[ ! -d /scratch/bjl34716/gg-catalog/minimap2/index ]]; then
    mkdir -p /scratch/bjl34716/gg-catalog/minimap2/index
fi

cd /scratch/bjl34716/gg-catalog/minimap2/index

# make chicken index
singularity run docker://lorentzb/minimap2:1.0 minimap2 -d galgal.mmi /scratch/bjl34716/gg-catalog/refs/GalGal-reference.fna.gz

# make maize index
singularity run docker://lorentzb/minimap2:1.0 minimap2 -d zeamays.mmi /scratch/bjl34716/gg-catalog/refs/ZeaMays-reference.fna.gz

# make soybean index
singularity run docker://lorentzb/minimap2:1.0 minimap2 -d glycinemax.mmi /scratch/bjl34716/gg-catalog/refs/GlycineMax-reference.fna.gz