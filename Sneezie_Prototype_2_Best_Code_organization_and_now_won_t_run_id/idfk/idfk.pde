int sneezieCount = 100;
ArrayList<PVector> loc = new ArrayList<PVector> ();
ArrayList<PVector> vel = new ArrayList<PVector> ();
ArrayList<PVector> acc = new ArrayList<PVector> ();
float sz;
PVector mouse;
int sneeziemax=20;

void setup() {
  size(800, 600);
  while (loc.size() < sneeziemax) {
    loc.add(new PVector());
  }
  for (int i=0; i < loc.size (); i++) {
    PVector thisone= loc.get(i);
    ellipse(thisone.x, thisone.y, sz, sz);
  }

  sz = 20.;
  colorMode(HSB, 360, 100, 100, 100);
}
void draw() {
  //  mouse = new PVector(mouseX, mouseY);
  //  for(int i=0; i < loc.size(); i++){
  //    ellipse(loc[.x, loc[i].y, sz, sz);
  //    if(loc[i].dist(mouse) < sz/2 && mousePressed){
  //      println(frameCount);
  //      fill(frameCount%360, 100, 100, 75);
  //    }
  //  }
}

