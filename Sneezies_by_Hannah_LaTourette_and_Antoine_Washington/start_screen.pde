class title {
  PVector loc, vel;
  float r= 50;
  boolean firstFall;
  float h;

  title() {
    r = 50;
    loc = new PVector (random(width-r), random(75, 150));
    vel = PVector.random2D();
    vel.mult(random(2, 3));
    h = random(360);
    firstFall = true;
  }

  void showBalls() {
    noStroke();
    fill(h, 99, 99, 50);
    ellipse(loc.x, loc.y, r, r);
    loc.add(vel);
    if (loc.y>200) {
      firstFall = false;
    }
  }

  void showText() {
    fill(0, 0, 25, 100);
    rect(0, 0, width, 200);
    rect(0, 400, width, height);

    textFont(titleFontXL);
    fill(0, 0, 25, 100);
    textSize(175);
    text("SNEEZIES", width/2, 375);

    textFont(titleFont);
    fill(frameCount%360, 100, 100, 40);
    textSize(30);
    text("PRESS TAB FOR INSTRUCTIONS OR", width/2, 490);
    textSize(50);
    text("PRESS SPACE TO BEGIN", width/2, 530);
  }

  void bounce() {
    if (loc.x<r || loc.x>width) { 
      vel.x*=-1;
    }
    if ((loc.y<200 || loc.y>400) && firstFall == false) {
      vel.y*=-1;
    }
  }
}

