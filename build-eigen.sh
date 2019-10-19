#!/bin/bash
source env-fenics.sh
cd ${BUILD_DIR}
wget http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz -O eigen.tar.gz
echo "Extracting eigen.tar.gz"
tar -xf eigen.tar.gz
cd eigen-eigen-323c052e1731
mkdir build
cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=${PREFIX}
make install
