#!/bin/bash
source env-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}
cd ${BUILD_DIR}
wget https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz
echo "Extracting boost ..."
tar -xf boost_1_61_0.tar.gz

cd boost_1_61_0
./bootstrap.sh --prefix=${PREFIX}
./b2 install

