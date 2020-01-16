#!/bin/bash

#SBATCH --job-name="BUSCO"

#SBATCH -p short

#SBATCH -N 1

#SBATCH -n 40

#SBATCH -t 20:00:00 

#SBATCH --mail-user=nathan.wyatt@ndus.edu

#SBATCH --mail-type=BEGIN,END,FAIL

#SBATCH -o "stdout.%j.%N"

#SBATCH -e "stderr.%j.%N"

#modules
module load busco3

export BUSCO_CONFIG_FILE=/home/nathan.wyatt/programs/busco/config.ini
export AUGUSTUS_CONFIG_PATH=/home/nathan.wyatt/AUGUSTUS_CONFIG

run_BUSCO.py -i pa14_assembly.v7.fasta -l /reference/data/BUSCO/latest/ascomycota_odb9/ -o pa14.busco -m geno -c 40 -sp magnaporthe_grisea

 




#End of file
