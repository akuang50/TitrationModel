class Indicator extends Solution{
  public Indicator(boolean isStrong, boolean isAcid, String name, float pH, float concentration){
    super( name, pH, concentration);
    
  }
  
  public boolean equivalence(){
    return false;
  }
}
