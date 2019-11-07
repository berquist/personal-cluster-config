#!/usr/bin/env bash

#SBATCH --job-name=hello-world
#SBATCH --output=hello_world.slurmout
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-00:10:00

echo "Hello, world!"
sleep 100
