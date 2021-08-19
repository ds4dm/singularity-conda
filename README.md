# singularity-conda
A Singularity recipe that properly initialize a conda environment.

Singularity recipes are build using the Shell (`sh`) interpreter, while Conda cannot be activated
with that interpreter.
This recipe installs [Micromamba](https://github.com/mamba-org/mamba), a faster Conda alternative,
and execute the instructions provided by the user in the `post.bash` script using bash and a properly
initialized Conda installation.
The `conda` executable is available along the faster `mamba` alternative.

Build the image with
```shell
sudo singularity build conda.simg conda.def
```

And use with
```shell
singularity shell conda.simg
```
