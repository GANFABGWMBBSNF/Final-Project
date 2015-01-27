class instructions {
  sneezie sneezle;
  timeSneezie timzle;
  burstSneezie burstzle;
  PVector randLoc;
  PVector explosionOrigin;
  ArrayList<ball> explosion = new ArrayList<ball>();


  instructions() {
    sneezle = new sneezie();
    timzle = new timeSneezie();
    burstzle = new burstSneezie();
    randLoc = new PVector (random(600, 700), random(100, 150));
    explosionOrigin=new PVector(500, 250);
  }


  void show() {
    background(0, 0, 25, 100);
    fill(frameCount%360, 100, 100, 70);
    rect(0, 0, width, 65);
    rect(0, 570, width, 100);

    textFont(titleFont);
    fill(0, 0, 25, 100);
    textAlign(CENTER);
    text("INSTRUCTIONS", width/2, 50);
    text("INSTRUCTIONS", (width/2)+1, 50);

    fill(frameCount%360, 100, 100, 70);
    textSize(25);
    textAlign(LEFT);
    text("This is a sneezie.", 25, 125);

    text("Your job is get rid of every sneezie before time runs out!", 25, 225);
    text("Do this by pressing down on your mouse.", 25, 300);

    text("There are a few special sneezies, as well...", 25, 375);
    text("They look like this!", 25, 400);
    text(" The Blue adds 5 seconds to the timer! The Red...well that's a surprise...", 25, 425);
  }

  void showExamples() {
    if (explosion.size() < 30) {
      if (mousePressed) {
        explosion.add(new  ball());
      }
    }

    for (int i=0; i<explosion.size (); i++) {
      ball debris = explosion.get(i);
      debris.display();
      debris.move();
      debris.age();
      debris.slowmoving(mouse);
      debris.stopmoving(mouse);
      if (debris.loc.x>width || debris.loc.y>height || debris.loc.x<0 || debris.loc.y<0) {
        debris.vel.setMag(0);
      }
    }

    sneezle.display2();
    sneezle.floatyo();
    sneezle.bounce2(randLoc);

    timzle.display2();
    timzle.floatyo2();
    timzle.bounce2();

    burstzle.display2();
    burstzle.floatyo2();
    burstzle.bounce2();
  }
}

