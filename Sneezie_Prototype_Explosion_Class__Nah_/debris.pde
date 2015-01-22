class debris {
  PVector loc, vel, acc;
  float sz, life, mouseDist;

  debris() {
    sz = random(20, 30);
   // if(firstExplosion) {
    loc = new PVector(mouseX, mouseY);
   // } else { loc = PVector.random2D(); }
    vel = PVector.random2D();
    acc = new PVector (0,0);
    life = 100;
    vel.mult(random(2, 3));
  }  

  void display() {
    noStroke();
    fill(360);
    for (int i=0; i<5; i++) {
      ellipse(loc.x, loc.y, sz, sz);
    }
  }


  void move() {
    loc.add(vel);
  }

  void slowMove(PVector mouse_) {
    acc = PVector.sub(mouse_, loc);
    acc.setMag(.03);
  }

  void stop_(PVector mouse_) {
    mouseDist = random(40, 60);
    if (vel.x < .5 && vel.x > -.5 && vel.y < .5 && vel.y > -.5) {
      vel=new PVector (0, 0);
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

  ///
}

