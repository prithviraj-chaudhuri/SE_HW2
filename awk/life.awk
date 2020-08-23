# usage: gawk -f life.awk
# Then hit and hold the return key.
# For each key press, you get one new generation.

# Each generation, a cell C is alive 1 or dead 0.
# In the next generation each cell C is alive or dead
# depending on a count of its neighbours N
#
#   Now Neighbors           Next
#   --- ---------           --------------
#   1   0,1             ->  0  # Lonely
#   1   4,5,6,7,8       ->  0  # Overcrowded
#   1   2,3             ->  1  # Lives
#   0   3               ->  1  # It takes three to give birth!
#   0   0,1,2,4,5,6,7,8 ->  0  # Barren
#
BEGIN { sleep(1)
        clearScreen()
        life(10,10,.619, 200)
}

function life(rows, cols, some, generations,
              now,c) { # "now" and "c" are locals
  for(c=1;c<=rows*cols; c++)
    now[c] = rand() < some
  live(now,rows,generations)
}

function live(a,r,gen,    b,c,neighbours) { # "b,c" and "neighbors" are local
  if (gen<1)  return 0
  sleep()
  homeScreen()
  printf("Generation %3d\n",gen);
  for(c=1;c<=length(a);c++) {
    printf( a[c] ? "o" : " ")
    if(!(c%r)) printf("\n")
  }
  for(c in a) {
    neighbours = a[c-1]+a[c+1]+a[c-r-1]+a[c-r]+a[c-r+1]+a[c+r-1]+a[c+r]+a[c+51]
    b[c] = a[c]
    if ( a[c]==0 )
      b[c] = neighbours==3
    else
      b[c] = neighbours==2 || neighbours== 3 }
  live(b,r,--gen)
}

function sleep()       { system("sleep 0.1") }
function homeScreen()  { printf("\033[1;1H") }
function clearScreen() { printf("\033[2J")   }