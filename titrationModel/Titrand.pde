class Titrand extends Solution{
  
  public Titrand(boolean isStrong, boolean isAcid, String name, float pH, float concentration){
    super(isStrong, isAcid, name, pH, concentration);
  }
  
  public boolean isEquivalent(){
     if (pH == 7.0){
       return true;
     }
    return false;
  }
  
  

}
