Avatar av;
int x = 0;
int y = 300;

void setup () {
  size(800, 600);
  background(200);
  av = new Avatar("pantera");
  av.rotateAvatar(60);
  //av.draw();
  //av.scale(1.2);
  //av.rotateAvatar(60);
  av.draw();
  av.drawPivots();
  //av.drawPivots(width/2, height/2);
  av.drawLines();
  fill(0, 255, 0);
  ellipse(width/2, height/2, 10, 10);
  fill(255);
  ellipse(160, 60, 10, 10);
}

void draw() {
  //background(200);
  //av.draw();
  //av.draw(x, y);
  //av.drawPivots();
  //av.drawLines();
  //x++;
}
