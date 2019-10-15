#!/bin/bash
source env-fenics.sh

cd xz-5.2.2
./configure --prefix=${PREFIX}

make
make install
#		--with-mpi-include=${mpidir}/include \
#		--with-mpi-lib=${mpidir}/lib \
#		--with-mpi-bin=${mpidir}/bin \
#		--with-cc=$CC \
#		--with-cxx=$CXX \
#		--with-fc=$FC \
