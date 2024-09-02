# MPI Example

This is a very basic CMake example which builds a simple Fortran MPI Hello World with optional OpenMP support.

## Prerequisites

- CMake
- Fortran compiler
- MPI
- OpenMP (optional)

## Running CMake

### Modern CMake

```bash
cmake -B build-omp -S . --install-prefix $(pwd)/install-omp
```

### Old-Style CMake

```bash
mkdir build-omp
cd build-omp
cmake .. -DCMAKE_INSTALL_PREFIX=../install-omp
```

## Building and Installing

### Modern CMake

```bash
cmake --build build-omp
cmake --install build-omp
```

### Old-Style CMake

```bash
cd build-omp
make
make install
```

## Running

```bash
OMP_NUM_THREADS=2 mpirun -np 4 ./install-omp/bin/hello_world
```

### Building without OpenMP

By default, OpenMP is enabled. To disable it, add `-DENABLE_OPENMP=OFF` to the CMake command.

We can use the fact that CMake allows for multiple builds and install directories to build the same code with and without OpenMP support.

```bash
cmake -B build-noomp -S . --install-prefix $(pwd)/install-noomp -DENABLE_OPENMP=OFF
cmake --build build-noomp && cmake --install build-noomp
mpirun -np 4 ./install-noomp/bin/hello_world
```

