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
  
  public float getpH(){
    return pH;
  }
  
  public float getConcentration() {
    return concentration;
  }
  
  public float calcpH(){
    return 0.0;}
  
}
