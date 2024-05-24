class Titrand extends Solution{
  
  public Titrand(boolean isStrong, boolean isAcid, String name, float pH, float concentration){
    super(isStrong, isAcid, name, pH, concentration);
  }
  
  public boolean isEquivalent(){
    if((isAcid && isStrong) ) // add condiction for if the base is also strong
     if (pH == 7.0){
       return true;
     }
    return false;
  }
  
  

}
