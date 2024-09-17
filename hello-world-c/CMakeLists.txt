cmake_minimum_required(VERSION 3.20)
project(HelloWorldC)
find_package(MPI REQUIRED COMPONENTS C)
add_executable(hello_world hello-world.c)
target_link_libraries(hello_world PRIVATE MPI::MPI_C)

