Arrow a = new Arrow();
PowerBar pb = new PowerBar();
Target target;
void setup()
{
  size(1800, 800);

  target = new Target();
}


void draw()
{
  background(255);

  pb.Render();
  target.Render();

  a.Update();
  a.Render();



  if (a.CheckCollision(target.Position, target.Size))
  {
    //background(0,255,0);
    a.Stop();
  }
  if (mousePressed)
  {
    pb.Update();
  }
}


void mouseReleased()
{
  a.SetDirection(pb.Power/5);
}


void keyPressed()
{
  if (key == 'r')
  {
    a.Reset();
    target.Reset();
    pb.Reset();
  }
  if (key == 'a')
  {
    a.Reset();
    pb.Reset();
  }
  if (key =='t')
  {
    target.Reset(250, 600);
  }
}