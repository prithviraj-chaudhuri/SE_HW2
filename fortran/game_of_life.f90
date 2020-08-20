program main
implicit none    
    integer, parameter ::  rows = 5, columns = 5,gen=5
    double precision,parameter::some=0.619
    call sleep(1)
    print *, "hello" 
    call life(rows,columns,some,gen)
    
end program main


subroutine life (rows,cols,some,gen)
implicit none     
    
    integer,INTENT(IN) :: rows,cols
    integer, INTENT(INOUT) :: gen
    integer,DIMENSION(rows*cols) :: now
    double precision,INTENT(IN)::some
    integer :: i, j 
    do i=1,rows*cols
        !do j=1,cols
            if (rand()<some) then 
                now(i) = 1
            else 
                now(i)=0
            endif
        !end do
    end do
    !now=(/1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,1/)
    do i = 1, rows*cols
        if (modulo(i-1,rows)==0) then
            write(*,*)
        endif
        write(*,"(1x, i0)",advance="no") now(i)
    end do
    write(*,*)
    call live(now,rows,cols,gen)
end subroutine life


RECURSIVE subroutine live (a,r,c,gen)    
implicit none   
    integer,INTENT(IN):: r,c
    integer, INTENT(INOUT) ::a(r*c)
    integer, INTENT(INOUT) :: gen
    integer:: i,nei,start1,end1,m
    integer::b(1:SIZE(a,1))
    call sleep(1)
    write (*,"(A)") gen
    start1=c+2
    end1=(r*c)-c-2
    b=a
    do i = 1,c*r
        nei = a(i-1)+a(i+1)+a(i+r)+a(i-r)+a(i+r+1)+a(i+r-1)+a(i-r-1)+a(i-r+1)
        if(a(i)==0) then
            if(nei==3) then
                b(i)=1
            else
                b(i)=0
            endif
        else
            if(nei==2 .or. nei==3) then
                b(i)=1
            else
                b(i)=0
            endif
        endif
    end do
    do i = 1, r*c
        if (modulo(i-1,r)==0) then
            write(*,*)
        endif
        write(*,"(1x, i0)",advance="no") b(i)
    end do
    write(*,*)
    write(*,"(A)") "recursive"
    m = (gen-1)
    a=b
    if(gen .NE. 0) then
        write(*,*) "recursive ", m
        call live(a,r,c,m)
    endif
end subroutine live 

