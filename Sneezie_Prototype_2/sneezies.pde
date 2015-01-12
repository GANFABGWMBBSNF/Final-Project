class sneezie{
  // float/move a lil
  // react to the explosion
  // create a new explosion
  PVector loc, vel, acc;
  float r;
  
  sneezie(){
    r = 10.;
    loc = new PVector(random(r, width-r),random(r, height-r));
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(random(-.01,.01),random(-.01,01));
  }
  
  void display(){
   ellipse(loc.x, loc.y, 2*r, 2*r); 
  }
  
  void floatyo(){
    vel.add(acc);
    loc.add(vel);
  }
}
