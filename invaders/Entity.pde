static abstract class Entity {

    PVector coords;
    int w, h;
    boolean visible, delete;
    int health;

    static ArrayList<Entity> entities = new ArrayList<Entity>();
    static ArrayList<Entity> queue = new ArrayList<Entity>();

    Entity(float x_, float y_, int w_, int h_) {
        coords = new PVector(x_, y_);
        w = w_;
        h = h_;
        visible = true;
        delete = false;
        queue.add(this);
        health = 3;
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
