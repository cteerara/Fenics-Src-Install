#!/bin/bash
source env-fenics.sh
export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}
python3 -m pip install --upgrade --ignore-installed --prefix=${PREFIX} --no-cache-dir vtk
python3 -m pip install --upgrade --ignore-installed --prefix=${PREFIX} --no-cache-dir fenics-ffc 

 
