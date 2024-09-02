module matmul_by_hand_mod

   implicit none (type, external)

   contains

   function matmul_by_hand(a,b) result(c)

      integer, intent(in) :: a(3,3), b(3,3)
      integer :: c(3,3)
      integer :: i, j, k

      do i = 1, 3
         do j = 1, 3
            do k = 1, 3
               c(i,j) = c(i,j) + a(i,k) * b(k,j)
            end do
         end do
      end do

   end function matmul_by_hand

end module matmul_by_hand_mod
