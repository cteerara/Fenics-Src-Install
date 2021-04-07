#!/bin/bash
source env-fenics.sh
cd ${BUILD_DIR}
git clone https://github.com/blechta/fenapack.git
cd fenapack
python3 -m pip install --prefix=${PREFIX} --no-cache-dir .
