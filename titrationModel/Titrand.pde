class Titrand extends Solution{
  
  public Titrand(boolean isStrong, boolean isAcid, String name, float pH, float concentration){
    super(isStrong, isAcid, name, pH, concentration);
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
