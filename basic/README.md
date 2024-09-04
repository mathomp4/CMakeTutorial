# Simple Fortran Example

This is a very basic CMake tutorial code. It builds a simple Fortran MPI Hello World with optional OpenMP support.

![Made with VHS](https://vhs.charm.sh/vhs-6kxAsLzaO8lXyt1lxyVC5E.gif)

## Prerequisites

- CMake
- Fortran compiler

## Running CMake

### Modern CMake

```bash
cmake -B build -S .
```

### Old-Style CMake

```bash
mkdir build
cd build
cmake ..
```

### Specifying a Fortran Compiler

By default, CMake will look at the `FC` environment variable to determine the Fortran compiler. If you want to specify a different
compiler, you can do so either by setting `FC` in the environment or by specifying it on the command line with
`-DCMAKE_Fortran_COMPILER`.

```bash
cmake -B build -S . -DCMAKE_Fortran_COMPILER=flang-new
```

## Building

### Modern CMake

```bash
cmake --build build
```

### Old-Style CMake

```bash
cd build
make
```

## Running

```bash
./build/matmul-test
```

