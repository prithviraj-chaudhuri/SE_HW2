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

fn live(mut a: &Vec<i32>, r: usize, col:usize, mut gen: i32)->Vec<i32>{
    
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
        print!{" "};
      }
    
    }
    
    
    
    if gen!=0 {
        sleep();
        cls();
        new1=live(&new,r,col,gen);
    }
    else
    {
        new1=new.clone();
    }
    return new1;
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
  
  

  fn create_vector(cols:usize, rows:usize,some:f64,mut generations:i32)->i32 {
    let mut count: Vec<i32> = Vec::with_capacity(rows*cols);
    let mut rng = rand::thread_rng();
    let length:usize = rows*cols;
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
        print!{" "};
      }
    }
    
    let mut new: Vec<i32> = Vec::with_capacity(cols*rows);
    new=live(&count,rows,cols,generations);
    return 0;
  }

fn main(){
    let mut choice: i32=2;
    if(choice==1)
    {
        create_vector(50,20,0.619,200);
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
                print!{" "};
            }
        }
        new=live(&count,rows,cols,generations);
        let mut flag:bool=false;
        for c in 0..new.len(){
            if (new[c]!=result[c]){
              flag=true;
              println!("index is {}",c);
              break;
            }
        }
        if(flag)
        {
            println!("Failure ");
        }
        else
        {
            println!("Passed");
            }
    }
    
}
