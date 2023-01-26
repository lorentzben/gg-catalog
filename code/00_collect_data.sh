#!/bin/bash

#SBATCH --partition=batch
#SBATCH --job-name=Zhang_DATA
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --mem=8gb

#Replace this with your UGA email to get notified on completion
#SBATCH --mail-user="bjl34716@uga.edu"
#SBATCH --mail-type=BEGIN,END,

ml SRA-Toolkit/2.11.1-centos_linux64
SUBDIR=$(pwd)

if [[ ! -d /scratch/bjl34716/gg-catalog/zhang/reads ]]; then
    mkdir -p /scratch/bjl34716/gg-catalog/zhang/reads
fi

cd /scratch/bjl34716/gg-catalog/zhang/reads

#duodenum SRR19683891 
#jejunum SRR19732514 SRR19726169 
#ileum SRR19736685 
#cecum SRR15214153 SRR19732730 
#colorectum SRR19683890  SRR19732729 

mkdir duodenum 
cd duodenum

prefetch --max-size 100G SRR19683891 
fastq-dump --split-3 SRR19683891
cd ..

mkdir jejunum 
cd jejunum

prefetch --max-size 100G SRR19732514 SRR19726169 
fastq-dump --split-3 SRR19732514 SRR19726169
cd ..

mkdir ileum
cd ileum

prefetch --max-size 100G SRR19736685
fastq-dump --split-3 SRR19736685
cd ..

mkdir cecum
cd cecum

prefetch --max-size 100G SRR15214153 SRR19732730 
fastq-dump --split-3 SRR15214153 SRR19732730 
cd ..

mkdir colorectum
cd colorectum

prefetch --max-size 100G SRR19683890  SRR19732729 
fastq-dump --split-3 SRR19683890  SRR19732729
cd ..

if [[ ! -d /scratch/bjl34716/gg-catalog/refs ]]; then
    mkdir -p /scratch/bjl34716/gg-catalog/refs
fi

cd /scratch/bjl34716/gg-catalog/refs

# collect chicken genome from NCBI 
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/699/485/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.fna.gz -O GalGal-reference.fna.gz

# collect maize genome from NCBI
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/902/167/145/GCF_902167145.1_Zm-B73-REFERENCE-NAM-5.0/GCF_902167145.1_Zm-B73-REFERENCE-NAM-5.0_genomic.fna.gz -O ZeaMays-reference.fna.gz

# collect soybean genome from NCBI
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/515/GCF_000004515.6_Glycine_max_v4.0/GCF_000004515.6_Glycine_max_v4.0_genomic.fna.gz -O GlycineMax-reference.fna.gz