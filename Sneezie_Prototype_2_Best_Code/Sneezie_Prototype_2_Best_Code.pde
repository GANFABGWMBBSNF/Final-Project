ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
int maxBalls=50;
int maxSneezie;
boolean firstClick;
float[] h = new float[12];
float time;
int level;
boolean enterPressed;
boolean loading;
int stage;
boolean gameScreen; //if true then gameplay//if false then win/lose screen//
int frame;
int levelTextColor;
float sneezieColor;
float sneezieColorC;
String timeComment;

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
  levelTextColor=0;
  sneezieColorC=.5;
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
  println("sneezieColor Value: " + sneezieColor);
  println("--------------------");

  if (gameScreen) {

    if (level==1) {
      maxBalls=100;
      maxSneezie=15;
    }//end of lvl 1

    if (level==2) {
      maxBalls=100;
      maxSneezie=20;
    }//end of lvl 2

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
    sneezieColor+=sneezieColorC;
    if (sneezieColor>=level*60 || sneezieColor<=(level-1)*60) {
      sneezieColorC*=-1;
    }
    for (int i=0; i<sneezies.size (); i++) {
      sneezie yeezie = sneezies.get(i);
      fill(sneezieColor, 99, 99, 50);
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
    fill(levelTextColor+(level-1)*60, 99, 99, 50);
    text("Level: " + level, width-75, 30);

    text("Time Left: ", 75, 30);
    text(/*"Time Left: " + */(time-frame*.0167), 150, 30);

    textAlign(LEFT);
    textSize(15);
    if (time-frame*.0167 > 5) {
      fill(100, 100, 100, 100);
      timeComment="GO! GO! GO!";
    }
    if (time-frame*.0167 <= 5 && time-frame*.0167 > 2.5) {
      fill(50, 100, 100, 100);
      timeComment="Speed It Up!";
    }
    if (time-frame*.0167 <= 2.5 && time-frame*.0167 >0) {
      fill(0, 100, 100, 100);
      timeComment="Final Stretch!";
    }
    text(timeComment, 25, 60);
    textAlign(CENTER);

    if (time-frame*.0167<=0 || sneezies.size()==0) {
      gameScreen=false;
    }
  }//end of stage 1(gameScreen==true)

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
  }//end of stage 2(gameScreen==false)
}//end of main code

void keyReleased() {
  if (gameScreen==false && sneezies.size() <= 0) {
    if (key==ENTER) {
      time=10;
      frame=0;
      sneezieColor=level*60;
      sneezieColorC=abs(sneezieColorC);
      loading=true;
      stage=1;
      level+=1;
      gameScreen=true;
    }
  }
  ///////DEVELOPER CHEATS//////// 
  else {
    if (key > '0' && key < '7') {
      for (int i=0; i<sneezies.size(); i++) {
        sneezies.remove(i);
      }
      if (key=='1') {
        time=10;
        frame=0;
        sneezieColor=level*60;
        sneezieColorC=abs(sneezieColorC);
        loading=true;
        stage=1;
        level=1;
        gameScreen=true;
      }
      if (key=='2') {
        time=10;
        frame=0;
        sneezieColor=level*60;
        sneezieColorC=abs(sneezieColorC);
        loading=true;
        stage=1;
        level=2;
        gameScreen=true;
      }
      if (key=='3') {
        time=10;
        frame=0;
        sneezieColor=level*60;
        sneezieColorC=abs(sneezieColorC);
        loading=true;
        stage=1;
        level=3;
        gameScreen=true;
      }
      if (key=='4') {
        time=10;
        frame=0;
        sneezieColor=level*60;
        sneezieColorC=abs(sneezieColorC);
        loading=true;
        stage=1;
        level=4;
        gameScreen=true;
      }
      if (key=='5') {
        time=10;
        frame=0;
        sneezieColor=level*60;
        sneezieColorC=abs(sneezieColorC);
        loading=true;
        stage=1;
        level=5;
        gameScreen=true;
      }
      if (key=='6') {
        time=10;
        frame=0;
        sneezieColor=level*60;
        sneezieColorC=abs(sneezieColorC);
        loading=true;
        stage=1;
        level=6;
        gameScreen=true;
      }
      if (key==' ') {
        time=10;
        frame=0;
        sneezieColor=level*60;
        sneezieColorC=abs(sneezieColorC);
        loading=true;
        stage=1;
        gameScreen=true;
      }
    }
  }
}

