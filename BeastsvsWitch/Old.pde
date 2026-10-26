// sub class
class Old extends NPC
{
  // storing images of goblins
  PImage Oldwalk1, Oldwalk2;
  // counter for animation of images
  int imageCounter = 0;


  // setting up the constructor
  Old(float x, float y, int xSpeed, int ySpeed)
  {
    // call superclass and passes parameters
    super(x, y, xSpeed, ySpeed);
    //loading the images
    Oldwalk1 = loadImage("oldWalk1.png");
    Oldwalk2 = loadImage("oldWalk2.png");
  }

  // method for displaying the NPCs
  void display()
  {
    imageMode(CENTER);
    if (imageCounter>=0 && imageCounter<5)
      image(Oldwalk1, x, y);
    else if (imageCounter>=5 && imageCounter<10)
      image(Oldwalk2, x, y);

    imageCounter = imageCounter+1;
    if (imageCounter>=10)
      imageCounter=0;
  }

  // method for moving NPCs
  void move()
  {
    x = x + xSpeed;  //move NPCs to right or left
    y = y + ySpeed;  //move NPCs up and down

    // setting boundaries for their movements
    if (x>width || x<0)
    {
      xSpeed=xSpeed*-1;
    }
    if (y> height || y<0)
    {
      ySpeed=ySpeed*-1;
    }
  }
} // end of Old class
