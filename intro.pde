//This function draws the INTRO screen.

float angle = 0;


void intro() {
  introAnimation.show();
  start.show();
  if (start.clicked) {
    mode = MAP_SELECT;
    lives = 3;
    money = 1000;
    wave = 1;
    waveCount = 0;
    mobs = new ArrayList<Mob>();
    towers = new ArrayList<Tower>();
    bullets = new ArrayList<Bullet>();
    AoE_Rings = new ArrayList<AoE_Ring>();
  }
  textSize(60 + 50*sin(angle));
  angle = angle + 0.1;
  text("TOWER DEFENSE", width/2, height/5);
}
