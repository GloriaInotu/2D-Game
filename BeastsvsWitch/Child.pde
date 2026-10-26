// subclass
class Child extends NPC
{
  // storing images of goblins
  PImage Childwalk1, Childwalk2;
  // counter for animation of images
  int imageCounter = 0;


  // setting up the constructor
  Child(float x, float y, int xSpeed, int ySpeed)
  {
    super(x, y, xSpeed, ySpeed);
    //loading the images
    Childwalk1 = loadImage("childWalk1.png");
    Childwalk2 = loadImage("childWalk2.png");
  }

  // method for displaying the NPCs
  void display()
  {
    imageMode(CENTER);
    if (imageCounter>=0 && imageCounter<5)
      image(Childwalk1, x+60, y+60);
    else if (imageCounter>=5 && imageCounter<10)
      image(Childwalk2, x+60, y+60);

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
    if (x>width || x<5)
    {
      xSpeed=xSpeed*-1;
    }
    if (y> height || y<5)
    {
      ySpeed=ySpeed*-1;
    }
  }
} // end of Child class
