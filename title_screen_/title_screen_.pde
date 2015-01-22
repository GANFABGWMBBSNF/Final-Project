ArrayList<bubbles> bubble = new ArrayList<bubbles>();
float sz = 30;
float r = 30;
PVector loc = new PVector (random(width-r), random(150, 550));
PVector vel = PVector.random2D();
//  vel.mult(random(2,3));
float h;

void setup() {
  //0 0 25 100
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  textSize(190);
  textAlign(CENTER);

}

void draw() {

  background(0, 0, 25, 100);
  fill(309,100,100,100);
  noStroke();
  for (int i=0; i<300; i++) {
    bubble.add(new bubbles());
    bubbles boop = bubble.get(i);
    boop.show();
    boop.bounce();
  }

  fill(0, 0, 25, 100);
  rect(0, 0, width, 200);
  rect(0, 400, width, height);
  
  fill(frameCount%360,100,100,100);
  textSize(195);
  text("SNEEZIES",width/2,375);
  fill(0,0,25,100);
  textSize(190);
  text("SNEEZIES",width/2,375);
  noStroke();
  fill(frameCount%360,100,100,100);
  textSize(50);
  text("GOTTA CLICK EM ALL!",width/2,500);
}

