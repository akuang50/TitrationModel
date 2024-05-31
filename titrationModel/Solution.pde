class Solution{
  
  String name;
  float pH;
  float concentration;
  
  public Solution(String name, float pH, float concentration) {
    
    this.name=name;
    this.pH=pH;
    this.concentration=concentration;
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
  

  
}
