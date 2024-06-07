class Titrant extends Solution{

  public Titrant(boolean isStrong, boolean isAcid, String name, float pH, float moles,float volume){
    super( isStrong, isAcid,name, pH, moles,volume);

  }
  
  void drip(float dropY){
    
    
    fill(173,216,230);
    noStroke();
    ellipse(365, dropY, 20, 20);
    
    
  }
  
  void chooseTitrant() {
    fill(173,216,230);
    noStroke();
    rect(365,100,20,100);
  }
  
  

}
