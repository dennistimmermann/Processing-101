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
