//ArrayList<debris> debrisPiece = new ArrayList<debris>();
//ArrayList<sneezies> sneezie = new ArrayList<sneezies>();
ArrayList<explosions> explosion = new ArrayList<explosions>();
PVector mouse = new PVector (mouseX, mouseY);
PVector origin = mouse;
boolean firstExplosion;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(0, 0, 25, 100);

  if (mousePressed) {
          explosion.add(new explosions());
    explosions poof = explosion.get(0);
    poof.explode();
  }
}

