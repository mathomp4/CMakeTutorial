cmake_minimum_required(VERSION 3.20)

project(HelloWorld
  LANGUAGES Fortran
  VERSION 1.0.0
  DESCRIPTION "A simple Hello World program using MPI and OpenMP"
)

enable_testing()

# We add the "ENABLE_OPENMP" option to allow the user to enable/disable
# OpenMP support in this file because we need to use the option for the
# CTest below
option(ENABLE_OPENMP "Enable OpenMP support" ON)

add_subdirectory(library)

find_package(MPI REQUIRED COMPONENTS Fortran)
add_executable(hello_world main.F90)
target_link_libraries(hello_world PRIVATE hello_world_lib MPI::MPI_Fortran)

install(TARGETS hello_world)

if(ENABLE_OPENMP)
  add_test(NAME HelloWorldTest COMMAND ${MPIEXEC_EXECUTABLE} ${MPIEXEC_NUMPROC_FLAG} 4 $<TARGET_FILE:hello_world>)
  set_property(TEST HelloWorldTest PROPERTY ENVIRONMENT "OMP_NUM_THREADS=2")
else()
  add_test(NAME HelloWorldTest COMMAND ${MPIEXEC_EXECUTABLE} ${MPIEXEC_NUMPROC_FLAG} 4 $<TARGET_FILE:hello_world>)
endif()
