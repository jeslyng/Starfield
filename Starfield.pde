Particle[] bob = new Particle[100];
int t = 0;
void setup()
{
  background(0);
  size(400, 400);
  noStroke();
  for (int i = 0; i<bob.length; i++)
  {
    bob[i] = new Particle();
  }
  bob[1] = new OddballParticle();
  bob[2] = new OddballParticle();
  frameRate(30);
  smooth();
}
void draw()
{
  background(0);
  translate(200, 200);
  for (int i = 0; i<bob.length; i++)
  {
    bob[i].move();
    bob[i].show();
  }
  t++;
  if (t>100)
    t = 0;
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle()
  {
    myX=myY=0;
    myAngle = (double)(Math.random()*6.28);
    myColor = color((int)(Math.random()*100)+156, (int)(Math.random()*100)+156, 256);
    mySpeed = (double)(Math.random()*10);
  }
  void move()
  {
    if (t>100) {
      myX = myX + (double)(mySpeed*Math.cos(myAngle));
      myY = myY + (double)(mySpeed*Math.sin(myAngle));
    } else {
      myX = myX - (double)(mySpeed*Math.cos(myAngle));
      myY = myY - (double)(mySpeed*Math.sin(myAngle));
    }
    myAngle = myAngle + Math.random()*0.1;
  }
  void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }
}
class OddballParticle extends Particle
{
  OddballParticle()
  {
    myX=myY=0;
    myAngle = (double)(Math.random()*6.28);
    myColor = color(256, (int)(Math.random()*100)+156, (int)(Math.random()*100)+156);
    mySpeed = (double)(50);
  }
  void move()
  {
    myX = (double)(mySpeed*Math.cos(myAngle));
    myY = (double)(mySpeed*Math.sin(myAngle));
    myAngle = myAngle + Math.random()*0.5;
    myColor = color(256, (int)(Math.random()*100)+156, (int)(Math.random()*100)+156);
  }
  void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, 20, 20);
  }
}
void mouseClicked()
{
  for (int i = 0; i<bob.length; i++)
  {
    bob[i].myX = 0;
    bob[i].myY = 0;
  }
}
