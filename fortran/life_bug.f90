program main
implicit none
    logical equal
    CHARACTER(1)::choice
    integer, parameter ::  rows = 3, columns = 3,gen=5
    integer, parameter ::  rows1 = 3, columns1 = 3,gen1=4
    double precision,parameter::some=0.619
    integer,DIMENSION(rows*columns)::now,outnow
    integer,DIMENSION(rows1*columns1)::now1,outnow1,final
    integer :: i
    call GET_COMMAND_ARGUMENT(1,choice)
    if (choice .EQ. 'a') then
        do i=1,rows*columns
            if (rand()<some) then 
                now(i) = 1
            else 
                now(i)=0
            endif
        end do
		call sleep(1)
        call cls()
        call hm()
        call life(now,rows,columns,gen,outnow)
    else
        now1=(/0,0,0,1,1,1,0,0,0/)
        call sleep(1)
        call cls()
        call hm()
        call life(now1,rows1,columns1,gen1,outnow1)
    endif
    if (choice .NE. 'a') then
       final = (/0,0,0,0,0,0,0,0,0/)
        equal = size(outnow1) == size(final)
        if (equal) then
            do i=1,size(outnow1)
                equal = equal .and. final(i) == outnow1(i) 
                if ( .not. equal ) then
                    print *, equal,final(i) ,outnow1(i)
                    exit
                endif
            enddo
        endif
        if(equal) then
            print *, "All good!!"
        else
            print *,"Not good!!"
        endif
    endif
end program main


subroutine life (now,rows,cols,gen,outnow)
implicit none     
    
    integer,INTENT(IN) :: rows,cols
    integer, INTENT(INOUT) :: gen
    integer,INTENT(INOUT) :: now(rows*cols)
    integer,INTENT(OUT) :: outnow(rows*cols)
    integer :: i, j 
    integer::d(1:SIZE(now,1))
    d=now
    write(*,*) "recursive ", gen
    do i = 1, rows*cols
        if (modulo(i-1,rows)==0) then
            write(*,*)
        endif
        if(d(i) .eq. 0) then
            write(*,"(1x, A)",advance="no") " "
        else
            write(*,"(1x, A)",advance="no") "o"
        endif
    end do
    write(*,*)
    call sleep(1)
    call cls()
    call hm()
    call live(now,rows,cols,gen,outnow)
    
end subroutine life


RECURSIVE subroutine live (a,r,c,gen,outnow)    
implicit none   
    integer,INTENT(IN):: r,c
    integer, INTENT(INOUT) ::a(r*c)
    integer, INTENT(OUT) ::outnow(r*c)
    integer, INTENT(INOUT) :: gen
    integer:: i,nei,m
    integer::b(1:SIZE(a,1))
     do i = 1,c*r
        nei=0
        b(i)=0
        if((i-1) .GE. 1) then
            nei= nei+ a(i-1)
        endif
        if((i+1) .LE. (r*c)) then
            nei= nei+a(i+1)
        endif
        if((i-r) .GE. 1) then
            nei= nei+a(i-r)
        endif
        if((i+r) .LE. (r*c)) then
            nei= nei+a(i+r)
        endif
        if((i-r-1) .GE. 1) then
            nei= nei+a(i-r-1)
        endif
        if((i-r+1) .GE. 1) then
            nei= nei+a(i-r+1)
        endif
        if((i+r-1) .LE. (r*c)) then
            nei= nei+a(i+r-1)
        endif
        if((i+r+1) .LE. (r*c)) then
            nei= nei+a(i+r+1)
        endif
        if(a(i)==0) then
            if(nei==3) then
                b(i)=1
            endif
        else
            if(.NOT. (nei .LT. 2) .AND. .NOT. (nei .GT. 3)) then
                b(i)=a(i)
            endif
        endif
    end do
    m = (gen-1)
    write(*,*) "recursive ", m
    do i = 1, r*c
        if (modulo(i-1,r)==0) then
            write(*,*)
        endif
        if(b(i) .eq. 0) then
            write(*,"(1x, A)",advance="no") " "
        else
            write(*,"(1x, A)",advance="no") "o"
        endif
    end do
    write(*,*)
    if(m .NE. 0) then
        call sleep(1)
        call cls()
        call hm()
        outnow=b
        call live(b,r,c,m,outnow)
    endif
end subroutine live 



subroutine cls()
implicit none
    print *, achar(27)//"[2J"
end subroutine cls

subroutine hm()
implicit none
    print *, achar(27)//"[1;1H"
end subroutine hm
