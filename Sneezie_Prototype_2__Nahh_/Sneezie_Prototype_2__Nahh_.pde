ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
int maxBalls=50;
boolean firstClick;
boolean clicked;
float[] h = new float[12];
int sneezieMax=25;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 25, 100);
  firstClick = true;
  for (int i=0; i<sneezieMax; i++) {
    sneezies.add(new sneezie());
  }

  clicked = false;
}

void draw() {
  background(0, 0, 25, 100);
  PVector mouse=new PVector(mouseX, mouseY);
  
  /////add debris/////
  for (int i=0; i<=maxBalls; i++) {
    esplosions.add(new ball());
  }
  /////deris actions (from click)/////
  if (clicked) {
    for (int i=0; i<=esplosions.size (); i++) {
      ball thisone = esplosions.get(i);
      thisone.display();
      thisone.move();
      thisone.age();
      thisone.slowmoving(mouse);
      thisone.stopmoving(mouse);
      if (thisone.dead()) {
        esplosions.remove(i);
      }
    }
  }
  /////sneezies actions/////
  for (int i=0; i<sneezies.size (); i++) {
    sneezie thisone = sneezies.get(i);
    fill(0, 99, 99, 50);
    thisone.display();
    thisone.floatyo();
    thisone.bounce();
    for (int k=0; k<esplosions.size (); k++) {
      ball thisone2 = esplosions.get(k);
      if (thisone.sneezing(thisone2)) {
        sneezies.remove(i);
      }
    }
  }
  if (esplosions.size() >= maxBalls) {
    firstClick=false;
  }

  fill(#E71AE8);
  text("#PinkprintOniTunes", width-125, height-20);
}

void mouseClicked() {
  clicked=true;
}

