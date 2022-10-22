PROGRAM write_file
    IMPLICIT NONE

    INTEGER,PARAMETER::n=250
    INTEGER::i,j

    REAL :: start,finish
    REAL :: r(n,n+1)
    REAL, DIMENSION(n)::x, y
    
    open(1, file = 'input.txt', status = 'replace')
    CALL RANDOM_NUMBER(r)
    DO i = 1,n 
        DO j = i+1,n
            WRITE(1,*) r
        END DO
    END DO
    close(1)
end program write_file
