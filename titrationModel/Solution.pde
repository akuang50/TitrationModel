class Solution{
  
  String name;
  float pH, concentration,volume;
  boolean isStrong, isAcid;
  
  public Solution(boolean isStrong, boolean isAcid,String name, float pH, float concentration, float volume) {
    
    this.name=name;
    this.pH=pH;
    this.concentration=concentration;
    this.isStrong = isStrong;
    this.isAcid = isAcid;
    this.volume = volume;
  }
  
  public String getName() {
    return name;
  }
  
  public float getConcentration() {
    return concentration;
  }
  
  public float getpH(){
   pH = -log(getConcentration());
   return pH;
  }
 
 public float getVolume(){
   return volume;
 }
  public float calcMoles(){
   return volume * concentration;
  }

  
}
