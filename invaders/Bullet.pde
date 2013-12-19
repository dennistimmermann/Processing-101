class Bullet extends Entity {

    float v;
    Entity source;
    PImage img;

    Bullet(float x, float y, float v_, Entity source_) {
        super(x,y,4,16);
        v = v_;
        source = source_;
        img = loadImage("bullet.png");
    }

    void draw() {
        image(this.img, this.coords.x, this.coords.y);
    }

    void update() {
        this.coords.y += this.v;

        for(Entity e : Entity.entities) {
            if(e.checkCollision(this)) {

                if(this.source instanceof Player && e instanceof Enemy) {
                    this.delete = true;
                    e.delete = true;
                }

                if(this.source instanceof Enemy && e instanceof Player) {
                    e.delete = true;
                }
            }
        }

        if(this.coords.x < 0 || this.coords.x > height) {
            this.delete = true;
        }
    }

}
