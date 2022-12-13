//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring extends Bullet {
  float timer;

  AoE_Ring(float _x, float _y) {
    super(_x, _y, 0, 0);
    timer = 15;
    d = 200;
    power = 4;
  }

  void act() {
    timer = timer - 1;
    if (timer <= 0) {
      hp--;
    }
  }
}
