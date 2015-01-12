ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
int maxBalls=50;
boolean firstClick;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 25, 100);
  firstClick = true;
  for(int i=0; i<10; i++){
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
  for (int i=0; i<sneezies.size(); i++) {
    sneezie thisone = sneezies.get(i);
    thisone.display();
    thisone.floatyo();
  }
}

