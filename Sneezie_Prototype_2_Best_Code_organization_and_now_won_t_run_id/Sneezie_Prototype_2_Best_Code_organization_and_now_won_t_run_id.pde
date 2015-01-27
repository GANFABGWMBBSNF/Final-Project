ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
ArrayList<timeSneezie> timePower = new ArrayList<timeSneezie>();
ArrayList<burstSneezie> burstPower = new ArrayList<burstSneezie>();
ArrayList<bubbles> winningBubbles= new ArrayList<bubbles>();
ArrayList<title> introBubbles = new ArrayList<title>();
title titleText = new title();

boolean firstClick=true;
boolean loading=true, burst;
boolean startScreen=true, instructionScreen=false, gameScreen=false;
boolean winScreen=false, loseScreen=false;
boolean timePowerOn=false, timePowerOff=false;
boolean burstPowerOn=false, burstPowerOff=false;
boolean plusTime=false, displaytime;
boolean levelChanged=false;

float time=10, timeFinal=0;
float sneezieColor, sneezieColorC=0.5;
float timePowerChance=random(100), burstPowerChance=random(100);
float maxBalls=50, maxSneezie=20, maxBubbles=5;
int level=1, levelTextColor=0, stage=1, frame=0;

PFont titleFont;
PFont titleFontXL;

PVector mouse=new PVector(mouseX, mouseY);
String timeComment;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 25, 100);
  textAlign(CENTER);
  titleFont = loadFont("ComicNeueAngular-Light-48.vlw");
  titleFontXL = loadFont("ComicNeueAngular-Light-175.vlw");
}

