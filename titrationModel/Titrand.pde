class Titrand extends Solution{
  boolean isStrong;
  boolean isAcid;
  public Titrand(boolean isStrong, boolean isAcid, String name, float pH, float concentration){
    super( name, pH, concentration);
    this.isStrong=isStrong;
    this.isAcid=isAcid;
  }
  
  public boolean isEquivalent(Titrant titrant) {
    if (this.concentration == titrant.concentration) {
      if (this.isStrong && titrant.isStrong) {
          return (this.isAcid && !titrant.isAcid) || (!this.isAcid && titrant.isAcid);
          // checks if one is acid and one is base
      }
    }
     return false;
  }
  
  

}
