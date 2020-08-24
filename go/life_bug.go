package main

import (
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"runtime"
	"time"
	"strconv"
)

var return_val int = 0

func cls(){
	if runtime.GOOS == "windows"{
		clearScreen := exec.Command("cmd", "/c", "cls")
		clearScreen.Stdout = os.Stdout
		clearScreen.Run()
	}else{
		clearScreen := exec.Command("clear")
		clearScreen.Stdout = os.Stdout
		clearScreen.Run()
	}

}

func verify_generation(gen int, now []int) bool{

	equal := true
	final := []int{0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0}
	if gen == 4 {
		final[0] = 1
		final[1] = 1
		final[21] = 1
	}

	for i, v := range now {
		equal = (final[i]==v && equal)
	    if !equal {
			fmt.Printf("%#v %#v %#v\n", equal, final[i], v)
			break
	    }
	}
	fmt.Printf("Your generation is: %#v", strconv.FormatBool(equal))
	return equal

}

func get_neighbors(now []int, ind int, rows int, cols int) int{

	/*
	This is a helper method to check if the index to be used in now slice
	valid. If valid, return array value at provided index else return 0
	 */

	if ind >= 0 && ind < rows*cols{
		return now[ind]
	}
	return 0
}

func live(now []int, rows int, cols int, generations int, debug int) int{

	/*
	This method prints gof board after every iteration and then updates
	the gof board. Stops when generations becomes 0.
	 */

	if generations < 1{
		sleep()
		cls()
		fmt.Println("\nGeneration", generations)
		if debug == 1 {
			if generations!=5 && !verify_generation(generations, now){
				return_val=1
			}
		}
		fmt.Printf("\n")
		for c := 0; c < rows*cols; c++{
			if now[c] == 1{
				fmt.Printf("o")
			}else{
				fmt.Printf("-")
			}
			if (c+1)%rows == 0{
				fmt.Printf("\n")
			}
		}
		return return_val
	}else{
		sleep()
		cls()
		fmt.Println("\nGeneration", generations)

		if debug == 1 {
			if generations!=5 && !verify_generation(generations, now){
				return_val=1
			}
		}

		fmt.Printf("\n")

		for c := 0; c < rows*cols; c++{
			if now[c] == 1{
				fmt.Printf("o")
			}else{
				fmt.Printf("-")
			}
			if (c+1)%rows == 0{
				fmt.Printf("\n")
			}
		}

		newNow := make([]int, rows*cols)
		for c := 0; c < rows*cols; c++ {

			neighbours := get_neighbors(now, c-1, rows, cols) +
				          get_neighbors(now, c+1, rows, cols) +
				          get_neighbors(now, c-rows-1, rows, cols) +
				          get_neighbors(now, c-rows, rows, cols) +
				          get_neighbors(now, c-rows+1, rows, cols) +
						  get_neighbors(now, c+rows-1, rows, cols) +
						  get_neighbors(now, c+rows, rows, cols) +
						  get_neighbors(now, c+rows+1, rows, cols)

			newNow[c] = now[c]
			if now[c] == 0{
				if neighbours == 3 {
					newNow[c] = 1
				}else{
					newNow[c] = 0
				}
			}else{
				if now[c] == 1 && neighbours==2{
					newNow[c] = 1
				}else{
					newNow[c] = 0
				}
			}
		}
		generations = generations -1
		live(newNow, rows, cols, generations, debug)
		return return_val
	}
}

func life(rows int, cols int, some float64, optional ...int) []int{

	/*
	This method initialized the game of life board. And
	then calls the method live, which recursively calls
	itself till generations becomes zero.
	 */

	var now = make([]int, rows*cols)
	for c := 0; c < rows*cols; c++ {
		if rand.Float64() < some {
			now[c] = 1
		}else{
			now[c] = 0
		}
	}
	return now
}

func sleep(){
	// method to sleep the program for 100ms
	time.Sleep(100*time.Millisecond)
}

func initialize() int{
	// initialize the stdout
	// sleeps for 1 sec and then clear screen
	time.Sleep(1*time.Second)
	cls()
	return 0
}


func main(){

	args := os.Args[1:]

	if len(args) > 0{
		initialize()
		now := life(50, 20, 0.619)
		live(now, 50, 20, 200, 0)
	}else{
		now := []int{1,1,0,1,1, 1,0,1,1,1, 1,1,0,1,0, 1,0,1,1,1, 1,1,0,1,1}
		if live(now, 5, 5, 5, 1) == 0{
			fmt.Println("All Good")
		}else {
			fmt.Println("Not Good")
		}
	}


}
