#!/bin/bash
source env-fenics.sh
cp env-fenics.sh ${PREFIX}
cp run-env-fenics.sh ${PREFIX}
./build-petsc.sh
./build-slepc.sh
./build-eigen.sh
./build-pybind.sh
./build-pythonmodules.sh
./build-fenicsmodules.sh
./build-boost.sh
./build-dolfin.sh




