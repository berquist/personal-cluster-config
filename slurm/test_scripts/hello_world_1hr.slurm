#!/usr/bin/env bash

#SBATCH --job-name=hello-world-1hr
#SBATCH --output=hello_world_1hr.slurmout-%j
#SBATCH --output=hello_world_1hr.slurmerr-%j
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32

#SBATCH --time=0-02:00:00

echo "Time to sleep for 1 hour, zzz..."
sleep 1h
echo "You awaken, semi-rested."
