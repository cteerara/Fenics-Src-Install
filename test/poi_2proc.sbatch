#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --time=00:30:00
#SBATCH --qos=testing
#SBATCH --partition=shas-testing
#SBATCH --output=testout.out
echo " Launching job with 2 processes"
echo " FEniCS compiled with intel compilers "
source PREFIX/run-env-fenics.sh
mpirun -np 2 python3 poi.py 
echo "============= 2 proc done ============= "
echo "========================================== "
