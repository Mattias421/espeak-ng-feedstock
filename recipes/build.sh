#!/bin/bash
set -x -e
set -o pipefail

echo ${PREFIX}
echo ${CONDA_PREFIX}
echo ${CONDA_BLD_PATH}

./autogen.sh
./configure --prefix="${PREFIX}"
make -j1

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done