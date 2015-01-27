class sneezie {
  PVector loc, loc2, vel, acc;
  float r;


  sneezie() {
    r = 30.;
    loc = new PVector(random(r, width-r), random(r, height-r));
    loc2 = new PVector(random(400, 700), random(75, 175));
    vel = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(random(-.01, .01), random(-.01, 01));
  }


  void display() {
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

  void display2() {
    noStroke();
    ellipse(loc2.x, loc2.y, 2*r, 2*r);
    loc2.add(vel);
  } 

  void bounce2(PVector loc) {
    if (loc2.x<300 || loc2.x>600) {
      vel.x*=-1;
    } 
    if (loc2.y<100 || loc2.y >150) {
      vel.y*=-1;
    }
  }

  boolean sneezing (ball debris_) {
    if (loc.dist(debris_.loc) < r) {
      return true;
    } else {
      return false;
    }
  }
}




