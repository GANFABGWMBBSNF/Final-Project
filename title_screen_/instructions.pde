class instructions {
 
 instructions() {
  
  
 }


  void show() {
   background(0,0,25,100);
   fill(frameCount%360,100,100,70);
   rect(0,0,width,65);
   rect(0,570,width,100);
   
   textFont(titleFont);
   fill(0,0,25,100);
   textAlign(CENTER);
   text("INSTRUCTIONS",width/2,50);
   text("INSTRUCTIONS",(width/2)+1,50);
   
   fill(frameCount%360,100,100,70);
   textSize(25);
   textAlign(LEFT);
   text("This is a sneezie.",25,125);
   text("Your job is get rid of every sneezie before time runs out!",25,225);
   text("Do this by pressing down on your mouse.",25,300);
   text("There are a few special sneezies, as well...",25,400);
   text("Try getting rid of these!",190,425);
   
  }  
  
}
