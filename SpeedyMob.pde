class SpeedyMob extends Mob{
  SpeedyMob(float _x, float _y, float _vx, float _vy, float _speed) {
    super( _x, _y, _vx, _vy, _speed);
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 20;
    maxhp = 20;
    fillColor = gold;
    fillStroke = red;
    speed = _speed;
  }
  
  
}
