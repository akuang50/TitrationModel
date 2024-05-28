class Titrant extends Solution{
  boolean isStrong;
  boolean isAcid;
  public Titrant(boolean isStrong, boolean isAcid, String name, float pH, float concentration){
    super( name, pH, concentration);
    this.isStrong=isStrong;
    this.isAcid=isAcid;
  }
  
  public float drip(){
    return 0.0;
  }
  
  

}
