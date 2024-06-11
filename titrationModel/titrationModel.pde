PImage origBeaker, buret;
boolean newSetup, setup2, startDropping;
Titrant titrant;
Titrand titrand;
Indicator indicator;
float dropY;
Table table;
int addVolume;
int dropSpeed;
//button to change indicator
boolean isP = true;
String indicatorName = "phenolphthalein";
String acidName, baseName;
int buttonX = 700;
int buttonY = 300;
int buttonWidth = 100;
int buttonHeight = 50;
//reset button
boolean reset = false;
//for the progress bar
int x,y;
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
  y = 0;
  xdir = 1;
  ydir=1;
  
}

void avatar(int x, int y){
  rect(x,y-10,10,50);
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
  addVolume = 5;
  dropSpeed = 5;
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

void updateAcidBase() {
  if (isP) {
    acidName = "HCL";
    baseName = "NaOH";
  } else {
    acidName = "Acetic Acid";
    baseName = "Ammonia";
  }
  titrand = new Titrand(true, true, acidName, 3.0, 3, 20); // Update titrand name
  titrant = new Titrant(true, false, baseName, 11.0, 3, 20); // Update titrnat name
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
  
  if (isMouseOver(buttonX, buttonY+250, buttonWidth, buttonHeight)) {
    dropSpeed--;
  }
  if (isMouseOver(buttonX + 80, buttonY+250, buttonWidth, buttonHeight)) {
    dropSpeed++;
  }
  if (isMouseOver(buttonX, buttonY+340, buttonWidth, buttonHeight)) {
    if(addVolume > 0){
      addVolume--;
    }
    
  }
  if (isMouseOver(buttonX + 80, buttonY+340, buttonWidth, buttonHeight)) {
    addVolume++;
  }
}

//-----------------------------------------------------------------------------------------------------
//BUTTONS
//-----------------------------------------------------------------------------------------------------
void resetSimulation(){
    fill(255);
    rect(buttonX, buttonY-100, buttonWidth, buttonHeight);
    fill(0);
    textSize(12);
    text("Reset Simulation", buttonX + 7, buttonY - 70);
}

void changeIndicator(){
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

void changeSpeed(){
  fill(255);
  rect(buttonX-80, buttonY+200, buttonWidth*3, buttonHeight*4);
  rect(buttonX, buttonY+250, buttonWidth/2, buttonHeight);
  rect(buttonX+80, buttonY+250, buttonWidth/2, buttonHeight);
  fill(0);
  textSize(15);
  text("Adjust Speed", buttonX + 25, buttonY + 230); 
  textSize(30);
  text("+", buttonX + 98, buttonY + 283); 
  text("-", buttonX + 20 , buttonY + 283); 
}
void changeVolume(){
  fill(255);
  rect(buttonX, buttonY+340, buttonWidth/2, buttonHeight);
  rect(buttonX+80, buttonY+340, buttonWidth/2, buttonHeight);
  fill(0);
  textSize(15);
  text("Adjust Volume Added", buttonX , buttonY + 325); 
  textSize(30);
  text("+", buttonX + 98, buttonY + 373); 
  text("-", buttonX + 20 , buttonY + 373);

}

void changeAcidBase(){
  fill(255);
  rect(buttonX, buttonY-200, buttonWidth, buttonHeight);
  fill(0);
  textSize(12);
  text("Reset Simulation", buttonX + 7, buttonY - 70);

}

//-----------------------------------------------------------------------------------------------------
//INTERFACE
//-----------------------------------------------------------------------------------------------------
void draw() {
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
    stroke(0); 
    resetSimulation();
    changeIndicator();
    changeSpeed();
    changeVolume();
  }
  //DISPLAY IMAGE OF BURET AND BEAKER -----------------------
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
        dropY += dropSpeed;
        titrant.drip(dropY);
        titrand.isEquivalent(titrant);
      } else {
        titrand.addTitrantVolume(addVolume);
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
