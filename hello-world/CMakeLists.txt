cmake_minimum_required(VERSION 3.20)

project(HelloWorld
  LANGUAGES Fortran
  VERSION 1.0.0
  DESCRIPTION "A simple Hello World program using MPI and OpenMP"
)

add_subdirectory(library)

find_package(MPI REQUIRED COMPONENTS Fortran)

add_executable(hello_world main.F90)
target_link_libraries(hello_world PRIVATE hello_world_lib MPI::MPI_Fortran)

install(TARGETS hello_world
  DESTINATION bin
)
