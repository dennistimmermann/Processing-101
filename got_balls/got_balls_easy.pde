ArrayList<Ball> balls;

void setup() {

  frameRate(30);
  size(500,500);
  noStroke();

  balls = new ArrayList<Ball>();

  for(int i = 0; i< 100; i++) {
    balls.add(new Ball(width/2, height/2));
  }
}

void draw() {

  background(250);

  for(Ball b : balls) {
    b.update();
  }

}

class Ball {

  float x, y;
  float size; //radius
  float dirX, dirY;
  boolean moving;
  color c;

  Ball(float x_, float y_) {

    x = x_;
    y = y_;

    size = random(10, 15); //halfed because reasons ... radius
    dirX = random(-10, 10);
    dirY = random(-10, 10);

    moving = true;

    c = color(125, 200, 200);

  }

  void update() {

    if(moving) {

      x = constrain(dirX + x, size, width -size);
      y = constrain(dirY + y, size, height-size);

      if(x - size <= 0 || x + size >= width) {
        dirX *= -1;
      }

      if(y - size <= 0 || y + size >= height) {
        dirY *= -1;

      }

    }

    draw();

  }

  void hitTest(float x_, float y_) {
    
    if(dist(x_, y_, x, y) <= size) {
      moving = !moving;
    }
  
  }

  void draw() {

    if(moving) {
      fill(125, 200, 200, 200);
    }

    else {
      fill(200, 50);
    }

    ellipse(x, y, size*2, size*2);

  }

}

void mouseClicked() {

  for(Ball b : balls) {
    b.hitTest(mouseX, mouseY);
  }

}
