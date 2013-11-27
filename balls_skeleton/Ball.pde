class Ball {
  
  // variablen deklarieren
  float x, y;
  
  // dem Konstruktor werden die Koordinaten uebergeben und dann gespeichert
  Ball(float x_, float y_) {
    
    // setze die uebergebenen koordinaten
    x = x_;
    y = y_;
    
  }
  
  // funktion um einen Ball zu zeichnen, 
  // wird aus der draw() der Hauptdatei aufgerufen
  void update() {
    
    ellipse(x,y,40,40);
    
  }
}
