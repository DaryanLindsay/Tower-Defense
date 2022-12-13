//Tower Defense Game
//Daryan Lindsay
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAP_SELECT = 4;
int mode;

//Pallette
color black = #011627;
color white = #fdfffc;
color blue = #00a5cf;
color red = #e71d36;
color orange = #ff9f1c;
color green = #70e000;
color gray = #ccc5b9;
color gold = #fdc500;
color purple = #5a189a;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button nextWave;
Button build;
Button gun;
Button play;
Button gunTower;
Button AOETower;
Button sniperTower;
Button map1;
Button map2;
Button play2;
Button menu;


//Collections of objects
Node[] nodes;
Node[] map1nodes;
Node[] map2nodes;
ArrayList <Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<AoE_Ring> AoE_Rings;

//Images and Gifs
Gif introAnimation;

//Fonts

//wave counter
int wave = 1;


//booleans
Boolean buildClicked;
Boolean map1select;

//money
int money = 1000;

float counter = 11;

//PImage
PImage map1pic, map2pic;

//lives variables
int lives;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
  
  lives = 3;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introAnimation = new Gif("introAnimation/frame_", "_delay-0.07s.gif", 68, 1, width/2, height/2, width, height);
  map1pic = loadImage("map1.PNG");
  map2pic = loadImage("map2.PNG");
  
  //Load Fonts

  //Create Collections of Objects
  //mobs = new Mob(0, 400, 1, 0);
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  AoE_Rings = new ArrayList<AoE_Ring>();
  
  //test mobs
  //mobs.add(new Mob(0, 400, 1, 0));
  
  
 //booleans
 buildClicked = false;

}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black, 40);
  nextWave = new Button("", width - 75, height/7, 140, 80, white, blue, 20);
  build = new Button("BUILD", width - 75, height * 2/7, 140, 80, green, white, 20);
  //gun = new Button("GUN", width - 75, height * 3/7, 140, 80, black, green, 20);
  play = new Button("PLAY", width - 75, height * 2/7, 140, 80, red, blue, 20);
  gunTower = new Button("GUN TOWER ($250)", width - 75, height * 3/7, 140, 80, red, black, 17);
  AOETower = new Button("AoE TOWER ($500)", width - 75, height * 4/7, 140, 80, orange, white, 17);
  sniperTower = new Button("SNIPER TOWER ($500)", width - 75, height * 5/7, 140, 80, blue, green, 15);
  map1 = new Button(map1pic, 250, height/2, 350, 350, blue, purple, 30);
  map2 = new Button(map2pic, 750, height/2, 350, 350, red, gold, 30);
  play2 = new Button("PLAY AGAIN", 250, height/2, 200, 100, gray, blue, 30);
  menu = new Button("MENU", 750, height/2, 200, 100, gold, red, 30);

  //PLAY - Next Wave, To Build Mode

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE

  //GAMEOVER - Reset
}

void makeNodes() {

  nodes = new Node[6];
  
  nodes[0] = new Node(100, height/2, 0, -1);
  nodes[1] = new Node(100, 200, 1, 0);
  nodes[2] = new Node(400, 200, 0, 1);
  nodes[3] = new Node(400, 500, 1, 0);
  nodes[4] = new Node(600, 500, 0, -1);
  nodes[5] = new Node(600, 400, 1, 0);
  
  map1nodes = new Node[6];
  
  map1nodes[0] = new Node(100, height/2, 0, -1);
  map1nodes[1] = new Node(100, 200, 1, 0);
  map1nodes[2] = new Node(400, 200, 0, 1);
  map1nodes[3] = new Node(400, 500, 1, 0);
  map1nodes[4] = new Node(600, 500, 0, -1);
  map1nodes[5] = new Node(600, 400, 1, 0);
  
  map2nodes = new Node[6];
  
  map1nodes[0] = new Node(100, height/2, 0, 1);
  map1nodes[1] = new Node(100, 700, 1, 0);
  map1nodes[2] = new Node(600, 700, 0, -1);
  map1nodes[3] = new Node(600, 100, -1, 0);
  map1nodes[4] = new Node(350, 100, 0, 1); 
  map1nodes[5] = new Node(350, 400, 1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }else if( mode == MAP_SELECT){
    mapSelect();
  }
}
