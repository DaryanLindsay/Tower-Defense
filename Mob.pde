//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy, d, speed;
  int hp, maxhp;
  color fillColor, fillStroke;

  Mob (float _x, float _y, float _vx, float _vy, float _speed) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 20;
    maxhp = 20;
    fillColor = red;
    fillStroke = black;
    speed = _speed;
  }

  void show() {
    stroke(black);
    fill(fillColor);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }

  void act() {
    x = x + vx*speed;
    y = y + vy*speed;
    if (x >= width - 150) {
      lives--;
      hp = 0;
    }

    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }
    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp = hp - myBullet.power;
        myBullet.hp--;
      }
      i++;
    }
  }

  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x - 27, y - (d+10) - 2, 54, 24);
    fill(gold);
    rect(x - 25, y - (d+10), 50, 20);
    fill(red);
    rect(x - 25, y - (d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
