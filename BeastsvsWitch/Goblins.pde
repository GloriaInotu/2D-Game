// subclass
class Goblins extends NPC
{
  // creating the data members
  int centerX = width/2;
  int centerY = height/2;
  // storing images of goblins
  PImage walk1, walk2, attack1, attack2, attack3, attack4;
  // counter for animation of images
  int imageCounter = 0;
  // to start new animation
  boolean Attack;

  // setting up the constructor
  Goblins(float x, float y, int xSpeed, int ySpeed)
  {
    super(x, y, xSpeed, ySpeed);

    //loading the images
    walk1 = loadImage("goblinWalk1.png");
    walk2 = loadImage("goblinWalk2.png");
    attack1 = loadImage("goblinAttack1.png");
    attack2 = loadImage("goblinAttack2.png");
    attack3 = loadImage("goblinAttack3.png");
    attack4 = loadImage("goblinAttack4.png");
  }

  // method for collison of goblin and tree
  boolean underAttack()
  {
    float distance = dist(x, y, centerX, centerY);
    return distance<80;
  }

  // method to update state of Attack
  void update()
  {
    underAttack();
    if (underAttack())
    {
      if (!Attack)
        Attack = true;
    } else
    {
      if (Attack)
        Attack = false;
    }
  }

  // method for displaying the goblins
  void display()
  {
    update();
    if (Attack == true)
    {  // using the image counter for smooth animation of goblin attacking tree
      imageMode(CENTER);
      if (imageCounter>=0 && imageCounter<5)
        image(attack1, x, y);
      else if (imageCounter>=5 && imageCounter<10)
        image(attack2, x, y);
      else if (imageCounter>=10 && imageCounter<15)
        image(attack3, x, y);
      else if (imageCounter>=15 && imageCounter<20)
        image(attack4, x, y);
      imageCounter = imageCounter+1;
      if (imageCounter>=20)
        imageCounter=0;
    } else
    {
      // using the image counter for smooth animation of goblin while walking to goal
      if (imageCounter>=0 && imageCounter<5)
        image(walk1, x, y);
      else if (imageCounter>=5 && imageCounter<10)
        image(walk2, x, y);
      imageCounter = imageCounter + 1;
      if (imageCounter>=10)
        imageCounter=0;
    }
  }

  // method for moving the goblins to the goal (tree)
  void move()
  {
    if (x < centerX-30)
    {
      x = x+xSpeed;
    }
    if (x > centerX)
    {
      x = x-xSpeed;
    }

    if (y < centerY)
    {
      y = y+ySpeed;
    }
    if (y > centerY)
    {
      y = y-ySpeed;
    }
  }
} // end of class Goblins
