class burstSneezie {
  PVector loc, vel, acc;
  float r;
  color c;

  burstSneezie() {
    r = 30.;
    loc = new PVector(random(r, width-r), random(r, height-r));
    vel = PVector.random2D();
    vel.mult(3);
    acc = new PVector(0, 0);
  }


  void display() {
    if(frameCount%10>=0 && frameCount%10<=4){
      c = color(360, 100, 100, 100);
    }
    if(frameCount%10>=5 && frameCount%10<=9){
      c = color(0, 0, 0, 100);
    }
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, 2*r, 2*r);
  }

  void floatyo() {
    acc.setMag(0);
    vel.add(acc);
    loc.add(vel);
  }

  void bounce() {
    //bouce off of floor
    if (loc.y+r>height) {
      loc.y = height-r;
      vel.y=-abs(vel.y);
    }
    //bounce ceiling
    if (loc.y-r<0) {
      vel.y=abs(vel.y);
    }
    //bounce right wall
    if (loc.x+r>width) {
      vel.x=-abs(vel.x);
    }
    //bounce left wall
    if (loc.x-r<0) {
      vel.x=abs(vel.x);
    }
  }

  boolean sneezing (ball debris_) {
    if (loc.dist(debris_.loc) < r) {
      return true;
    } else {
      return false;
    }
  }
  
  void pop () {
    fill(0,0,0,0);
  }
}

