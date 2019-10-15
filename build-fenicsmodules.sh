#!/bin/bash
source env-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

PETSC4PY_VERSION="3.12.0"
SLEPC4PY_VERSION="3.12.0"

python3 -m pip install --upgrade --ignore-installed --prefix=${PREFIX} --no-cache-dir fenics-ffc 

 
