void setup(){
  size(500,400);
  background(255,255,255);
}




  float size = 10;
  float prevX = 250, prevY = 200; 
  float accelerationY = 0;
  float accelerationX = 0;
void draw(){
  background(255,255,255);
  ellipse(prevX, prevY, size, size);
  //moveBall();
  FallingPhysics();
  XPhysics();
  
  
  
}



//Apply X axis physics: Bouncing off walls and decelerating movement
void XPhysics(){
  hitWall();
  if (accelerationX>0) {
    if (accelerationX-1 < 0){
      accelerationX = 0;
      return;
    }
    accelerationX-=1;
  }
  else  if (accelerationX<0){
      if (accelerationX+1 > 0){
      accelerationX = 0;
      return;
    }
    accelerationX+=1;
  }
  
  prevX+=accelerationX;
}




//Apply falling physics(Y axis physics): Gravity and bouncing off ceiling
void FallingPhysics(){
  hitCeiling();
  if (prevY >= 390 && (accelerationY == 0)){
    return;
  }
  hitGround();
  gravity();
  
    
}
//Add graviational force
void gravity(){
  accelerationY+=3;
  prevY+=accelerationY;
  
}

//Detect if hit ground, execute BounceYUp()
void hitGround(){
  if (prevY >= 390){
    bounceYUp();
  }
}

//Execute bounce up physics
void bounceYUp(){
  
  // if no more upward velocity, prevents ball from falling into the ground
  if (prevY+(-abs(accelerationY))>390){
  prevY = 390;
  return;
  }
  
  
  // accelerates upward
  accelerationY= -abs(accelerationY)+3;
}



// push ball towards cursor when clicked
void mouseClicked(){
  accelerationX = mouseX - prevX; 
  accelerationY = mouseY - prevY;
  prevX = mouseX;
  prevY = mouseY;
}

//Detect if hitting ceiling, accelerates downward
void hitCeiling(){
  if (prevY < 10){
    accelerationY = abs(accelerationY);
  }
}


//Detect if hitting wall, accelerates the oppisite direction
void hitWall(){
  if (prevX <= 0){
    bounceXRight();
  }
  else if (prevX >= 500){
    bounceXLeft();
  }
}


//Accelerates right
void bounceXRight(){
  accelerationX = abs(accelerationX);
}


//Accelerates Left
void bounceXLeft(){
  accelerationX = -abs(accelerationX);
}
