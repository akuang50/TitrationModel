class Titrand extends Solution{
  boolean isEquivalent;
  
  public Titrand(boolean isStrong, boolean isAcid, String name, float pH, float moles, float volume){
    super( isStrong, isAcid, name, pH, moles,volume);
  }
  
  public boolean isEquivalent(Titrant titrant) {
    //checks for when the solution is at equivalence for strong acid-base
      if (this.isStrong && titrant.isStrong) {
        if (this.pH>=6.9 && this.pH<7.5) {
          isEquivalent = true;
          return isEquivalent;
          // checks if one is acid and one is base
      }
    }
    //checks for equivalence for weak acid-base
    else if (!this.isStrong && !titrant.isStrong){
      if (this.pH>=5.5 && this.pH<6) {
         isEquivalent = true;
         return isEquivalent;}
    }
     isEquivalent = false;
     return false;
  }
  
  void addTitrantVolume(float volume) {
    this.volume += volume;
  }
  
  void calcpH(){
    if (this.isStrong && titrant.isStrong) {
      this.pH += 0.05*log(this.getMolarity());}
    else {
      this.pH += 0.01*log(this.getMolarity());
    }
    
    }
   
  
  void atEquivalence(){
    //changes color of solution
    if(isEquivalent){
      if(indicator.getName().equals("phenolphthalein")){
        fill(255,182,193);
      }
      else{
        fill(173,216,230);
      }
    }
    else {
      if (this.isStrong && titrant.isStrong) {
      if(this.pH <7 && indicator.getName().equals("phenolphthalein")){
        fill(231,84,128);
      }
      else if(this.pH <7 && indicator.getName().equals("bromothymol blue")){
        fill(0,0,139);
      }
      else{
      fill(255);
    }}
    else if (!this.isStrong && !titrant.isStrong) {
      if(this.pH <5.5 && indicator.getName().equals("phenolphthalein")){
        fill(231,84,128);
      }
      else if(this.pH <5.5 && indicator.getName().equals("bromothymol blue")){
        fill(0,0,139);
      }
      else{
      fill(255);
    }}
    }
    noStroke();
    rect(315, 640, 103, 100, 12, 12, 48, 72);
  
  }
  public void setName(String name) {
    this.name = name;
  }
}
