//This function draws the BUILD screen
void build() {
  if (map1select == true) {
    drawMap1();
  } else if (map1select == false) {
    drawMap2();
  }
  animateThings();

  if (mode == BUILD) {
    //display build mode
    fill(red);
    textSize(50);
    text("BUILD MODE", width/2, 40);
  }

  //sidebar
  strokeWeight(0);
  stroke(black);
  fill(black);
  rect(width - 75, height/2, 150, height);
  fill(gold);
  gunTower.show();
  AOETower.show();
  sniperTower.show();
  play.show();
  fill(gold);
  textSize(40);
  text("$"+money, width - 75, 100);

  if (play.clicked) {
    mode = PLAY;
  }

  if (counter < 10) {
    counter = counter + 0.5;
    text("INSUFFICIENT FUNDS", width/2, height/4);
  }

  if (gunTower.clicked && money >= 250) {
    towers.add(new Tower(0, 0, 0, 60, 2));
  } else if (gunTower.clicked && money < 250) {
    counter = 0;
  }

  if (sniperTower.clicked && money >= 500) {
    towers.add(new Tower(0, 0, 0, 60, 4));
  } else if (sniperTower.clicked && money < 500) {
    counter = 0;
    
  }

  if (AOETower.clicked && money >= 500) {
    towers.add(new Tower(0, 0, 0, 60, 3));
  } else if (AOETower.clicked && money < 500) {
    counter = 0;
   
  }
}
