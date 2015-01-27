class ball {
  PVector loc, vel, acc;
  float sz, life;
  float mouseDist;

  ball() {
    sz = random(2, 3);
    loc = new PVector(mouseX, mouseY);
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    life = 100.;
    vel.mult(random(2, 3));
  }

  void display() {
    noStroke();
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

