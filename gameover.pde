//This function draws the GAMEOVER screen.

void gameOver() {
  background(black);

  fill(red);
  textSize(100);
  text("GAME OVER", width/2, height/5);

  fill(blue);
  textSize(20);
  text("Nice try", width/2, height/5 + 100);
  play2.show();
  menu.show();

  if (play2.clicked) {
    lives = 3;
    money = 1000;
    mode = PLAY;
    wave = 1;
    waveCount = 0;
    mobs = new ArrayList<Mob>();
    towers = new ArrayList<Tower>();
    bullets = new ArrayList<Bullet>();
    AoE_Rings = new ArrayList<AoE_Ring>();
  }

  if (menu.clicked) {
    mode = INTRO;
  }
}
