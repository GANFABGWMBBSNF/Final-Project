//ArrayList<debris> debrisPiece = new ArrayList<debris>();
//ArrayList<sneezies> sneezie = new ArrayList<sneezies>();
ArrayList<explosions> explosion = new ArrayList<explosions>();
PVector mouse = new PVector (mouseX, mouseY);
PVector origin = mouse;

float x = 200;
float y = 200;
PVector xy = new PVector(x,y);

boolean firstExplosion;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(0, 0, 25, 100);
  ellipse(x,y,50,50);
  if (mousePressed) {
    explosion.add(new explosions(mouse));
    explosions poof = explosion.get(0);
    poof.explode();
  }
  if(keyPressed) {
   explosion.add(new explosions(xy));
   explosions poof2 = explosion.get(1);
   poof2.explode();
  } 
}

