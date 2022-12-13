//Some towers shoot bullets! If a mob is hit by a bullet.
//it does damage.

class Bullet {
  float x, y, vx, vy;
  int hp, d, power;
  Bullet(float _x, float _y, float _vx, float _vy) {
   x = _x;
   y = _y;
   vx = _vx;
   vy = _vy;
   hp = 1;
   d = 15;
   power = 2;
  }
 
 void show() {
   fill(orange);
   stroke(black);
   strokeWeight(2);
   circle(x, y, d);
 }
 
 void act() {
   x = x + vx;
   y = y + vy;
    if(x >  width|| x < 0 || y > height || y < 0) {
      hp--;
    }
 }
 
}
