ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
int maxBalls=50;
int maxSneezie=25;
boolean firstClick;
float[] h = new float[12];
float time;
int level;
boolean enterPressed;
boolean loading;
int stage;
boolean gameScreen; //if true then gameplay//if false then win/lose screen//
int frame;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 25, 100);
  firstClick = true;
  loading=true;

  time=10;
  textAlign(CENTER);
  level=1;
  stage=1;
  gameScreen=true;
  frame=0;
}
void draw() {
  background(0, 0, 25, 100);
  PVector mouse=new PVector(mouseX, mouseY);
  frame+=1;
  print("Stage: ");
  println(stage);
  print("Level: ");
  println(level);
  print("gameScreen Value: ");
  println(gameScreen);
  println("--------------------");
  
  if (gameScreen) {
    if (level==1) {
      maxBalls=100;

      if (loading) {
        for (int i=0; i<maxSneezie; i++) {
          sneezies.add(new sneezie());
          loading=false;
        }
      }

      if (esplosions.size() >= maxBalls) {
        firstClick=false;
      }

      if (firstClick) {
        if (mousePressed) {
          esplosions.add(new  ball());
        }
      }
      for (int i=0; i<esplosions.size (); i++) {
        ball debris = esplosions.get(i);
        debris.display();
        debris.move();
        debris.age();
        debris.slowmoving(mouse);
        debris.stopmoving(mouse);
        if (debris.dead()) {
          esplosions.remove(i);
        }
      }
      for (int i=0; i<sneezies.size (); i++) {
        sneezie yeezie = sneezies.get(i);
        fill(random(360), 99, 99, 50);
        yeezie.display();
        yeezie.floatyo();
        yeezie.bounce();
        for (int k=0; k<esplosions.size (); k++) {
          ball debris2 = esplosions.get(k);
          if (yeezie.sneezing(debris2)) {
            sneezies.remove(i);
          }
        }
      }
      fill(#E71AE8);
      textSize(12);
      text("#PinkprintOniTunes", width-75, height-20);
      textSize(20);
      fill(#ffffff);
      text(time-frameCount*.0167, 30, 20);
      if (time-frameCount*.0167<=0) {
        gameScreen=false;
      }
    }//end of lvl 1


    if (level==2) {
      maxBalls=100;

      if (loading) {
        for (int i=0; i<maxSneezie; i++) {
          sneezies.add(new sneezie());
        }
        loading=false;
      }

      if (esplosions.size() >= maxBalls) {
        firstClick=false;
      }

      if (firstClick) {
        if (mousePressed) {
          esplosions.add(new  ball());
        }
      }
      for (int i=0; i<esplosions.size (); i++) {
        ball debris = esplosions.get(i);
        debris.display();
        debris.move();
        debris.age();
        debris.slowmoving(mouse);
        debris.stopmoving(mouse);
        if (debris.dead()) {
          esplosions.remove(i);
        }
      }
      for (int i=0; i<sneezies.size (); i++) {
        sneezie yeezie = sneezies.get(i);
        fill(random(360), 99, 99, 50);
        yeezie.display();
        yeezie.floatyo();
        yeezie.bounce();
        for (int k=0; k<esplosions.size (); k++) {
          ball debris2 = esplosions.get(k);
          if (yeezie.sneezing(debris2)) {
            sneezies.remove(i);
          }
        }
      }
      fill(#E71AE8);
      textSize(12);
      text("#PinkprintOniTunes", width-75, height-20);
      textSize(20);
      fill(#ffffff);
      text(time-frame*.0167, 30, 20);
      if (time-frame*.0167<=0) {
        gameScreen=false;
      }
    }//end of lvl 2
  }//end of stage 1



  else {
    if (sneezies.size()>0) {
      background(0);
      fill(#120DBC);
      textSize(50);
      text("GAME OVER", width/2, height/2);
    } else {
      background(0);
      fill(#120DBC);
      textSize(50);
      text("YOU WON!!!", width/2, height/2);
      textSize(25);
      text("Press Enter to Advance", width/2, 2*height/3);
    }
  }//end of stage 2
}//end of main code

void keyReleased() {
  if (gameScreen==false && sneezies.size() <= 0) {
    if (key==ENTER) {
      time=10;
      frame=0;
      loading=true;
      stage=1;
      level+=1;
      gameScreen=true;
    }
  }
}

