PImage origBeaker;
PImage buret;
boolean newSetup;
Titrant titrant;
Titrand titrand;
float dropY;
boolean startDropping;

void setup(){
  size(1000, 800);
  background(255);
  newSetup = true;
  dropY = 595;
  startDropping = false;
}

void mouseClicked() {
  if (newSetup){
    setup2();
    newSetup = false;
  }
}

void setup2(){
  background(255);
  titrant = new Titrant(true, true, "Titrant", 1.0, 1.0); // change this later
  titrand = new Titrand(true, false, "Titrand", 10.0, 1.0);
  origBeaker = loadImage("original.png");
  buret = loadImage("buret.png");
  
}

void draw(){
  background(255);
  
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
      } else {
        startDropping = false;
        dropY = 595;  // Reset drop position for next time
      }
    }
  }
}
