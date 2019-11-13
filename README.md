# Fenics Install from Source
This contains the scripts used for local installation of FEniCS on CU-Boulder's Summit Cluster. General steps and source installation are listed below.

## Installing on CU-Boulder's Summit Cluster
1. Edit the PREFIX variable in env-fenics.sh file to the directory you want to install FEniCS on.
2. ssh to the scompile partition by typing
```
$ ssh scompile
```
3. run build-all.sh 
4. To run a job, you must source the run-env-fenics.sh file before running any code using FEniCS. 
```
source PREFIX/run-env-fenics.sh
python3 your_fenics_code.py
```

## Test
To build test, simply run the build-test.sh script. This will create a job script (.sbatch) in the test directory.
To run tests, do
```
$ sbatch test_1proc.sbatch
```
To get scaling data, you must run all the 1proc, 2proc, and 4proc tests. NOTE that since we are running on shas-test partition, we can only run one job at a time. Simply repeat the code above for all the .sbatch files. The output will be p1.out, p2.out, and p4.out respectively.

To monitor your job status, type:
```
squeue -u UsrName
```
where UsrName is your account name on the cluster. Should be the first two letters of your first then last name followed by a 4 digits number. 

Once you run all the test cases, you will see output files (p1.out, etc) in the test folder. 
# General guide for installing on other clusters
## Libraries needed to be installed
The following is a list of libraries required by FEniCS. The version combinations are what worked for me. The following is the order in which I installed the libraries. 
1. Compilers and mpi implementation 
    - intel/17.4 & impi/17.3
    - gcc/8.2.0 & openmpi/4.0.0
2. cmake
3. valgrind/3.1.1
4. python2 and python3.6
5. Boost/1.16.0 **Boost/1.17.0 DOES NOT work with the compiler version above**
7. petsc/3.12.0
8. slepsc/3.12.0
6. eigen/3.3.7
9. pybind11/2.2.3
10. python modules (installed via pip)
    - setuptools
    - numpy
    - sympy/1.1.1
    - vtk
    - h5py
    - numexpr
    - mpi4py
    - petsc4py/3.12.0
    - slepsc4py/3.12.0
    - ipython
    - ply
11. FEniCS modules
    - fenics-ffc (include FIAT, dijitso, UFL, FFC)
    - dolfin


## Install Configurations
If the libraries are not listed here, just follow the usual install procedure listed in the library's README. 

**${FOO_BUILD_DIR} means the directory containing the FOO source library (what extracted from tar.gz)** 

**${PREFIX} is the directory you install FEniCS in**
### Global Environmental Variables Definition 
It is useful to create a global path variable definition. This is the one used for our install on CU's Summit cluster. 

File called **env-fenics.sh**
```
#-- Compilers and module load
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
#-- Environment Variables
MPI_DIR="/curc/sw/intel/17.4/compilers_and_libraries_2017.4.196/linux/mpi/intel64"
PREFIX=${PREFIX}
export PATH=$PATH:${PREFIX}
BUILD_DIR=${PREFIX}build
export LD_LIBRARY_PATH=${PREFIX}lib:${PREFIX}lib64:$LD_LIBRARY_PATH
export PYTHONPATH=${PATH}:${PREFIX}lib/python3.6/site-packages/:${PREFIX}lib64/python3.6/site-packages/:${PYTHONPATH}
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:${PREFIX}lib64/pkgconfig

```

### petsc
``` sh
source env-fenics.sh
cd ${PETSC_BUILD_DIR}
python2 ./configure \
    --with-mpi-dir=${MPI_DIR} \
    --with-valgrind-dir=${VALGRIND_DIR} \
    COPTFLAGS="-O2 -march=native" \
                CXXOPTFLAGS="-O2 -march=native" \
                FOPTFLAGS="-O2 -march=native" \
                --download-fblaslapack \
                --download-metis \
                --download-parmetis \
                --download-suitesparse \
                --download-scalapack \
                --download-scotch \
                --download-hypre \
                --download-mumps \
                --download-ml \
                --with-debugging=0 \
                --with-shared-libraries \
                --prefix=${PREFIX}

make
make install
```
### slepsc
``` sh
source env-fenics.sh
export PETSC_DIR=${PREFIX}
cd ${SLEPSC_BUILD_DIR}
python2 ./configure --prefix=${PREFIX} && make SLEPC_DIR=${PWD} all && make install
```
### eigen
``` sh
source env-fenics.sh
cd ${EIGEN_BUILD_DIR}
mkdir build && cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=${PREFIX}
make install
```

### pybind11
``` sh
source env-fenics.sh
PYBIND11_VERSION=2.2.3
wget -nc --quiet https://github.com/pybind/pybind11/archive/v${PYBIND11_VERSION}.tar.gz
tar -xf v${PYBIND11_VERSION}.tar.gz
cd pybind11-${PYBIND11_VERSION}
mkdir build
cd build
cmake -DPYBIND11_TEST=off -DCMAKE_INSTALL_PREFIX=${PREFIX} ..
make install
```

### python modules
``` sh
source env-fenics.sh
export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}
PETSC4PY_VERSION="3.12.0"
SLEPC4PY_VERSION="3.12.0"
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed numpy
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed setuptools
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed h5py numexpr
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed mpi4py
python3 -m pip install --prefix=${PREFIX} --no-cache-dir https://bitbucket.org/petsc/petsc4py/downloads/petsc4py-${PETSC4PY_VERSION}.tar.gz
python3 -m pip install --prefix=${PREFIX} --no-cache-dir https://bitbucket.org/slepc/slepc4py/downloads/slepc4py-${SLEPC4PY_VERSION}.tar.gz
python3 -m pip install --prefix=${PREFIX} --no-cache-dir --ignore-installed ipython ply
python3 -m pip install --prefix=${PREFIX} --no-cache-dir --ignore-installed sympy==1.1.1
```

### Fenics FFC
``` sh
source env-fenics.sh
export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}
python3 -m pip install --upgrade --ignore-installed --prefix=${PREFIX} --no-cache-dir fenics-ffc
```

### Dolfin
``` sh
source env-fenics.sh
export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}
export BOOST_ROOT=${PREFIX}
FENICS_VERSION=$(python3 -c"import ffc; print(ffc.__version__)")
git clone --branch=$FENICS_VERSION https://bitbucket.org/fenics-project/dolfin
mkdir dolfin/build 
cd dolfin/build 
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX}  -DDOLFIN_ENABLE_VTK=true
make install 
cd ../..
cd dolfin/python
python3 -m pip install --upgrade --prefix=${PREFIX} --no-cache-dir --ignore-installed setuptools 
python3 -m pip install --prefix=${PREFIX} --no-cache-dir .
cd ../..

```
