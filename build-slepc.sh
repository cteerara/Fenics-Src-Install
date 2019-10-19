#!/bin/bash
source env-fenics.sh
export PETSC_DIR=${PREFIX}
cd ${BUILD_DIR}
curl -O http://slepc.upv.es/download/distrib/slepc-${SLEPC_VERSION}.tar.gz 
echo "Extracting slepc-${SLEPC_VERSION}.tar.gz"
tar -xf slepc-${SLEPC_VERSION}.tar.gz
cd slepc-${SLEPC_VERSION}

python2 ./configure --prefix=${PREFIX} && make SLEPC_DIR=${PWD} all && make install
