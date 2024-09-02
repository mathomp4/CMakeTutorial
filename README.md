# CMake Tutorial

This is a very basic CMake tutorial code. It builds a simple Fortran MPI Hello World with optional OpenMP support.

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

### Old CMake

```bash
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install
```

### OpenMP

By default, OpenMP is enabled. To disable it, add `-DENABLE_OPENMP=OFF` to the CMake command.

## Building

### Modern CMake

```bash
cmake --build build
```

### Old-School CMake

```bash
cd build
make
```

## Installing

### Modern CMake

```bash
cmake --install build
```

### Old-School CMake

```bash
cd build
make install
```
