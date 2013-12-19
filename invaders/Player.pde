class Player extends Entity {

    float velocity;
    boolean shoots;
    int shootDelay;
    PImage img;

    Player() {
        super(width/2, height - 30, 52, 32);
        shoots = false;
        shootDelay = 0;
        img = loadImage("player.png");
    }

    void draw() {
        image(this.img, this.coords.x, this.coords.y);
    }

    void update() {
        this.coords.x += velocity;

        if(shoots && shootDelay < 0) {
            shoot();
            shootDelay = 30;
        }
        shootDelay--;
    }

    void shoot() {
        new Bullet(this.coords.x, this.coords.y-20, -3, this);
    }
}
