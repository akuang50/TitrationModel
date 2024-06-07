class Titrand extends Solution{
  boolean isEquivalent;
  
  public Titrand(boolean isStrong, boolean isAcid, String name, float pH, float moles, float volume){
    super( isStrong, isAcid, name, pH, moles,volume);
  }
  
  public boolean isEquivalent(Titrant titrant) {
      if (this.isStrong && titrant.isStrong) {
        if (this.getMolarity() == titrant.getMolarity()) {
          isEquivalent =  (this.isAcid && !titrant.isAcid) || (!this.isAcid && titrant.isAcid);
          return isEquivalent;
          // checks if one is acid and one is base
      }
    }
     return false;
  }
  
  void checkEquivalence(Titrant titrant) {
    isEquivalent(titrant);
  }
  
  void addTitrantVolume(float volume) {
    this.volume += volume;
  }
  
  void atEquivalence(){
    if(isEquivalent){
      fill(255,182,193);
    }
    else {
      fill(255);
    }
    
    
    noStroke();
    rect(315, 640, 103, 100, 12, 12, 48, 72);
  }

}
