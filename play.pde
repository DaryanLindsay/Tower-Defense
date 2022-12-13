//This function draws the PLAY screen

void play() {
  if (map1select == true) {
    drawMap1();
  } else if (map1select == false) {
    drawMap2();
  }

  animateThings();
  drawPlayerInterface();
  handleButtonClicks();

  //display mode
  if (mode == PLAY) {
    //display mode
    fill(blue);
    textSize(50);
    text("PLAY MODE", width/2, 45);
  }

  //quordinates
  fill(red);
  textSize(20);
  if (mouseX < width - 150) {
    text(mouseX + ", " + mouseY, mouseX, mouseY - 20);
  }
}


void drawMap1() {
  background(green);

  //path
  stroke(gray);
  strokeWeight(50);
  line(0, height/2, 100, height/2);
  line(100, height/2, 100, 200);
  line(100, 200, 400, 200);
  line(400, 200, 400, 500);
  line(400, 500, 600, 500);
  line(600, 500, 600, 400);
  line(600, 400, width - 150, 400);
  textSize(50);
  fill(gold);
  text("LIVES:" + lives, 80, 50);
}

void drawMap2() {
  background(gray);
  stroke(blue);
  strokeWeight(50);
  line(0, height/2, 100, height/2);
  line(100, height/2, 100, 700);
  line(100, 700, 600, 700);
  line(600, 700, 600, 100);
  line(600, 100, 350, 100);
  line(350, 100, 350, 400);
  line(350, 400, width - 150, 400);
  textSize(50);
  fill(gold);
  text("LIVES:" + lives, 100, 100);
}


void animateThings() {
  //animate things
  int m = 0;
  while (m < mobs.size()) {
    Mob myMob = mobs.get(m);
    myMob.show();
    myMob.act();
    if (myMob.hp <= 0) {
      mobs.remove(m);
      money = money + 20;
    } else {
      m++;
    }
  }


  int i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    myTower.act();
    myTower.show();
    i++;
  }

  int n = 0;
  while (n < bullets.size()) {
    Bullet myBullet = bullets.get(n);
    if (mobs.size() > 0) {
      myBullet.act();
      myBullet.show();
    }
    if (myBullet.hp <= 0) {
      bullets.remove(n);
    } else {
      n++;
    }
  }
}

void drawPlayerInterface() {
  //sidebar
  strokeWeight(0);
  stroke(black);
  fill(black);
  rect(width - 75, height/2, 150, height);

  //next wave button
  fill(red);
  textSize(25);
  text("NEXT WAVE:"+wave, width-75, 50);
  nextWave.show();
  fill(black);
  triangle(nextWave.x - nextWave.w/3, nextWave.y - nextWave.h/3, nextWave.x + nextWave.w/3, nextWave.y, nextWave. x - nextWave.w/3, nextWave.y + nextWave.h/3);

  //build button
  build.show();


 
}


 int waveCount = 0;


void handleButtonClicks() {
  if(nextWave.clicked && mobs.size() == 0){
    addWave();
    waveCount++;
    wave++;
  }
  
  if(build.clicked && mobs.size() == 0){
    mode = BUILD;
  }
 
 if(lives <= 0){
  mode = GAMEOVER;
 }
}

void addWave() {
  int i  = 0;
  int mobx = 0;

  while(i < waveCount) {
    mobs.add(new Mob(mobx, 400, 1, 0, 2));
    mobx = mobx - 50;
    i++;
    
  }

 if(waveCount % 3 == 0){
 
   i = 0;
   mobx = 50;
   while(i < waveCount/3) {
     mobs.add(new ChonkyMob(mobx, 400, 1, 0, 1));
     mobx = mobx - 100;
     i++;
   }
   if(waveCount % 3 == 0) {
     i = 0;
     mobx = 50;
     mobs.add(new SpeedyMob(mobx, 400, 1, 0, 4));
     mobx = mobx - 50;
     i++;
   }
 }
 
 
}
