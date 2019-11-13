#!/bin/bash
source env-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed numpy
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed setuptools 
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed sympy
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed h5py numexpr
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed setuptools 
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed mpi4py
python3 -m pip install --prefix=${PREFIX} --no-cache-dir https://bitbucket.org/petsc/petsc4py/downloads/petsc4py-${PETSC_VERSION}.tar.gz
python3 -m pip install --prefix=${PREFIX} --no-cache-dir https://bitbucket.org/slepc/slepc4py/downloads/slepc4py-${SLEPC_VERSION}.tar.gz
python3 -m pip install --prefix=${PREFIX} --no-cache-dir --ignore-installed ipython ply
python3 -m pip install --prefix=${PREFIX} --no-cache-dir --ignore-installed sympy==1.1.1
