program main
    
    integer, parameter :: seed = 86456, rows = 10, columns = 5
    double precision, parameter :: fraction = 0.3
    integer :: initial(rows, columns), i, j 

    call srand(seed)
    do i=1,rows
        do j=1,columns
            if (rand()<fraction) then 
                initial(i, j) = 1
            else 
                initial(i,j)=0
            endif
        end do
    end do

    DO i = 1, rows
        PRINT '(1x, 5I6)', (initial(i,j), j = 1, columns)
    END DO

end program main