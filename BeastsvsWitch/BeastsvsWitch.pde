//   The game works by the MC (witch) defending the goal (tree) from the enemies (goblins) while avoiding attacking the NPCs (old and child) //

PImage background;
String record;
String end;
boolean gameOver = false;

String [] lines;
int [] highscore;
int score;
// declaration of arraylists
ArrayList<Goblins>goblin = new ArrayList <Goblins>();
ArrayList<NPC>npcs = new ArrayList <NPC>();
// declaration of classes
Tree tree;
Witch witch;

void setup()
{
  // setting up the background
  size(800, 800);
  background = loadImage("grass.jpg");
  background.resize(width, height);

  // allocating memory for classes
  tree = new Tree();
  witch = new Witch();

  // allocating memory and creating objects to the goblin arraylist
  for (int i=0; i<5; i++)
  {
    float posx = random(-5, width);
    float posy = random(-5, height);
    goblin.add(new Goblins(posx, posy, 4, 4));
  }

  // creating objects to the npc arraylist using polymorphism
  npcs.add(new Child(20, 20, 5, 5));
  npcs.add(new Old(40, 40, 2, 2));

  // load contents of file into string array
  lines = loadStrings("highscore.txt");
  // if file is empty, initiliase with an empty array
  if (lines == null)
    lines = new String[0];
}

// function to insert a new score into the array
int [] insert(int toInsert, int [] array) {
  int [] newNumbers = new int[array.length+1];
  int position=0;
  // flag to check if the new score has been inserted yet
  boolean inserted=false;
  for (int i=0; i<array.length; i++) {
    if (!inserted && toInsert <= array[position]) {
      newNumbers[i] = toInsert;
      inserted=true;
    } else {
      // copy current elemt from old array
      newNumbers[i] = array[position];
      position++;
    }

    if (!inserted)
      newNumbers[newNumbers.length-1] = toInsert;
  }
  return newNumbers;
}

// procedure for logic of old and child
void updateNPCs()
{
  // ask each element to move and display
  for (NPC n : npcs)
  {
    n.move();
    n.display();
  }
}

// procedure for logic of goblins
void updateEnemies()
{
  for (int i=0; i<goblin.size(); i++)
  {
    if (goblin.get(i)!=null)
    {
      goblin.get(i).display();
      goblin.get(i).move();
      tree.underAttack(goblin.get(i));
    }
  }
}
// procedure for gameover screen - [highscore (how many goblins killed) ]
void displayGameOver()
{
  gameOver = true;
  noLoop();  //draw() loop is stopped, effectivly halting the game
  background(0);
  // setting up text
  end = "GAME OVER! YOUR HIGHSCORE IS " + score;

  // loading text
  textSize(20);
  fill(255);
  text(end, width/2-160, height/2);
}
void saveHighscore()
{
  // save highscore logic
  highscore = new int[lines.length];
  highscore = insert(score, highscore);
  for (int i = 0; i < highscore.length; i++) {
    println("high score " + highscore[i]);
  }
  // convert the interger highscore array back into a string array
  lines = new String[highscore.length];
  for (int i = 0; i < highscore.length; i++) {
    lines[i] = String.valueOf(highscore[i]);
  }
  // overwrite file with the updated list of the score
  saveStrings("highscore.txt", lines);
}

void gameover()
{
  if (witch.lives == 0 ||tree.lives == 0)
  {
    saveHighscore();
    displayGameOver();
  }
}
void draw()
{
  // setting up text
  record = "Witch lives: " +witch.lives+ "  || Tree lives: " +tree.lives;

  // loading the background
  imageMode(CORNER);
  image(background, 0, 0);

  // loading text
  textSize(18);
  fill(255);
  text(record, width/2-100, 20);

  if (!gameOver)
  {
    // displaying aspects of the game
    tree.display();
    witch.display();
    updateNPCs();
    updateEnemies();

    gameover();
  } else {
    textSize(20);
    fill(255);
    text(end, width/2-70, height/2);
  }
}


void mouseClicked()
{
  // when mouse is clicked near npcs
  for (int i=0; i<npcs.size(); i++) {
    if (witch.mistakeC(npcs.get(i)))
    {
      // flash
      fill(247, 247, 67);
      ellipse(mouseX, mouseY, 90, 90);
      // mc loses lives
      witch.lives = witch.lives - 1;
    }
  }


  // when mouse is clicked near enemies
  for (int i=0; i<goblin.size(); i++)
  {
    if (goblin.get(i)!=null && witch.defence(goblin.get(i)) )
    {
      // flash
      fill(247, 247, 67);
      ellipse(mouseX, mouseY, 90, 90);
      // pressed goblin disappears
      goblin.remove(i);
      // a new goblin will appear
      float x = random(0, width);
      goblin.add(new Goblins(x, 0, 4, 4));
      // highscore increases
      score = score + 1;
    }
  }
}
