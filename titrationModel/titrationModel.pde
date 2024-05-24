  PImage origBeaker;
  PImage finalBeaker;
  
  void setup(){
    size(1000,800);
    background(255);
    origBeaker = loadImage("original.jpg");
  }
  
  void draw(){
      image(origBeaker, 300, 400, width/2, height/2);
  }
