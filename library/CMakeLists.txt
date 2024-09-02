option(ENABLE_OPENMP "Enable OpenMP support" ON)

if(ENABLE_OPENMP)
  message(STATUS "OpenMP support enabled")
  add_subdirectory(with-openmp)
else()
  message(STATUS "OpenMP support disabled")
  add_subdirectory(without-openmp)
endif()
