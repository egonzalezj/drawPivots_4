Avatar av;
int x = 0;
int y = 300;

void setup () {
  size(800, 600);
  background(200);
  av = new Avatar("pantera");
  //av.rotateAvatar(60);
  av.scale(1.2);
  av.draw();
  av.drawPivots();
  av.drawLines();
}

void draw() {
  //background(200);
  //av.draw();
  //av.draw(x, y);
  //av.drawPivots();
  //av.drawLines();
  //x++;
}
