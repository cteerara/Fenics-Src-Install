#!/bin/bash
source env-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

PETSC4PY_VERSION="3.12.0"
SLEPC4PY_VERSION="3.12.0"
#export BOOST_ROOT=${PREFIX}

FENICS_VERSION=$(python3 -c"import ffc; print(ffc.__version__)")
echo FENICS_VERSION $FENICS_VERSION

cd ${BUILD_DIR}
git clone --branch=$FENICS_VERSION https://bitbucket.org/fenics-project/dolfin

mkdir -p dolfin/build 
cd dolfin/build 
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX}  -DDOLFIN_ENABLE_VTK=true -DDOLFIN_ENABLE_HDF5:BOOL=ON -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/curc/sw/hdf5/1.10.1/impi/17.3/intel/17.4/bin/h5pcc
make install 
cd ../..
cd dolfin/python
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed setuptools 
python3 -m pip install --prefix=${PREFIX} --no-cache-dir .
cd ../..

#git clone --branch=$FENICS_VERSION https://bitbucket.org/fenics-project/mshr
#mkdir mshr/build   && cd mshr/build   && cmake .. && make install && cd ../..
#cd mshr/python   && pip3 install . && cd ../..
