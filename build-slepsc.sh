#!/bin/bash
source env-fenics.sh
export PETSC_DIR=${PREFIX}
SLEPC_VERSION="3.12.0"
cd slepc-${SLEPC_VERSION}

python2 ./configure --prefix=${PREFIX} && make SLEPC_DIR=${PWD} all && make install
