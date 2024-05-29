  PImage origBeaker;
  PImage finalBeaker;
  PImage buret;
  boolean newSetup;
  
  void setup(){
    size(1000,800);
    background(255);
    newSetup=true;
  }
  
  void mouseClicked() {
    if (newSetup){
      setup2();
      newSetup=false;}
    }
  
  void setup2(){
    
    origBeaker = loadImage("original.jpg");
    buret = loadImage("buret.png");
  }
  
  void draw(){
      image(origBeaker, 240, 565, width/4, height/4);
      image(buret,100,100);
  }
