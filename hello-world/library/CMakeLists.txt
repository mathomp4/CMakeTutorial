# ENABLE_OPENMP is a boolean option to enable OpenMP support
# It is set in the main CMakeLists.txt file

if(ENABLE_OPENMP)
  message(STATUS "OpenMP support enabled")
  add_subdirectory(with-openmp)
else()
  message(STATUS "OpenMP support disabled")
  add_subdirectory(without-openmp)
endif()