void draw() {
  background(0, 0, 25, 100);
  frame+=1;
/*
  print("Stage: ");
  println(stage);
  print("Level: ");
  println(level);
  print("gameScreen Value: ");
  println(gameScreen);
  println("sneezieColor Value: " + sneezieColor);
  println("Sneezies Size: "+sneezies.size());
  println("TimePowerSize: "+timePower.size());
  println("--------------------"); */

  if (startScreen) {
    for (int i=0; i<350; i++) {
      introBubbles.add(new title());
      title boop = introBubbles.get(i);
      boop.showBalls();
      boop.bounce();
    }
    titleText.showText();
  }
  
  if (keyPressed && key==TAB) {
    
  }
  
  if (keyPressed && key==' ') {
    gameScreen = true;
  } 

  if (gameScreen) {

    if (loading) {
      for (int i=0; i<maxSneezie; i++) {
        sneezies.add(new sneezie());
        loading=false;
      }
    }
    //////////////////////////////////////
    if (esplosions.size() < maxBalls) {
      if (mousePressed) {
        esplosions.add(new  ball());
      }
    }
    //////////////////////////////////////
    if (burst) {
      for (int k=0; k<5; k++) {
        for (int i=0; i<50; i++) {
          esplosions.add(new ball());
        }
      }
      burst=false;
    }

    /////////////DEBRIS////////////////
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

    /////////////SNEEZIES//////////////
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
          if (sneezies.size()>0) {
            if (i!=sneezies.size()) {
              sneezies.remove(i);
            }
          }
        }
      }
    }

    ///////EXTRA TIME POWER UP/////////
    if (timePowerOff!=true) {
      if (timePowerChance<25) {
        timePowerOn=true;
      }
    }
    if (timePowerOn) {
      for (int i=0; i<1; i++) {
        timePower.add(new timeSneezie());
      }      
      timePowerOn=false;
      timePowerOff=true;
    }
    for (int i=0; i<1; i++) {
      if (timePower.size ()>0) {
        timeSneezie timezie = timePower.get(i);
        timezie.display();
        timezie.floatyo();
        timezie.bounce();
        for (int h=0; h<esplosions.size (); h++) {
          ball debris3 = esplosions.get(h);
          if (timezie.sneezing(debris3)) {
            if (i!=timePower.size()) {
              timePower.remove(i);
              time+=5;
              plusTime=true;
             // println("working");
            }
          }
        }
      }
    }
    for (int i=0; i<301; i++) {                //WIP
      if (plusTime) {
        displaytime=true;
      }
      plusTime=false;
    }
    if (displaytime) {
      text("+5s", mouseX, mouseY);
    }


    /////////BURST POWER UP/////////
    if (burstPowerOff!=true) {
      if (burstPowerChance<25) {
        burstPowerOn=true;
      }
    }
    if (burstPowerOn) {
      for (int i=0; i<1; i++) {
        burstPower.add(new burstSneezie());
      }      
      burstPowerOn=false;
      burstPowerOff=true;
    }
    for (int i=0; i<1; i++) {
      if (burstPower.size ()>0) {
        burstSneezie burstzie = burstPower.get(i);
        burstzie.display();
        burstzie.floatyo();
        burstzie.bounce();
        for (int h=0; h<esplosions.size (); h++) {
          ball debris3 = esplosions.get(h);
          if (burstzie.sneezing(debris3)) {
            if (i!=burstPower.size()) {
              burstPower.remove(i);
              burst=true;
            }
          }
        }
      }
    }


    //////////////INFORMATION TEXT////////////////////////
    fill(#E71AE8);
    textSize(12);
    text("#PinkprintOniTunes", width-75, height-20);

    textSize(20);
    fill(levelTextColor+(level-1)*60, 99, 99, 50);
    text("Level: " + level, width-75, 30);

    text("Time Left: ", 75, 30);
    text(time, 155, 30);

    textAlign(LEFT);
    textSize(15);
    time-=.0167;
    if (time > 5) {
      fill(100, 100, 100, 100);
      timeComment="GO! GO! GO!";
    }
    if (time <= 5 && time > 2.5) {
      fill(50, 100, 100, 100);
      timeComment="Speed It Up!";
    }
    if (time <= 2.5 && time >0) {
      fill(0, 100, 100, 100);
      timeComment="Final Stretch!";
    }
    text(timeComment, 25, 60);
    textAlign(CENTER);

    if (sneezies.size()==0 && timePower.size()==0 && burstPower.size()==0 || time<=0) {
      gameScreen=false;
    }
  }//end of stage 1(gameScreen==true)

  if(gameScreen==false && time<0) {
    loseScreen=true;
  }
  
  if(loseScreen) {
    /////LOSE SCREEN////
    if (sneezies.size()>0 || timePower.size()>0 || burstPower.size()>0) {
      background(0);
      fill(#120DBC);
      textSize(50);
      text("GAME OVER", width/2, height/2);
    }
  }
  
  if(gameScreen==false && time>0 && (sneezies.size() >0 || timePower.size()>0 || burstPower.size()>0)) {
    winScreen=true;
  }

  if(winScreen==true) {
      /////WIN SCREEN///////
      background(0);
      if (winningBubbles.size()<maxBubbles) {
        for (int i=0; i<100; i++) {
          winningBubbles.add(new bubbles());
        }
      }
      for (int i=0; i<winningBubbles.size (); i++) {
        bubbles bubbly = winningBubbles.get(i);
        bubbly.show();
        bubbly.bounce();
        if (bubbly.loc.y<-20 && bubbly.vel.y<0) {
          winningBubbles.remove(i);
        }
      }
      fill(#120DBC);
      textSize(50);
      text("YOU WON!!!", width/2, height/2);
      textSize(25);
      text("Press Enter to Advance", width/2, 2*height/3);
    }
  //end of stage 2(gameScreen==false)
}//end of main code

void keyReleased() {
  if (gameScreen==false && sneezies.size() <= 0 && timePower.size()<=0 && burstPower.size()<=0) {
    for (int i=0; i<sneezies.size (); i++) {
      sneezies.remove(i);
    }
    for (int i=0; i<timePower.size (); i++) {
      timePower.remove(i);
    }
    for (int i=0; i<burstPower.size (); i++) {
      burstPower.remove(i);
    }
    for (int i=0; i<esplosions.size (); i++) {
      esplosions.remove(i);
    }
    if (key==ENTER) {
      time=10;
      frame=0;
      sneezieColor=level*60;
      sneezieColorC=abs(sneezieColorC);
      timePowerChance=(random(100));
      timePowerOn=false;
      timePowerOff=false;
      burstPowerChance=(random(100));
      burstPowerOn=false;
      burstPowerOff=false;
      loading=true;
      //stage=1;
      level+=1;
      maxSneezie+=5;
      gameScreen=true;
      for (int i=0; i<winningBubbles.size (); i++) {
        winningBubbles.remove(i);
      }
    }
  }




  ///////DEVELOPER CHEATS//////// 
  else {
    if (key > '0' && key < '7') {
      for(int i=0; i<sneezies.size (); i++) {
        sneezies.remove(i);
      }
      time=10;
      frame=0;
      sneezieColor=level*60;
      sneezieColorC=abs(sneezieColorC);
      loading=true;
      gameScreen=true;
      
      if (key=='1') {
        level=1;
      }
      if (key=='2') {
        level=2;
      }
      if (key=='3') {
        level=3;
      }
      if (key=='4') {
        level=4;
      }
      if (key=='5') {
        level=5;
      }
      if (key=='6') {
        level=6;
      }
      if (key=='7') {
        level=7;
      }
    }
  }
}

