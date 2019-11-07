#!/usr/bin/env bash

#SBATCH --job-name=hello-world-gpu
#SBATCH --output=hello_world_gpu.slurmout
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-00:10:00
#SBATCH --gpus=1

echo "Hello, world!"
sleep 100
