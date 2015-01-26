  ArrayList<title> bubble = new ArrayList<title>();
  title text = new title();
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
  for (int i=0; i<350; i++) {
    bubble.add(new title());
    title boop = bubble.get(i);
    boop.showBalls();
    boop.bounce();
  }
    text.showText();
 


}

