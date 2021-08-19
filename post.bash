# Fail fast
set -o errexit

# Download and extract SCIP
readonly scip_version="7.0.2"
readonly scip_filename="scipoptsuite-${scip_version}"
wget "https://scipopt.org/download/release/${scip_filename}.tgz"
tar -xzf "${scip_filename}.tgz"

# Install conda packages
mamba create --quiet --yes --name l2c --channel conda-forge \
	compilers cmake make gmp zlib \
	python=3.9 pip cython matplotlib pandas scipy \
	ipython
conda activate l2c

# Missing flag for building SCIP
export LDFLAGS="-lrt ${LDFLAGS}"

# Build and install SCIP
cmake -B build -S "${scip_filename}" \
	-D CMAKE_BUILD_TYPE=Release \
	-D PARASCIP=ON \
	-D PAPILO=OFF \
	-D GCG=OFF \
	-D ZIMPL=OFF \
	-D BOOST=OFF \
	-D IPOPT=OFF
cmake --build build --parallel
cmake --install build --prefix "${CONDA_PREFIX}"
pip install git+https://github.com/ds4dm/PySCIPOpt.git@gz
