class Titrand extends Solution{
  boolean isEquivalent;
  
  public Titrand(boolean isStrong, boolean isAcid, String name, float pH, float moles, float volume){
    super( isStrong, isAcid, name, pH, moles,volume);
  }
  
  public boolean isEquivalent(Titrant titrant) {
      if (this.isStrong && titrant.isStrong) {
        if (this.getMolarity() == titrant.getMolarity()) {
          //isEquivalent =  (this.isAcid && !titrant.isAcid) || (!this.isAcid && titrant.isAcid);
          isEquivalent = true;
          return isEquivalent;
          // checks if one is acid and one is base
      }
    }
     isEquivalent = false;
     return false;
  }
  
  void addTitrantVolume(float volume) {
    this.volume += volume;
  }
  
  void calcpH(){
    if(this.getMolarity()>0.01){
      this.pH = 14 + log(this.getMolarity());
    }
    else if(this.getMolarity() == 0.01){
      this.pH = 7;
    }
    else{
      this.pH = 7+log(this.getMolarity());
     }
       
    }
   
  
  void atEquivalence(){
    if(isEquivalent){
      if(indicator.getName().equals("phenolphthalein")){
        fill(255,182,193);
      }
      else{
        fill(173,216,230);
      }
    }
    else {
      if(this.pH <7 && indicator.getName().equals("phenolphthalein")){
        fill(231,84,128);
      }
      else if(this.pH <7 && indicator.getName().equals("bromothymol blue")){
        fill(0,0,139);
      }
      else{
      fill(255);
    }
    }
    noStroke();
    rect(315, 640, 103, 100, 12, 12, 48, 72);
  
  }
  public void setName(String name) {
    this.name = name;
  }
}
