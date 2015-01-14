ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<sneesplosion> sneebris = new ArrayList<sneesplosion>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
int maxBalls=50;
boolean firstClick;
boolean sneeze;
float[] h = new float[12];

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 25, 100);
  firstClick = true;
  for (int i=0; i<50; i++) {
    sneezies.add(new sneezie());
  }
  sneeze=false;
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
    for (int m=0; m<maxBalls; m++) {
    sneebris.add(new sneesplosion());
    sneesplosion thisone3 = sneebris.get(m);
    thisone3.display();
    thisone3.move();
    thisone3.stopmoving(mouse);
    thisone3.slowmoving(mouse);
  }
  
  for (int i=0; i<sneezies.size (); i++) {
    sneezie thisone = sneezies.get(i);
    fill(random(360), 99, 99, 50);
    thisone.display();
    thisone.floatyo();
    thisone.bounce();
    for (int k=0; k<esplosions.size (); k++) {
      for (int m=0; m<sneebris.size (); m++){
        ball thisone2 = esplosions.get(k);
        sneesplosion thisone7 = sneebris.get(m);
      if (thisone.sneezing(thisone2) || thisone.sneezing(thisone7)) {
        sneezies.remove(i);
        sneeze=true;
      }
    }}
  }

  fill(#E71AE8);
  text("#PinkprintOniTunes", width-125, height-20);
}

