#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:30:00
#SBATCH --qos=testing
#SBATCH --partition=shas-testing
#SBATCH --output=testout.out
echo " Launching job with 1 processes"
echo " FEniCS compiled with intel compilers "
source PREFIX/run-env-fenics.sh
mpirun -np 1 python3 poi.py 
echo "============= 1 proc done ============= "
echo "========================================== "
