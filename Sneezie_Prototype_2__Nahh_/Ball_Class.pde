class ball {
  PVector loc, vel, acc, esplosionOrigin;
  float sz, life;
  float mouseDist;

  ball() {
    sz = random(2, 3);
    loc = new PVector(mouseX,mouseY);
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    life = 100.;
    vel.mult(random(2,2.5));
  }

  void display() {
    noStroke();
    loc = new PVector(mouseX,mouseY);
    fill(frameCount%360, 100, 100, life);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  void stopmoving(PVector mouse_) {
    mouseDist = random(40, 60);
    if (vel.x < .5 && vel.x > -.5 && vel.y < .5 && vel.y > -.5) {
      acc=new PVector (0, 0);
      vel=new PVector (0, 0);
    }
  }

  void slowmoving(PVector mouse_) {
    acc = PVector.sub(mouse_, loc);
    acc.setMag(.03);
  }

  void bounce() {
    //bouce off of floor
    if (loc.y+sz/2>height) {
      loc.y = height-sz/2;
      vel.y=-abs(vel.y);
    }
    //bounce ceiling
    if (loc.y-sz/2<0) {
      vel.y=abs(vel.y);
    }
    //bounce right wall
    if (loc.x+sz/2>width) {
      vel.x=-abs(vel.x);
    }
    //bounce left wall
    if (loc.x-sz/2<0) {
      vel.x=abs(vel.x);
    }
  }

  void age() {
    life-=.8333;
  }

  boolean dead() {
    if (life<=0) {
      return true;
    } else {
      return false;
    }
  }
}

