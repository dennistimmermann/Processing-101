ArrayList<Ball> balls;
float slow, speed;

void setup() {

  frameRate(30);
  size(500,500);
  noStroke();

  balls = new ArrayList<Ball>();

  for(int i = 0; i< 100; i++)
    balls.add(new Ball(width/2, height/2));

  speed = 0.2;
  slow = 1.001;

}

void draw() {

  background(250);

  for(Ball b : balls)
    b.update();

}

void mouseClicked() {

  for(Ball b : balls)
    b.hitTest(mouseX, mouseY);

}

void keyPressed() {

  if(key == ' ')
    slow = 0.998;

}

void keyReleased() {

  if(key == ' ')
    slow = 1.002;

}
