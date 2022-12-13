//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  final int PLACING = 0;
  final int PLACED = 1;

  final int GUN = 2;
  final int AOE = 3;
  final int SNIPER = 4;

  float x, y;
  int cooldown, threshold, towerMode, towerType;

  Tower(float _x, float _y, int c, int t, int _towerType) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = t;
    towerMode = PLACING;
    towerType = _towerType;
  }

  void show() {
    if (towerType == 2) {
      gunTowerShow();
    } else if (towerType == 3) {
      AOETowerShow();
    } else if (towerType ==4) {
      sniperTowerShow();
    }
  }

  void act() {
    if (towerType == 2) {
      gunTowerAct();
    } else if (towerType == 3) {
      AOETowerAct();
    } else if (towerType == 4) {
      sniperTowerAct();
    }
  }

  void gunTowerShow() {
    fill(orange);
    stroke(black);
    strokeWeight(4);
    if (towerMode == PLACED) {
      rect(x, y, 40, 40, 30);
    } else if (towerMode == PLACING) {
      rect(mouseX, mouseY, 40, 40, 30);
      if (mousePressed) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
        money = money - 250;
      }
    }
  }

  void AOETowerShow() {
    fill(red);
    stroke(black);
    strokeWeight(4);
    if (towerMode == PLACED) {
      line(x - 100, y, x + 100, y);
      line(x, y - 100, x, y + 100);
      square(x, y, 40);
    } else if (towerMode == PLACING) {
      square(mouseX, mouseY, 40);
      if (mousePressed) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
        money = money - 500;
      }
    }
  }

  void sniperTowerShow() {
    fill(purple);
    stroke(black);
    strokeWeight(4);
    if (towerMode == PLACED) {
      circle(x, y, 40);
    } else if (towerMode == PLACING) {
      circle(mouseX, mouseY, 40);
      if (mousePressed) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
        money = money - 500;
      }
    }
  }



  void gunTowerAct() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10)); //UP
      bullets.add(new Bullet(x, y, 0, 10)); //DOWN
      bullets.add(new Bullet(x, y, -10, 0)); //LEFT
      bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
    }
  }


  void AOETowerAct() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new AoE_Ring(x, y));
    }
  }

  void sniperTowerAct() {
    stroke(orange);
    strokeWeight(10);
    cooldown++;
    if (cooldown == threshold) {
      cooldown = 0;
      if (mobs.size() > 0) {
        line(x, y, mobs.get(0).x, mobs.get(0).y);
        mobs.get(0).hp = mobs.get(0).hp - 5;
      }
    }
  }
}
