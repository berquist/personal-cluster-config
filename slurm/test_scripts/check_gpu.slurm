#!/usr/bin/env bash

#SBATCH --job-name=check-gpu
#SBATCH --output=check_gpu.slurmout
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
# sbatch: error: Batch job submission failed: Requested node configuration is not available
# #SBATCH --gres=gpu:rtx2070:2
# #SBATCH --gpus=2
#
#SBATCH --gpus-per-task=1
#SBATCH --time=0-00:10:00

env | sort
python check_gpu.py
nvidia-smi
sleep 100
