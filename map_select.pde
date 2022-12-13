void mapSelect() {
  background(black);
  fill(green);
  textSize(50);
  text("GRASSY PLAINS", 250, 600);
  map1.show();
  fill(gray);
  text("COURTYARD BRAWL", 750, 600);
  map2.show();
  if (map1.clicked) {
    map1select = true;
    mode = PLAY;
    // nodes = map1nodes;
    nodes[0] = new Node(100, height/2, 0, -1);
    nodes[1] = new Node(100, 200, 1, 0);
    nodes[2] = new Node(400, 200, 0, 1);
    nodes[3] = new Node(400, 500, 1, 0);
    nodes[4] = new Node(600, 500, 0, -1);
    nodes[5] = new Node(600, 400, 1, 0);
  } else if (map2.clicked) {
    map1select = false;
    mode = PLAY;
    //nodes = map2nodes;
    nodes[0] = new Node(100, height/2, 0, 1);
    nodes[1] = new Node(100, 700, 1, 0);
    nodes[2] = new Node(600, 700, 0, -1);
    nodes[3] = new Node(600, 100, -1, 0);
    nodes[4] = new Node(350, 100, 0, 1);
    nodes[5] = new Node(350, 400, 1, 0);
  }
  
  //title for screen
  fill(gold);
  textSize(80);
  text("SELECT A MAP", width/2, 100);
}
