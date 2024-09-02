# This module requires MPI and OpenMP
find_package(MPI REQUIRED COMPONENTS Fortran)
find_package(OpenMP REQUIRED COMPONENTS Fortran)

# Create a library
add_library(hello_world_lib hello_world_module.F90)

# Link the library with MPI and OpenMP
target_link_libraries(hello_world_lib PRIVATE MPI::MPI_Fortran OpenMP::OpenMP_Fortran)

# We also need to tell CMake where to find the Fortran module files
target_include_directories(hello_world_lib PUBLIC ${CMAKE_CURRENT_BINARY_DIR})
