#!/bin/bash
#SBATCH --job-name=SCFT 		
#SBATCH --output=logs/scft.log-%A-%a 	
#SBATCH --partition=xeon-p8
#SBATCH --nodes=1
#SBATCH --array=1-24

# Initializa Modules
source /etc/profile

# Load ICC Module
module load icc/2019.5

# Specify Input File
INPUT_FILE=./inputFile.dat

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "Number of Tasks: " $SLURM_ARRAY_TASK_COUNT

mkdir -p output/task${SLURM_ARRAY_TASK_ID}
cp ./wrapper.py output/task${SLURM_ARRAY_TASK_ID}/
cp ./inputFile.dat output/task${SLURM_ARRAY_TASK_ID}/
cp ./a.out output/task${SLURM_ARRAY_TASK_ID}/
cd output/task${SLURM_ARRAY_TASK_ID}

# Call your script
python wrapper.py $INPUT_FILE $SLURM_ARRAY_TASK_ID $SLURM_ARRAY_TASK_COUNT
