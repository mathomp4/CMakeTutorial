program main

   use mpi_f08
   use hello_world_mod

   implicit none (type, external)

   integer :: ierror

   call MPI_Init(ierror)

   call hello_world()

   call MPI_Finalize(ierror)

end program main
