class Indicator extends Solution{
  public Indicator(boolean isStrong, boolean isAcid, String name, float pH, float concentration,float volume){
    super(isStrong,isAcid, name, pH, concentration,volume);
    
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public boolean equivalence(){
    return false;
  }
}
