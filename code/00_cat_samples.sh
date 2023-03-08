#!/bin/bash

#SBATCH --partition=batch
#SBATCH --job-name=Zhang_DATA
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH --mem=32gb

#Replace this with your UGA email to get notified on completion
#SBATCH --mail-user="bjl34716@uga.edu"
#SBATCH --mail-type=BEGIN,END,

cd /scratch/bjl34716/gg-catalog/zhang/reads

#duodenum SRR19683891 
#jejunum SRR19732514 SRR19726169 
#ileum SRR19736685 
#cecum SRR15214153 SRR19732730 
#colorectum SRR19683890  SRR19732729 

cat duodenum/SRR19683891.fastq > duodenum/duodenum.fastq

cat jejunum/SRR19732514.fastq jejunum/SRR19726169.fastq > jejunum/jejunum.fastq

cat ileum/SRR19736685.fastq > ileum/ileum.fastq

cat cecum/SRR15214153.fastq cecum/SRR19732730.fastq > cecum/cecum.fastq

cat colorectum/SRR19683890.fastq colorectum/SRR19732729.fastq > colorectum/colorectum.fastq
