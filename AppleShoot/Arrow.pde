class Arrow
{


  PVector Position;
  PVector Acceleration;
  PVector Direction;
  PVector Velocity;
  float Rotation;
  float Gravity;
  boolean isFired;
  float Power;

  Arrow()
  {
    Position = new PVector(100, 700);
    Acceleration = new PVector(0, .05);
    Direction = new PVector(0, 0);
    Velocity = new PVector(0, 0);
    Rotation =0;
    isFired = false;
    Gravity = .05;
    Power = 5;
  }


  void Update()
  {
    if (isFired == false)
    {
      PVector m = new PVector(mouseX, mouseY);
      PVector p = Position.copy();
      PVector curr = new PVector(Position.x+100, Position.y);
      PVector p1 = m.copy().sub(p);
      PVector p2 = curr.copy().sub(p);

      Rotation = -PVector.angleBetween(p1, p2);
    } 
    else
    {
      Direction.add(Acceleration);
      
      Rotation+=Gravity/Power;
      //Rotation = -PVector.angleBetween(nDir,cDir);
      Position.add(Direction);
    }
  }

  void SetDirection(float _p)
  {
    PVector m = new PVector(mouseX, mouseY);
    Power = _p;
    Direction = PVector.sub(m, Position);
    Direction.normalize();
    Direction.mult(Power);

    isFired = true;
  }


  void Render()
  {
    colorMode(RGB);
    pushMatrix();
    //translate
    translate(Position.x, Position.y);
    //rotate
    rotate(Rotation);
    //render
    fill(113, 71, 19);
    rect(0, 0, 50, 4);
    fill(120, 115, 115);
    ellipse(50, 2, 5, 5);


    popMatrix();
  }



  void Reset()
  {
    Position = new PVector(100, 700);
    Acceleration = new PVector(0, .05);
    Direction = new PVector(0, 0);
    Velocity = new PVector(0, 0);
    Rotation =0;
    isFired = false;
    Gravity = .05;
    Power = 5;
  }
  
  boolean CheckCollision(PVector _t, float _s)
  {
    boolean answer = false;
    
      pushMatrix();
        translate(Position.x, Position.y);
        //rotate(Rotation);
        //ellipse(50, 2, 5, 5);
       // fill(255,0,255);
       // ellipse(_t.x-Position.x,_t.y-Position.y,100,100);
      if(dist(50+sin(degrees(Rotation)),2+degrees(Rotation),_t.x-Position.x,_t.y-Position.y) <2.5+ _s/2)
      {
        //background(0,255,0);
        answer=true;
      }
      popMatrix();
      
    
    return answer;
    
  }
  
  void Stop()
  {
    Acceleration = new PVector(0,0);
    Direction = new PVector(0,0);
    Gravity=0;
    
    
  }
}