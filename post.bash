# Fail fast
set -o errexit

# Fill this file with your environment creation
mamba create --quiet --channel conda-forge --name project-name python=3.9 numpy
