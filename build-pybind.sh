#!/bin/bash
source env-fenics.sh
cd ${BUILD_DIR}
wget -nc --quiet https://github.com/pybind/pybind11/archive/v${PYBIND11_VERSION}.tar.gz
echo "Extracting Pybind11 file v${PYBIND11_VERSION}.tar.gz"
tar -xf v${PYBIND11_VERSION}.tar.gz 
cd pybind11-${PYBIND11_VERSION}
mkdir build 
cd build 
cmake -DPYBIND11_TEST=off -DCMAKE_INSTALL_PREFIX=${PREFIX} .. 
make install


