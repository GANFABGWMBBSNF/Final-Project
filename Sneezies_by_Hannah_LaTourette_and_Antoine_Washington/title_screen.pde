class bubbles {
  PVector loc, vel;
  float r= 10;
  float h;

  bubbles() {
    r = 10;
    loc = new PVector (random(r, width-r), random(-600, -r));
    vel = new PVector(random(-2, 2), random(3.75, 4.25));
    h = random(360);
  }

  void show() {
    fill(h, 99, 99, 50);
    ellipse(loc.x, loc.y, r, r);
    loc.add(vel);
  }

  void bounce() {
    if (loc.x<=r || loc.x>=width-r) { 
      vel.x*=-1;
    }
    if (loc.y>=height-r) {
      vel.y*=-1;
    }
  }
}

