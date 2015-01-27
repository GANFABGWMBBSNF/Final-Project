class instructions {
  sneezie sneezle;
  PVector randLoc;
  ArrayList<ball> explosion = new ArrayList<ball>();


  instructions() {
    sneezle = new sneezie();
    randLoc = new PVector (random(600, 700), random(100, 150));
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

    text("There are a few special sneezies, as well...", 25, 400);
    text("Try getting rid of these!", 190, 425);
  }

  void showExamples() {
    sneezle.display2();
    sneezle.floatyo();
    sneezle.bounce2(randLoc);

    if (explosion.size() < 30) {
      if (mousePressed) {
        explosion.add(new  ball());
      }
    }

//    if (burst) {
//      for (int k=0; k<5; k++) {
//        for (int i=0; i<50; i++) {
//          esplosions.add(new ball());
//        }
//      }
//      burst=false;
//    }
    for (int i=0; i<explosion.size (); i++) {
      ball debris = explosion.get(i);
      debris.display();
      debris.move();
      debris.age();
      debris.slowmoving(mouse);
      debris.stopmoving(mouse);
      if (debris.dead()) {
        esplosions.remove(i);
      }
    }
  }
}

