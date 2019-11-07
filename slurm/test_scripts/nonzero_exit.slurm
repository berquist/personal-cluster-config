#!/usr/bin/env bash

#SBATCH --job-name=nonzero-exit
#SBATCH --output=nonzero-exit.slurmout
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-00:10:00

echo "About to exit with code 23"
exit 23
