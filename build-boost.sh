#!/bin/bash
source env-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

PETSC4PY_VERSION="3.12.0"
SLEPC4PY_VERSION="3.12.0"

cd boost_1_61_0
./bootstrap.sh --prefix=${PREFIX}
./b2 install

