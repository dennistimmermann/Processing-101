//state 0: clock. 1: running timer, 2: stopped timer
int state = 0;
int start = 0;
int time = 0;

//milliseconds in ...
int SECOND = 1000;
int MINUTE = SECOND*60;
int HOUR = MINUTE*60;

void setup() {
  frameRate(100);
  size(420,420);
  textAlign(CENTER);
}

int calculateTime() {
  return hour()*HOUR + minute()*MINUTE + second()*SECOND;
}

void drawClockface() {
  //text
  fill(100);
  pushMatrix();
  for(int i = 1; i <= 12; i++) {
    if(i%3 == 0) {
      textSize(16);
    } else {
      textSize(11);
    }
    rotate(TWO_PI/12);
    text(""+i ,0,-183);
  }
  popMatrix();

  //lines
  pushMatrix();
  stroke(50);
  for(int i = 1; i <= 60; i++) {   
    if(i%5 == 0) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    rotate(TWO_PI/60);
    line(0,-173,0,-167);
  }
  popMatrix();
}

void drawDigital(int t) {
  fill(20);
  textSize(24);
  text(String.format("%02d:%02d:%02d",t/HOUR%24, t/MINUTE%60, t/SECOND%60), 0,90);
  if(state != 0) {
    textSize(11);
    fill(200,100,100);
    text(String.format("+%04d", t%1000),33,102);
  }
}

void drawClockhands(int t) {
  drawHand(TWO_PI/ (12*HOUR) * t, 5, #000000, 140);
  drawHand(TWO_PI/ (60*MINUTE) * t, 4, #707070, 150);
  drawHand(TWO_PI/ (60*SECOND) * t, 1, #ff0A0A, 155);
}

void drawHand(float rot, int weight, color c, int length) {
  pushMatrix();
  rotate(rot);
  strokeWeight(weight);
  stroke(c);
  fill(c);
  line(0,0,0,-1*length);
  ellipse(0,0,weight*1.3+4,weight*1.3+4);
  popMatrix();
}

void draw() {
  background(250);
  translate(width/2, height/2);
  drawClockface();
  
  if(state == 0) {
    time = calculateTime();
  } else if(state == 1) {
    time = 0;
  } else if(state == 2) {
    time = millis() - start;
  }
  drawDigital(time);
  drawClockhands(time);

}

void mouseClicked() {
  state = ++state%4;
  start = millis();
}
