PImage origBeaker, buret;
boolean newSetup, setup2, startDropping;
Titrant titrant;
Titrand titrand;
float dropY;
Table table;

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
}

void mouseClicked() {
  if (newSetup){
    setup2();
    newSetup = false;
  }
}

void setup2(){
  background(255);
  setup2 = true;
  titrant = new Titrant(true, true, "Titrant", 1.0, 1.0,100.0); // change this later
  titrand = new Titrand(true, false, "Titrand", 10.0, 1.0,0);
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
  String[] lis = {"titrand", "titrant", "indicator", "pH", "concentration", "volume(ml)"};
  fill(0);
  for (int i = 0; i<6; i++) {
    textSize(10);
    text(lis[i], 25+i*100, 25);
  } 
  String[] lis2 = {titrand.getName(), titrant.getName(), titrand.getName(), ""+titrand.getpH(), ""+titrand.getConcentration(), ""+titrand.getVolume()};
  for (int i = 0; i<6; i++) {
    textSize(10);
    text(lis2[i], 25+i*100, 50);
  } 
}
