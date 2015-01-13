ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
int maxBalls=50;
boolean firstClick;
float[] h = new float[12];
esplosion sneezo = new esplosion();

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 25, 100);
  firstClick = true;
  for (int i=0; i<50; i++) {
    sneezies.add(new sneezie());
  }
}
void draw() {
  background(0, 0, 25, 100);
  PVector mouse=new PVector(mouseX, mouseY);
  if (esplosions.size() >= maxBalls) {
    firstClick=false;
  }

  if (firstClick) {
    if (mousePressed) {
      esplosions.add(new  ball());
    }
  }
  for (int i=0; i<esplosions.size (); i++) {
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
  for (int i=0; i<sneezies.size (); i++) {
    sneezie thisone = sneezies.get(i);
    fill(random(360),99,99,50);
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
  
  
}

