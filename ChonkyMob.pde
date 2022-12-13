class ChonkyMob extends Mob{
  ChonkyMob(float _x, float _y, float _vx, float _vy, float _speed) {
    super( _x, _y, _vx, _vy, _speed);
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 80;
    hp = 40;
    maxhp = 40;
    fillColor = purple;
    fillStroke = black;
    speed = _speed;
  }
  
}
