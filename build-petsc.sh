#!/bin/bash
source env-fenics.sh
cd ${BUILD_DIR}
# curl -O http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-${PETSC_VERSION}.tar.gz
curl -O https://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-${PETSC_VERSION}.tar.gz
echo "Extracting petsc-${PETSC_VERSION}.tar.gz"
tar -xf petsc-${PETSC_VERSION}.tar.gz
cd petsc-${PETSC_VERSION}
VALGRIND_DIR="/curc/sw/valgrind/3.11.0"

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
