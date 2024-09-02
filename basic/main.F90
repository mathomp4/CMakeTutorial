program main

   use matmul_by_hand_mod
   implicit none (type, external)

   integer :: a(3,3) = reshape([1,2,3,4,5,6,7,8,9], [3,3])
   integer :: b(3,3) = reshape([9,8,7,6,5,4,3,2,1], [3,3])
   integer :: c(3,3) = 0
   integer :: d(3,3) = 0
   integer :: i, j, k

   ! Matrix multiplication by hand
   c = matmul_by_hand(a,b)

   ! Matrix multiplication with intrinsic function
   d = matmul(a,b)

   ! Check if the results are the same
   if (all(c == d)) then
      print *, "Results are the same"
   else
      print *, "Results are different"
   end if

end program main
