extern crate rand;
use rand::Rng;
use std::{thread, time};

fn sleep()
{
    let one_sec = time::Duration::from_millis(1000);
    let now = time::Instant::now();
    thread::sleep(one_sec);
    assert!(now.elapsed() >= one_sec);

}

fn cls(){
    println!();
    //print!("\x1B[2J\x1B[1;1H");
}

fn live(mut a: &Vec<i32>, r: usize, col:usize, mut gen: i32, debug: usize, mut return_val: usize)->(Vec<i32>, usize){
    
    sleep();
    cls();
    let mut neighbours:i32=0;
    let rc:usize=r*col;
    let mut new: Vec<i32> = vec![0; rc];
    let mut new1: Vec<i32> = vec![0; rc];

    gen=gen-1;
    println!();
    println!("generation is {}",gen);
    for c in 0..a.len(){
  
      neighbours=check_Valid(c.wrapping_sub(1),rc,&a)+check_Valid(c.wrapping_sub(3),rc,&a)+check_Valid(c.wrapping_sub(2),rc,&a)+check_Valid(c.wrapping_sub(4),rc,&a)+check_Valid((c+r-1),rc,&a)+check_Valid((c+r),rc,&a)+check_Valid((c+r+2),rc,&a)+check_Valid((c+1),rc,&a);
  
      new[c]=0;
    
      if a[c]==0
      {
        if neighbours==3
        {
          new[c]=1;
        }
      }
      else
      {
        if neighbours==2 || neighbours==3{
          new[c]=1;
        }
      }
      if c%r==0{
        println!{};
      }
      if new[c]==1{
        print!{"O"};
      }
      else {
        print!{"-"};
      }
    
    }

    if debug == 1 {
			if gen!=5 && !verify_generation(gen,&new){
				return_val=1;
      }
		}

    if gen!=0 {
        sleep();
        cls();
        let (new1, return_val) = live(&new,r,col,gen, debug, return_val);
        return (new1,return_val);
    }
    else
    {
        new1=new.clone();
        return (new1,return_val);
    }
    
  }

  fn check_Valid(n:usize,rc:usize,val:&[i32])->i32 {
      if n>=0 && n<rc {
        return val[n];
      }
      else
      {
        return 0;
      }
  }

  fn verify_generation(mut gen: i32, mut a: &Vec<i32>)->bool {
    let mut flag:bool=true;
    let mut result: Vec<i32> = vec![0,0,0,0,0,0,0,0,0];
    if gen == 3 {
      result = vec![0,1,0,1,1,1,1,0,1];
    }
    else if gen == 2 {
      result = vec![1,1,0,0,0,0,0,0,1];
    }
    else if gen == 1 {
      result = vec![0,0,0,0,1,0,0,0,0];
    }

    println!(); 
    for c in 0..a.len(){
      flag = flag && result[c]==a[c];
      if !flag {
        println!("First incorrect index is {}",c);
        break;
      }
    }

    return flag;
  }
  

  fn create_vector(cols:usize, rows:usize,some:f64,mut generations:i32, debug:usize)->i32 {
    let mut count: Vec<i32> = Vec::with_capacity(rows*cols);
    let mut rng = rand::thread_rng();
    let length:usize = rows*cols;
    let mut return_v: usize;

    for i in 0..length{
        let y: f64 = rng.gen();
        if y<some{
        count.push(0);
        }
        else{
            count.push(1);
        }
    }
    print!("{:?}",&count);
    println!();
    println!("generation is {}",generations);
    for c in 0..count.len(){
      if c%rows==0{
        println!{};
      }
      if count[c]==1{
        print!{"O"};
      }
      else {
        print!{"-"};
      }
    }
    
    let mut new: Vec<i32> = Vec::with_capacity(cols*rows);
    let (new,return_v) = live(&count,rows,cols,generations,debug, 0);
    return 0;
  }

fn main(){
    let mut choice: i32=2;
    if(choice==1)
    {
        create_vector(50,20,0.619,200, 0);
    }
    else
    {
        let cols:usize = 3;
        let rows:usize = 3;
        let mut generations:i32 = 4;
        let mut count: Vec<i32> = Vec::with_capacity(cols*rows);
        let mut result: Vec<i32> = Vec::with_capacity(cols*rows);
        let mut new: Vec<i32> = Vec::with_capacity(cols*rows);
        count=vec![0,0,0,1,1,1,1,0,0];
        result=vec![0,0,0,0,0,0,0,0,0];
        println!("{:?}", &count);
        println!();
        println!("generation is {}",generations);
        for c in 0..count.len(){
            if(c%rows==0){
              println!{};
            }
            if count[c]==1{
              print!{"O"};
            }
             else {
                print!{"-"};
            }
        }
        let mut flag:usize=0;
        let (new,flag)=live(&count,rows,cols,generations, 1, 0);

        if flag == 1
        {
            println!("Failure");
        }
        else
        {
            println!("Passed");
        }
    }
    
}
