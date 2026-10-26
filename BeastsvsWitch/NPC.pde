// parent class
abstract class NPC
{
  // creating the data members
  float x, y;
  int xSpeed;
  int ySpeed;

  // setting up the constructor
  NPC(float x, float y, int xSpeed, int ySpeed)
  {
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
  }
  // method for moving NPCs
  abstract void move();
  abstract void display();
} //end of class NPC
