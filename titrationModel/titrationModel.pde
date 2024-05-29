PImage origBeaker;
PImage buret;
boolean newSetup;
Titrant titrant;
float dropY;
boolean startDropping;
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
  origBeaker = loadImage("original.jpg");
  buret = loadImage("buret.png");
  titrant = new Titrant(true, true, "Titrant", 1.0, 1.0); // change this later
  
  table = new Table();
  table.addColumn("titrand");
  table.addColumn("titrant");
  table.addColumn("indicator");
  table.addColumn("pH");
  TableRow newRow = table.addRow();
  newRow.setString("titrand", "change");
  newRow.setString("titrant","later");
  newRow.setFloat("pH", titrant.getpH());
}

void draw(){
  //background(255);
  
  if (origBeaker != null) {
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
      } else {
        startDropping = false;
        dropY = 595;  // Reset drop position for next time
      }
    }
  }
  //titrant.calcpH();
}
