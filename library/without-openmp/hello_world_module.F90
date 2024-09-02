module hello_world_mod

   use mpi_f08

   implicit none (type, external)

   contains

      subroutine hello_world()

         type(MPI_Comm) :: comm
         integer :: myid, npes, ierror
         integer :: name_length

         character(len=MPI_MAX_PROCESSOR_NAME) :: processor_name

         comm = MPI_COMM_WORLD

         call MPI_Comm_Rank(comm,myid,ierror)
         call MPI_Comm_Size(comm,npes,ierror)
         call MPI_Get_Processor_Name(processor_name,name_length,ierror)

         write (*,'(A,I0,A,I0,A,A)') &
            "Hello from process ", myid, " of ", npes, " on processor ", trim(processor_name)

      end subroutine hello_world

end module hello_world_mod
