PImage origBeaker, buret;
boolean newSetup, setup2, startDropping;
Titrant titrant;
Titrand titrand;
Indicator indicator;
float dropY;
Table table;
boolean isP = true;
String indicatorName = "phenolphthalein";
//button to change indicator
int buttonX = 700;
int buttonY = 300;
int buttonWidth = 100;
int buttonHeight = 50;
boolean reset = false;
int x;
int y;
int xdir, ydir;

void setup() {
  size(1000, 800);
  background(152, 190, 100);
  newSetup = true;
  dropY = 595;
  startDropping = false;
  textSize(75);
  fill(0);
  text("START", 383, 422);
  x = 0;
  y=0;
   xdir = 1;
   ydir=1;
  //ball animation
  
}

void avatar(int x, int y){
  //ellipse(x,y,50,10);
  rect(x,y-10,10,50);
  //ellipse(x,y-20,50,10);
}

void mouseClicked() {
  if (newSetup) {
  setup2();
  newSetup = false;
  }
}

void setup2() {
  background(255);
  setup2 = true;
  titrant = new Titrant(true, true, "HCl", 1.0, 1.0, 100.0); // change this later
  titrand = new Titrand(true, false, "NaOH", 12.0, 1.0, 0);
  indicator = new Indicator(true, false, indicatorName, 8.2, 1, 1);
  origBeaker = loadImage("original.png");
  buret = loadImage("buret.png");
}
//-----------------------------------------------------------------------------------------------------
//CHANGE THE INDICATOR
//-----------------------------------------------------------------------------------------------------

void updateIndicator() {
  if (isP) {
  indicatorName = "phenolphthalein";
  } else {
  indicatorName = "bromothymol blue";
  }
  indicator.setName(indicatorName); // Update indicator name
}

boolean isMouseOver(int x, int y, int w, int h) {
  return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
}

void mousePressed() {
  if (isMouseOver(buttonX, buttonY, buttonWidth, buttonHeight)) {
  isP = !isP;
  updateIndicator(); // Update the indicator when the button is pressed
  }
  
  if (isMouseOver(buttonX, buttonY-100, buttonWidth, buttonHeight)) {
    reset = !reset;
    setup2();
  }
}

//-----------------------------------------------------------------------------------------------------
//INTERFACE
//-----------------------------------------------------------------------------------------------------

void draw() {
  if (setup2) {
    background(255);
    tabled();
    stroke(0); 
    //RESET BUTTON
    fill(255);
    rect(buttonX, buttonY-100, buttonWidth, buttonHeight);
    fill(0);
    textSize(12);
    text("Reset Simulation", buttonX + 7, buttonY - 70); 
    // CHANGE INDICATOR
    if (isP) {
      fill(255,192,203); 
    } else {
      fill(173,216,230); 

  if(!setup2) {
  avatar(x,y);
  x+=xdir;
    if(x>1000) {
      setup2();
      newSetup=false;
      setup2=true;
    }

    }
  if (setup2) {
  background(255);
  tabled();
  // Draw button box
  stroke(0); // Black border
  if (isP) {
    fill(255,192,203);
  } else {
    fill(173,216,230);
  }
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  fill(0);
  textSize(12);
  text("Change Indicator", buttonX + 9, buttonY + 30);

  }

  if (origBeaker != null) {
  titrand.atEquivalence();
  image(origBeaker, 240, 565, width/4, height/4);
  }

  if (buret != null) {
  image(buret, 100, 100);
  }

  if (titrant != null) {
  if (keyPressed && key == ENTER) {
    startDropping = true;
  }

  if (startDropping) {
    if (dropY < 650) {
      dropY += 5;
      titrant.drip(dropY);
      titrand.isEquivalent(titrant);
    } else {
      titrand.addTitrantVolume(5);
      titrand.calcpH();
      startDropping = false;
      dropY = 595;  // Reset drop position for next time
    }
  }
  }
}
//-----------------------------------------------------------------------------------------------------
//CHANGE THE TABLE DYNAMICALLY
//-----------------------------------------------------------------------------------------------------

void tabled() {
  String[] lis = {"titrand", "titrant", "indicator", "pH", "concentration(titrand)", "volume(ml)"};
  fill(0);
  for (int i = 0; i<6; i++) {
  textSize(15);
  text(lis[i], 25+i*150, 25);
  }
  String[] lis2 = {titrand.getName(), titrant.getName(), indicator.getName(), ""+titrand.getpH(), ""+titrand.getMolarity(), ""+titrand.getVolume()};
  for (int i = 0; i<6; i++) {
  textSize(15);
  text(lis2[i], 25+i*150, 50);
  }
}
