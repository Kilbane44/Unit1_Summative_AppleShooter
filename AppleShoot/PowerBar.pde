class PowerBar
{
  float Power;
  float Dir;
  PVector Position;
  PowerBar()
  {
    Power = 0;
    Dir = 2;
    Position = new PVector(5,680);
  }
  
  void Render()
  {
    
    colorMode(HSB);
    fill(0,0,255);
    rect(Position.x,Position.y,20,100);
    
    
    fill(120-Power,255,255);
    rect(Position.x,Position.y+100,20,-Power);
    
    
    fill(0,255,255);
    
    text("POWER",Position.x, Position.y-30);
  }
  
  void Update()
  {
    Power+=Dir;
    
    if(Power>100 || Power <0)
    {
      Dir *=-1;
    }
  }
  
  void Reset()
  {
    Power=0;
  }
}