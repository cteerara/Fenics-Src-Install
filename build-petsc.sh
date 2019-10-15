#!/bin/bash
source env-fenics.sh
VERSION="3.12.0"
cd petsc-${VERSION}
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
#		--with-mpi-include=${mpidir}/include \
#		--with-mpi-lib=${mpidir}/lib \
#		--with-mpi-bin=${mpidir}/bin \
#		--with-cc=$CC \
#		--with-cxx=$CXX \
#		--with-fc=$FC \
