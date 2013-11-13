int w,h,state;
float x, y, vx, vy, speed;

void setup() {
  size(700,700);
  w = h = 50;
  x = width/2;
  y = height/2;
  vx = vy = 0;
  speed = 4;
  state = 0;

  ellipseMode(CORNER);
  fill(60,80,100);
}

void draw() {
  background(220);

  x += vx * speed;
  y += vy * speed;

  x = constrain(x, 0, width - w);
  y = constrain(y, 0, height - h);

  if(state == 0)
    rect(x,y,h,w);
  else if(state == 1)
    ellipse(x,y,h,w);
  else if(state == 2)
    triangle(x,y+h, x+w,y+h, x+w/2,y);
}

void keyPressed() {
  if(keyCode == UP)
    vy = -1;
  if(keyCode == DOWN)
    vy = 1;
  if(keyCode == LEFT)
    vx = -1;
  if(keyCode == RIGHT)
    vx = 1;
}

void keyReleased() {
  if(keyCode == UP || keyCode == DOWN)
    vy = 0;
  if(keyCode == LEFT || keyCode == RIGHT)
    vx = 0;
}

void mouseClicked() {
  state = ++state%3;
}
