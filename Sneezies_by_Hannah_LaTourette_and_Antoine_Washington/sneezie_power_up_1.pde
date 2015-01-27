class timeSneezie {
  PVector loc, loc2, vel, acc;
  float r;
  color c;

  timeSneezie() {
    r = 30.;
    loc = new PVector(random(r, width-r), random(r, height-r));
    loc2 = new PVector(random(100, 700), random(450, 550));
    vel = PVector.random2D();
    vel.mult(3);
    acc = new PVector(0, 0);
  }


  void display() {
    if (frameCount%20>=0 && frameCount%20<=9) {
      c = color(250, 100, 100, 100);
    }
    if (frameCount%20>=10 && frameCount%20<=19) {
      c = color(0, 0, 0, 100);
    }
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, 2*r, 2*r);
  }

  void display2() {
    if (frameCount%20>=0 && frameCount%20<=9) {
      c = color(250, 100, 100, 100);
    }
    if (frameCount%20>=10 && frameCount%20<=19) {
      c = color(0, 0, 0, 100);
    }
    fill(c);
    noStroke();
    ellipse(loc2.x, loc2.y, 2*r, 2*r);
  }


  void floatyo() {
    acc.setMag(0);
    vel.add(acc);
    loc.add(vel);
  }

  void floatyo2() {
    acc.setMag(0);
    vel.add(acc);
    loc2.add(vel);
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

  void bounce2() {
    //bouce off of floor
    if (loc2.y+r>550) {
      loc.y = height-r;
      vel.y=-abs(vel.y);
    }
    //bounce ceiling
    if (loc2.y-r<450) {
      vel.y=abs(vel.y);
    }
    //bounce right wall
    if (loc2.x+r>750) {
      vel.x=-abs(vel.x);
    }
    //bounce left wall
    if (loc2.x-r<50) {
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
}

