#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=00:30:00
#SBATCH --qos=testing
#SBATCH --partition=shas-testing
#SBATCH --output=p4.out
echo " Launching job with 4 processes"
echo " FEniCS compiled with intel compilers "
source PREFIX/run-env-fenics.sh
mpirun -np 4 python3 poi.py 
echo "============= 4 proc done ============= "
echo "========================================== "
