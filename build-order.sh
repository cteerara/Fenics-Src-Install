#!/bin/bash
set -e

source env-build-fenics.sh

./build-petsc.sh
./build-slepc.sh
./build-eigen.sh
./build-pybind11.sh
./build-pythonmodules.sh
./build-fenicsmodules.sh
./build-boost.sh
./build-dolfin.sh
