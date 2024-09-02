# This module requires MPI
find_package(MPI REQUIRED COMPONENTS Fortran)

# We will make OpenMP an optional dependency
option(ENABLE_OPENMP "Enable OpenMP support" ON)
if(ENABLE_OPENMP)
  message(STATUS "OpenMP support enabled")
  find_package(OpenMP REQUIRED COMPONENTS Fortran)
  set(srcs hello_world_module_with_openmp.F90)
else()
  message(STATUS "OpenMP support disabled")
  set(srcs hello_world_module_without_openmp.F90)
endif()

# Create a library that uses MPI and OpenMP
add_library(hello_world_lib ${srcs})

# Link the library with MPI and OpenMP
target_link_libraries(hello_world_lib PRIVATE MPI::MPI_Fortran)
if(ENABLE_OPENMP)
  target_link_libraries(hello_world_lib PRIVATE OpenMP::OpenMP_Fortran)
endif()

# We also need to tell CMake where to find the Fortran module files
target_include_directories(hello_world_lib PUBLIC ${CMAKE_CURRENT_BINARY_DIR})
