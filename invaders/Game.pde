class Game {

    Player player;
    int enemyCount, playerCount;
    float lowestEnemy;
    int lives = 3;

    Game() {
        Entity.entities.clear();
        player = new Player();

        for(int j = 0; j < 4; j++) {
            for(int i = 0; i < 10; i++) {
                new Enemy( 30 + i*60, 50 + j*40);
            }
        }

        Entity.tick();
    }

    void update() {
        background(0);

        println("player.health: "+player.health);

        enemyCount = playerCount = 0;
        lowestEnemy = 0;

        for(Entity e : Entity.entities) {
            if(e instanceof Enemy) {
                enemyCount++;
                lowestEnemy = max(lowestEnemy, e.coords.y);
            }
        }

        textFont(font, 18);
        text("lives: "+player.health, width/2, 10);

        fill(255);
        textFont(font, 48);
        if(enemyCount == 0) {
            println("won");
            text("YOU WIN!", width/2, height/2);
        }
        else if(player.health <= 0 || lowestEnemy > height-10) {
            println("lost");
            text("YOU LOSE", width/2, height/2);
        }
        else {
            Entity.tick();
        }

        Entity.render();

    }
}
