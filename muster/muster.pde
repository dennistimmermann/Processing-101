float hh;
float hw;

float gc; //globaler zaehler

float sonarx, sonary;

void setup() {
  size(500,500);
  background(255);
  
  hh = height/2;
  hw = width/2;
  
  gc = 0;
}

void draw() {
  
  // 6 - earthquake
  pushMatrix();  //shake scales START
  translate(random(-1,1),random(-1,1));
 
  // 1 - scales
  fill(255);
  stroke(100);
  for(int i = 0; i-20 < width; i+=20) {
    for(int j = 0; j-2 < height; j+=20) {
      ellipse(i, j + (i/20)%2 * 10, 27,27);
    }
  }
  popMatrix();  //shake scales END
  
  // 8 - sonar
  if(gc%255 == 0) {
    sonarx = random(0, width);
    sonary = random(0, height);
  }
  fill(100, 200 - gc%255);
  noStroke();
  ellipse(sonarx, sonary, (gc%255)*3, (gc%255)*3);

  // 2 - spiral
  pushMatrix();
  translate(hw, hh);
  rotate(gc * -0.01);
  stroke(130);
  float prevx, prevy;
  prevx = prevy = 0;

  for(int i = 0; i < 700; i++) {
    float x = i/4 * cos(i * 0.7);
    float y = i/4 * sin(i * 0.7);
    line(x, y, prevx, prevy);
    prevx = x;
    prevy = y;
  }
  popMatrix();
  
  stroke(100,150,200);
  // 3 - weird diagonals
  for(int i = 0; i < width; i+=30) {
    line(i,0,i + (i%50)*3,height); 
  }
  
  // 4 - spring
  stroke(170);
  fill(170);
  for(int i = -140; i < width; i++) {
    float y = sin( (i*0.1) ) * 40;
    ellipse(i + (gc%40)*PI,y + hh,10,10);
  }
  
  // 5 - scanlines
  while(random(0,5) > 3) {
    float x = random(0, width);
    line(x,0,x,height);
  }
  
  // 7 - mouse halo
  pushMatrix();
  noFill();
  translate(mouseX, mouseY);
  rotate(gc/10);
  rectMode(RADIUS);
  rect(0, 0, 30, 30);
  popMatrix();
  
  // 9 - channel logo
  fill(100);
  float channel = millis()%3;
  pushMatrix();
  translate(width-80,40);
  if(channel == 0) {
    ellipse(0,0, 40, 40);
  }
  if(channel == 1) {
    rect(0,0,15,15);
  }
  if(channel == 2) {
    triangle(-20, 20, 0, -20, 20, 20);
  }
  popMatrix();
  
  // 10 - saw
  noStroke();
  for(float i = -30 + (gc%30); i < height; i+=30) {
    triangle(0,i,0,i+30,15,i+15);
  }
  
  gc++;
}
