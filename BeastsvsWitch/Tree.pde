class Tree
{
  // creating the data members
  float x = width/2;
  float y = height/2;
  int lives = 200;
  // storing image of tree
  PImage goal, goalMet;

  // method for displaying tree
  void display()
  {
    goal = loadImage("Alivetree.png");
    image(goal, x, y);
  }

  // method for what happens when tree is attacked
  void underAttack(Goblins gob)
  {
    // during attack, it will shake and live decreases
    if (gob.underAttack() && lives > 0)
    {
      lives = lives - 1;
      tree.x = random(this.x-1, this.x+1);
    }
  }
} //end of tree class
