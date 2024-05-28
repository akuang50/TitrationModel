  PImage origBeaker;
  PImage finalBeaker;
  PImage buret;
  
  void setup(){
    size(1000,800);
    background(255);
    origBeaker = loadImage("original.jpg");
    buret = loadImage("buret.png");
  }
  
  void draw(){
      image(origBeaker, 240, 565, width/4, height/4);
      image(buret,100,100);
  }
