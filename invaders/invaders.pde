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
