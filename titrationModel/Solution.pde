class Solution{
  
  String name;
  float pH, volume,moles;
  boolean isStrong, isAcid;
  
  public Solution(boolean isStrong, boolean isAcid,String name, float pH, float moles, float volume) {
    this.name=name;
    this.pH=pH;
    this.moles=moles;
    this.isStrong = isStrong;
    this.isAcid = isAcid;
    this.volume = volume;
  }
  
  public String getName() {
    return name;
  }
  
  public float getMolarity() {
    return moles / volume;
  }
  
  public float getpH(){
   pH = -log(getMolarity());
   return pH;
  }
 
 public float getVolume(){
   return volume;
 }


  
}
