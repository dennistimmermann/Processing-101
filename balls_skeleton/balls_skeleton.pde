Ball b, c;

void setup() {
  size(600,600);
  
  //TODO: erstelle die Baelle in einer schleife und trage sie
  //      in einer Liste ein
  
  //erstelle einen neuen Ball mit den Koordinaten 300,300
  b = new Ball(300,300);
  
  //und einen mit 200, 400;
  c = new Ball(200,400);
  
}

void draw() {
  
  //TODO: gehe die liste durch und rufe jedesmal .update() auf
  
  //sage dem Ball er soll sich selbst zeichnen
  b.update();
  c.update();
  
}
