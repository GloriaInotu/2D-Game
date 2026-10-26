class Witch {

  // creating data member
  int lives = 3;
  // storing image of MC
  PImage mc;

  // method to display mc
  void display()
  {
    //loading the image
    mc = loadImage("MainChar.png");
    image(mc, mouseX, mouseY);
  }

  // method for collison of witch and goblin
  boolean defence(Goblins goblin)
  {
    float distance = dist(mouseX, mouseY, goblin.x, goblin.y);
    return distance<50;
  }

  // method for collison of witch and child npc
  boolean mistakeC(NPC n)
  {
    float distance = dist(mouseX, mouseY, n.x, n.y);
    return distance<100;
  }
} // end of Witch class
