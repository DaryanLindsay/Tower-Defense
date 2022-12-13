//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to
//the node's instructions.

class Node {
  float x, y, dx, dy;

  Node( float _x, float _y, float _dx, float _dy) {
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
  }

  void show() {
    //fill(red);
    ////circle(x, y, 30);
    //strokeWeight(10);
    //stroke(red);
    //line(x, y, dx*x*5, dy*x*5);
  }
}
