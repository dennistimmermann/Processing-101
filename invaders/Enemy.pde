class Enemy extends Entity {

    int dom, domCount, speed;
    int timeTillShoot;
    PImage img, img2;

    Enemy(float x_, float y_) {
        super(x_, y_, 44, 32);
        dom = 40;
        domCount = dom/2;
        speed = 1;
        timeTillShoot = int(random(100,800));
        img = loadImage("enemy1.png");
        img2 = loadImage("enemy2.png");
    }

    void draw() {
        if(frameCount%60 > 30)
            image(this.img, this.coords.x, this.coords.y);
        else
            image(this.img2, this.coords.x, this.coords.y);
    }

    void update() {
        if(domCount <= dom) {
            this.coords.x += speed;
            domCount++;
        }
        else {
            this.coords.y += 5;
            speed *= -1;
            domCount = 0;
        }

        timeTillShoot--;
        if(timeTillShoot == 0) {
            timeTillShoot = int(random(300, 600));
            shoot();
        }
    }

    void shoot() {
        new Bullet(this.coords.x, this.coords.y, 3, this);
    }
}
