cmake_minimum_required(VERSION 3.20)
project(example LANGUAGES Fortran)
add_executable(matmul-test main.F90 matmul_by_hand.F90)
