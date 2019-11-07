#!/usr/bin/env bash

#SBATCH --job-name=check-gpu-unavailable
#SBATCH --output=check_gpu_unavailable.slurmout
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-00:10:00

env | sort
python check_gpu.py
nvidia-smi
sleep 100
