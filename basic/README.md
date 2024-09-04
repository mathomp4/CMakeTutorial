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

