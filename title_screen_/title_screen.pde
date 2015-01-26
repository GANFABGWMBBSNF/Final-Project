class bubbles {
  PVector loc, vel;
  float r= 50;

  bubbles() {
    r = 50;
    loc = new PVector (random(width-r), random(150, 550));
    vel = PVector.random2D();
    vel.mult(random(2, 3));
    h = random(360);
  }

  void showBalls() {
    fill(h, 99, 99, 50);
    ellipse(loc.x, loc.y, r, r);
    loc.add(vel);
  }

  void showText() {
    fill(0, 0, 25, 100);
    rect(0, 0, width, 200);
    rect(0, 400, width, height);
    fill(0, 0, 25, 100);
    textSize(190);
    text("SNEEZIES", width/2, 375);
    noStroke();
    fill(frameCount%360, 100, 100, 40);
    textSize(50);
    text("GOTTA CLICK EM ALL!", width/2, 500);
  }

  void bounce() {
    if (loc.x<r || loc.x>width) { 
      vel.x*=-1;
    }
    if (loc.y<150 || loc.y>550) {
      vel.y*=-1;
    }
  }
}

