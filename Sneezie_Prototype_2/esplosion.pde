class esplosion {
  int count = 10;
  ball[] debris = new ball[count];
  esplosion() {
    for (int i=0; i<debris.length; i++) {
      debris[i]= new ball();
    }
  }

  void appear() {
    for (int i=0; i<debris.length; i++) {
      debris[i].display();
      debris[i].move();
      debris[i].age();
    }
  }
}

