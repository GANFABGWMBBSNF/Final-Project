class bubbles {
  PVector loc, vel;
  float r= 50;

  bubbles() {
    r = 50;
    loc = new PVector (random(width-r),random(150,550));
    vel = PVector.random2D();
    vel.mult(random(2,3));
    h = random(360);
  }
  
  void show() {
      fill(h,99,99,50);
      ellipse(loc.x,loc.y,r,r);
      loc.add(vel);
  }
   
  void bounce() {
      if(loc.x<r || loc.x>width) { vel.x*=-1; }
      if(loc.y<150 || loc.y>550) {vel.y*=-1;}
  } 
   
  }
