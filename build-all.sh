#!/bin/bash
source env-fenics.sh


./build-petsc.sh
./build-slepc.sh
./build-eigen.sh
./build-pybind.sh
./build-pythonmodules.sh
./build-fenicsmodules.sh
./build-dolfin.sh



cp env-fenics.sh ${PREFIX}
> ${PREFIX}/run-env-fenics.sh
echo "source ${PREFIX}env-fenics.sh" >> ${PREFIX}/run-env-fenics.sh
echo "export OMP_NUM_THREADS=1" >> ${PREFIX}/run-env-fenics.sh
echo "source \$PREFIX/share/dolfin/dolfin.conf" >> ${PREFIX}/run-env-fenics.sh

echo ">-----------------------------------------------------------------------------"
echo ">-----------------------------------------------------------------------------"
echo ">-----------------------------------------------------------------------------"
echo ">---- BUILD COMPLETE"
echo ">---- TO RUN YOUR APPLICATION: "
echo ">---- $ source PREFIX/run-env-fenics.sh "
echo ">---- $ python3 your_fenics_script.py"
echo ">-----------------------------------------------------------------------------"
echo ">-----------------------------------------------------------------------------"
echo ">-----------------------------------------------------------------------------"

