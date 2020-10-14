class Target
{
  PVector Position;
  float Size;

  Target()
  {
    Position = new PVector(random(width), random(height));
    Size = 40;
  }


  void Render()
  {
    colorMode(RGB);
    
    fill(255,0,0);
    ellipse(Position.x, Position.y, Size, Size);
    fill(255);
    ellipse(Position.x, Position.y, Size/1.5, Size/1.5);
    fill(255,0,0);
    ellipse(Position.x, Position.y, Size/2, Size/2);
    fill(255);
    ellipse(Position.x, Position.y, Size/4, Size/4);
    fill(255,0,0);
    ellipse(Position.x, Position.y, 3, 3);
  }
  
  void Reset()
  {
    Position = new PVector(random(width), random(height));
    Size = 40;
  }
  void Reset(float _x, float _y)
  {
    Position = new PVector(_x, _y);
    Size = 40;
  }
  
 
}