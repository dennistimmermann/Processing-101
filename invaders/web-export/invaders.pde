import java.util.Iterator;

Game game;
PFont font;

void setup() {

    frameRate(30);

    size(600,600);

    rectMode(CENTER);
    imageMode(CENTER);
    textAlign(CENTER, CENTER);
    font = loadFont("o48.vlw");
    textFont(font, 48);

    game = new Game();
}

void draw() {
    game.update();
}

void keyPressed() {
    if(keyCode == LEFT) {
        game.player.velocity = -6;
    }

    if(keyCode == RIGHT) {
        game.player.velocity = 6;
    }

    if(key == ' ') {
        game.player.shoots = true;
    }

    if(key == 'r') {
        loop();
        game = new Game();
    }
}

void keyReleased() {
    if(keyCode == LEFT || keyCode == RIGHT) {
        game.player.velocity = 0;
    }

    if(key == ' ') {
        game.player.shoots = false;
    }
}
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
static abstract class Entity {

    PVector coords;
    int w, h;
    boolean visible, delete;

    static ArrayList<Entity> entities = new ArrayList<Entity>();
    static ArrayList<Entity> queue = new ArrayList<Entity>();

    Entity(float x_, float y_, int w_, int h_) {
        coords = new PVector(x_, y_);
        w = w_;
        h = h_;
        visible = true;
        delete = false;
        queue.add(this);
    }

    abstract void draw();

    abstract void update();

    boolean checkCollision(Entity e) {
        if(e == this) return false;
        if( abs(this.coords.x - e.coords.x) < (this.w + e.w)/2 && abs(this.coords.y - e.coords.y) < (this.h+e.h)/2 ) {
            return true;
        }
        return false;
    }

    float getCollisionAngle(Entity e) {
        return (this.coords.x - e.coords.x)/(this.w/2);
    }

    static void render() {
        Iterator<Entity> iter = entities.iterator();
        while(iter.hasNext()) {
            Entity e = iter.next();
            if(e.delete) {
                iter.remove();
            }
            else if(e.visible) {
                e.draw();
            }
        }
    }

    static void tick() {
        entities.addAll(queue);
        queue.clear();
        for(Entity e : entities) {
            e.update();
        }
    }
}
class Game {

    Player player;
    int enemyCount, playerCount;
    float lowestEnemy;

    Game() {
        Entity.entities.clear();
        player = new Player();

        for(int j = 0; j < 4; j++) {
            for(int i = 0; i < 10; i++) {
                new Enemy( 30 + i*60, 30 + j*40);
            }
        }

        Entity.tick();
    }

    void update() {
        background(0);

        enemyCount = playerCount = 0;
        lowestEnemy = 0;

        for(Entity e : Entity.entities) {
            if(e instanceof Enemy) {
                enemyCount++;
                lowestEnemy = max(lowestEnemy, e.coords.y);
            }
            if(e instanceof Player) {
                playerCount++;
            }
        }

        fill(255);

        if(enemyCount == 0) {
            println("won");
            text("YOU WIN!", width/2, height/2);
        }
        else if(playerCount == 0 || lowestEnemy > height-10) {
            println("lost");
            text("YOU LOSE", width/2, height/2);
        }
        else {
            Entity.tick();
        }

        Entity.render();

    }
}
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

