# MPI Example

This is a very basic CMake example which builds a simple Fortran MPI Hello World with optional OpenMP support.

![Made with VHS](https://vhs.charm.sh/vhs-1M2fSyvr2QZ9NxEF2zVMr1.gif)

## Prerequisites

- CMake
- Fortran compiler
- MPI
- OpenMP (optional)

## Running CMake

### Modern CMake

```bash
cmake -B build -S . --install-prefix $(pwd)/install
```

### Old-Style CMake

```bash
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install
```

### Examining the CMake Output

You will notice that CMake was able to detect the Fortran compiler and MPI stack we have loaded. You can also see that it detected
that we have OpenMP available as well.

### Specifying a Fortran Compiler

By default, CMake will look at the `FC` environment variable to determine the Fortran compiler. If you want to specify a different
compiler, you can do so either by setting `FC` in the environment or by specifying it on the command line with
`-DCMAKE_Fortran_COMPILER`.

```bash
cmake -B build -S . --install-prefix=$(pwd)/install -DCMAKE_Fortran_COMPILER=flang-new
```

## Building and Installing

### Modern CMake

```bash
cmake --build build
cmake --install build
```

### Old-Style CMake

```bash
cd build
make
make install
```

## Testing

This example has a CTest which run the executable with 4 processes (and 2 threads per process if OpenMP is enabled).

### Modern CMake (CMake 3.20+)

```bash
ctest --test-dir build
```

### Old-Style CMake

```bash
cd build
ctest
```

You can also run `make test` in the build directory.

#### Verbose Testing

To see the output of the tests, you can run the tests in verbose mode by adding `-V` to the `ctest` command. To see output when the
tests fail, you can add `--output-on-failure`.

## Running

```bash
OMP_NUM_THREADS=2 mpirun -np 4 ./install/bin/hello_world
```

### Building without OpenMP

By default, OpenMP is enabled. To disable it, add `-DENABLE_OPENMP=OFF` to the CMake command.

We can use the fact that CMake allows for multiple builds and install directories to build the same code with and without OpenMP support.

```bash
cmake -B build-noomp -S . --install-prefix $(pwd)/install-noomp -DENABLE_OPENMP=OFF
cmake --build build-noomp && cmake --install build-noomp
ctest --test-dir build-noomp
mpirun -np 4 ./install-noomp/bin/hello_world
```

![Made with VHS](https://vhs.charm.sh/vhs-1GUSxBpl2geArLpb4wxZ2s.gif)

