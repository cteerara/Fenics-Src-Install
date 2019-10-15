#!/bin/bash
source env-fenics.sh
cd eigen
mkdir build
cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=${PREFIX}
make install
