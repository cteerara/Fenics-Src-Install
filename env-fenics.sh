#-- GNU compilers
#export CC=gcc
#export CXX=g++
#export FC=gfortran
#export MPICC=mpicc
#export MPICXX=mpicxx
#export MPIFC=mpifort

#module load gcc/8.2.0
#module load openmpi/4.0.0
#module load valgrind
#module load cmake
#module load python/3.5.1
#MPI_DIR="/curc/sw/openmpi/4.0.0/gcc/8.2.0"

#-- Intel compilers
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
MPI_DIR="/curc/sw/intel/17.4/compilers_and_libraries_2017.4.196/linux/mpi/intel64"


PREFIX=/projects/chte9199/fenics_install_intel/
export PATH=$PATH:${PREFIX}
BUILD_DIR=${PREFIX}build
export LD_LIBRARY_PATH=${PREFIX}lib:${PREFIX}lib64:$LD_LIBRARY_PATH
export PYTHONPATH=${PATH}:${PREFIX}lib/python3.6/site-packages/:${PREFIX}lib64/python3.6/site-packages/:${PYTHONPATH}
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:${PREFIX}lib64/pkgconfig

