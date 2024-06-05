PImage origBeaker, buret, case1;
boolean newSetup, setup2, startDropping;
Titrant titrant;
Titrand titrand;
Indicator indicator;
float dropY;
Table table;
int mode;

void setup(){
  size(1000, 800);
  background(152,190,100);
  newSetup = true;
  dropY = 595;
  startDropping = false;
  rect(375, 350, 220, 100, 28);
  
  textSize(75);
  fill(0);
  text("START", 380, 415); 
  mode = 0;
  case1 = loadImage("strongacidstrongbase.jpeg");
}

void mouseClicked() {
  if (mode==0) {mode++;}
  if (mode==1) {if(mouseX>0&&mouseX<75&&mouseY>0&&mouseY<75) {mode++;}}
  /*if (newSetup){
    setup2();
    newSetup = false;
  }*/
}

void setup2(){
  background(255);
  setup2 = true;
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
  

  //newRow.setFloat("pH", titrant.getpH());

  
  
}

void draw(){
  switch(mode) {
    case 0: 
    
      break;
    case 1:
      background(255);
      image(case1, 0, 0, width/3, height/3);
      
      break;
    case 2:
      setup2();
      break;
     
  }
  if(setup2){
    background(255);
    titrant.chooseTitrant();
    tabled();
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
        titrand.checkEquivalence(titrant);
      } else {
        titrand.addTitrantVolume(5);
        startDropping = false;
        dropY = 595;  // Reset drop position for next time
      }
    }
  }
  //titrant.calcpH();
}
void tabled() {
  String[] lis = {"titrand", "titrant", "indicator", "pH", "concentration", "volume"};
  fill(0);
  for (int i = 0; i<6; i++) {
    textSize(10);
    text(lis[i], 25+i*50, 25);
  } 
  String[] lis2 = {titrand.getName(), titrant.getName(), titrand.getName(), ""+titrand.getpH(), ""+titrand.getConcentration(), ""+titrand.getVolume()};
  for (int i = 0; i<6; i++) {
    textSize(10);
    text(lis2[i], 25+i*50, 50);
  } 
}
