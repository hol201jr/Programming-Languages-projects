program cpu_time
        implicit none
        
integer i,N,j,ran

real :: start,finish
real, dimension(:,:), allocatable :: A
real :: r(10,10)
  real z
  !print *, 'Enter a value for N'
  !READ *, N
      N =10  

        CALL cpu_time(start)
ALLOCATE(A(N,N+1))
z=0

    do i = 1,10
         do j=1,10
         CALL RANDOM_NUMBER(r)
         A(i,j) = r
           z = z + A(i,j)
   ! print *,z
    end do
        end do
        print '(5(f8.6))',r
CALL cpu_time(finish)

print '("Time = ",f6.3 ," seconds. ")',finish-start
        stop



end program cpu_time