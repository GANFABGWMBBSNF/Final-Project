class explosions {
  ArrayList<debris> debrisPiece = new ArrayList<debris>();
  PVector mouse;
  boolean click = false;

  explosions() {
    mouse = new PVector (mouseX, mouseY);
  } 

  void explode() {
    for (int i=0; i<50; i++) {
      debrisPiece.add(new debris());
      debris poof = debrisPiece.get(i);

      poof.display();
      poof.move();
      poof.slowMove(mouse);
      poof.stop_(mouse);
      poof.age();
    }
  }
  ///
}

