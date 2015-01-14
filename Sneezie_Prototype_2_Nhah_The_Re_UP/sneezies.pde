class sneezie {
  // float/move a lil
  // react to the explosion
  // create a new explosion
  // bounce off of walls

  PVector loc, vel, acc;
  float r;
  int[] h = new int[12];


  sneezie() {
    r = 30.;
    loc = new PVector(random(r, width-r), random(r, height-r));
    vel = new PVector(random(-.5, .5), random(-.5, .5));
    acc = new PVector(random(-.01, .01), random(-.01, 01));
    for (int i=0; i<h.length; i++) {
      //*there was the h thing here  h[i] = (i*30)
    }
  }

  void display() {
    noStroke();
    //  fill(???, 100, 100, 100);
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
    if (loc.dist(debris_.loc) < r){
      return true;
    }
    else {
      return false;
    }
  }
    boolean sneezing (sneesplosion debris_) {
    if (loc.dist(debris_.loc) < r){
      return true;
    }
    else {
      return false;
    }
  }
}

