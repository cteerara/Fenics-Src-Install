#-- Setup prefix location. Please insert the ABSOLUTE path to the directory you want fenics to be installed.  
PREFIX=/projects/chte9199/fenics_test/fenics_install_test/
BUILD_DIR=${PREFIX}/build/
mkdir -p ${BUILD_DIR}

#-- Packages versions
PETSC_VERSION="3.12.0"
SLEPC_VERSION="3.12.0"
PYBIND11_VERSION=2.2.3

#-- Copy this file to prefix location.
cp env-fenics.sh ${PREFIX}

#-- Intel compilers
PYVER=3.6
export CC=icc
export CXX=icpc
export FC=ifort
export MPICC=mpiicc
export MPICXX=mpiicpc
export MPIFC=mpiifort
module load intel 
module load impi/17.3 
module load valgrind
module load cmake
module load python/3.6.5
module load hdf5
MPI_DIR="/curc/sw/intel/17.4/compilers_and_libraries_2017.4.196/linux/mpi/intel64"

#-- Setup paths
export PATH=$PATH:${PREFIX}
export LD_LIBRARY_PATH=${PREFIX}/lib:${PREFIX}/lib64:$LD_LIBRARY_PATH
export PYTHONPATH=${PATH}:${PREFIX}/lib/python${PYVER}/site-packages/:${PREFIX}/lib64/python${PYVER}/site-packages/:${PYTHONPATH}
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:${PREFIX}/lib64/pkgconfig

