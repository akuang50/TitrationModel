class Titrant extends Solution{
  boolean isStrong;
  boolean isAcid;
  public Titrant(boolean isStrong, boolean isAcid, String name, float pH, float concentration){
    super( name, pH, concentration);
    this.isStrong=isStrong;
    this.isAcid=isAcid;
  }
  
  void drip(float dropY){
    fill(173,216,230);
    noStroke();
    ellipse(365, dropY, 20, 20);
  }
  
  

}
