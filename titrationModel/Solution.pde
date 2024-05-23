class Solution{
  boolean isStrong;
  boolean isAcid;
  String name;
  float pH;
  float concentration;
  
  public Solution(boolean isStrong, boolean isAcid, String name, float pH, float concentration) {
    this.isStrong = isStrong;
    this.isAcid = isAcid;
    this.name=name;
    this.pH=pH;
    this.concentration=concentration;
  }
  
  public String getName() {
    return name;
  }
  
  public float getpH(){
    return pH;
  }
  
  public float getConcentration() {
    return concentration;
  }
}
