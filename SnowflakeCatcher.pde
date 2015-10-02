Snowflake [] flakes;
void setup()
{
  size(800, 600); //Resolution
  background(0);
  flakes = new Snowflake[100];  //Num. of snowflakes
  for (int i = 0; i < flakes.length; ++i) {
    flakes[i] = new Snowflake((int)(Math.random()*width), (int)(Math.random()*height), 5);
  }
}

void draw()
{
  for (int i = 0; i < flakes.length; ++i) {
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
}
void mouseDragged()
{
  noStroke();
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 20, 20);
}

class Snowflake
{
  int flakeX, flakeY, flakeSize;
  boolean moving;
  Snowflake(int x, int y, int size)
  {
    flakeX = x;
    flakeY = y;
    flakeSize = size;
    moving = true;
  }
  void show()
  {
    fill(255);
    noStroke();
    ellipse(flakeX, flakeY, flakeSize, flakeSize);
  }
  void lookDown()
  {
    if (get(flakeX, flakeY+5) == color(255, 0, 0)) {
     moving = false;
    }
  }
  void erase()
  {
      fill(0);
      ellipse(flakeX, flakeY, 7, 7);
  }
  void move()
  {
    if (moving == true) {
      flakeY++;
    }
  }
  void wrap()
  {
    if(flakeY >= height){
      flakeX = (int)(Math.random()*width);
      flakeY = 0;
    }
  }
}


