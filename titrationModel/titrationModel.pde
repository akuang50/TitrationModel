PImage origBeaker, buret, case1;
boolean newSetup, setup2, startDropping;
Titrant titrant;
Titrand titrand;
Indicator indicator;
float dropY;
Table table;
<<<<<<< HEAD
int mode;
=======
boolean isP = true;
String indicatorName = "phenolphthalein";
int buttonX = 700;
int buttonY = 300;
int buttonWidth = 100;
int buttonHeight = 50;
>>>>>>> 6cf68cdb089bb908ffa3a345bc6af1077d920a56

void setup() {
  size(1000, 800);
  background(152, 190, 100);
  newSetup = true;
  dropY = 595;
  startDropping = false;
  textSize(75);
  fill(0);
<<<<<<< HEAD
  text("START", 380, 415); 
  mode = 0;
  case1 = loadImage("strongacidstrongbase.jpeg");
}

void mouseClicked() {
  if (mode==0) {mode++;}
  if (mode==1) {if(mouseX>0&&mouseX<75&&mouseY>0&&mouseY<75) {mode++;
setup2();}}
  print(mode);
  /*if (newSetup){
=======
  text("START", 383, 422);
}

void mouseClicked() {
  if (newSetup) {
>>>>>>> 6cf68cdb089bb908ffa3a345bc6af1077d920a56
    setup2();
    newSetup = false;
  }*/
}

void setup2() {
  background(255);
  setup2 = true;
<<<<<<< HEAD
  titrant = new Titrant(true, true, "Titrant", 1.0, 1.0,100.0); // change this later
  titrand = new Titrand(true, false, "Titrand", 10.0, 1.0,0);
  indicator = new Indicator(true, false, "Indicator", 0,0,0);
  origBeaker = loadImage("original.png");
  buret = loadImage("buret.png");
  
  
  table = new Table();
  table.addColumn("titrand");
  table.addColumn("titrant");
  table.addColumn("indicator");
  table.addColumn("pH");
  TableRow newRow = table.addRow();
  newRow.setString("titrand", "change");
  newRow.setString("titrant","later");
  newRow.setString("indicator", "yeah");
  newRow.setFloat("pH", 7.0);
  saveTable(table, "table.csv");
  
=======
  titrant = new Titrant(true, true, "HCl", 1.0, 1.0, 100.0); // change this later
  titrand = new Titrand(true, false, "NaOH", 12.0, 1.0, 0);
  indicator = new Indicator(true, false, indicatorName, 8.2, 1, 1);
  origBeaker = loadImage("original.png");
  buret = loadImage("buret.png");
}
//-----------------------------------------------------------------------------------------------------
//CHANGE THE INDICATOR
//-----------------------------------------------------------------------------------------------------
>>>>>>> 6cf68cdb089bb908ffa3a345bc6af1077d920a56

void updateIndicator() {
  if (isP) {
    indicatorName = "phenolphthalein";
  } else {
    indicatorName = "bromothymol blue";
  }
  indicator.setName(indicatorName); // Update indicator name
}

<<<<<<< HEAD
void draw(){
  if (mode==2) {
    if (setup2) {
    background(255);
    titrant.chooseTitrant();
    tabled();}
    if (origBeaker != null) {
      titrand.atEquivalence();
      image(origBeaker, 240, 565, width/4, height/4);
    }
  
      if (buret != null) {
        image(buret, 100, 100);
=======
boolean isMouseOver(int x, int y, int w, int h) {
  return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
}

void mousePressed() {
  if (isMouseOver(buttonX, buttonY, buttonWidth, buttonHeight)) {
    isP = !isP;
    updateIndicator(); // Update the indicator when the button is pressed
  }
}

//-----------------------------------------------------------------------------------------------------
//INTERFACE
//-----------------------------------------------------------------------------------------------------

void draw() {
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
>>>>>>> 6cf68cdb089bb908ffa3a345bc6af1077d920a56
      }
  
      if (titrant != null) {
        if (keyPressed && key == ENTER) {
          startDropping = true;
        }
        if (startDropping) {
          if (dropY < 650) {
            dropY += 5;
            titrant.drip(dropY); 
            titrand.checkEquivalence(titrant);
          } else {
            titrand.addTitrantVolume(5);
            startDropping = false;
            dropY = 595;  // Reset drop position for next time
          }
        }
      }
}
  switch(mode) {
    case 0: 
    
      break;
    case 1:
      background(255);
      image(case1, 0, 0, width/3, height/3);
      
      break;
    case 2:
      
      break;
  }
<<<<<<< HEAD
  
  //titrant.calcpH();
=======
>>>>>>> 6cf68cdb089bb908ffa3a345bc6af1077d920a56
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
<<<<<<< HEAD
  String[] lis2 = {titrand.getName(), titrant.getName(), indicator.getName(), ""+titrand.getpH(), ""+titrand.getConcentration(), ""+titrand.getVolume()};
=======
  String[] lis2 = {titrand.getName(), titrant.getName(), indicator.getName(), ""+titrand.getpH(), ""+titrand.getMolarity(), ""+titrand.getVolume()};
>>>>>>> 6cf68cdb089bb908ffa3a345bc6af1077d920a56
  for (int i = 0; i<6; i++) {
    textSize(15);
    text(lis2[i], 25+i*150, 50);
  } 
}
