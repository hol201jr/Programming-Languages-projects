!Author: Manuel Holguin
!Date: 09/26/2022
!Description: Purpose of the program is to test the runtime speed of the lexical analyzer
!              and the parser. This fortran code runs Gaussian elimination on matrices
!               of 250,500,1000,1500,2000. Could no implemente input from user was 
!               getting a traceback error and the code would not execute. Had to directly
!               input the values. System Time is taken in Miliseconds.
program final

    INTEGER, PARAMETER::n=2000
    INTEGER::i,j
    CHARACTER(100) :: num1char

    real::start,finish
    real :: num1
    REAL::s
    REAL,DIMENSION(n,n+1)::a
    REAL,DIMENSION(n)::x

call get_COMMAND_ARGUMENT(1,num1char)
call random_number(a)!input random numbers into array a

    !READ(1,*)num1
    CALL cpu_time(start)
    DO j=1,n
        DO i=j+1,n
            a(i,:)=a(i,:)-a(j,:)*a(i,j)/a(j,j)
        END DO
    END DO

    
    DO i=n,1,-1
        s=a(i,n+1)
        DO j=i+1,n
            s=s-a(i,j)*x(j)
        END DO
        x(i)=s/a(i,i)
    END DO

    CALL cpu_time(finish)
    print '("Time = "f12.3, " Milliseconds. ")', (finish-start)*1000
END PROGRAM final