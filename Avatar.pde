final int Joints = 10;

class Avatar {
  private  PShape     puppet;
  private  float      x, y; //current relative puppet center (puppet position)
  private  float      cx, cy; //absolute puppet center
  private  float      scala = 1.0;
  private  Vector[]   pivot = new Vector[Joints];
  private  PShape[]   shape = new PShape[Joints];
  private  float      angleAvatar = 0;
  
  Avatar(String name) {
    puppet = loadShape(name + ".svg");
    this.cx = puppet.width/2.0;
    this.cy = puppet.height/2.0;
    this.x = width/2;
    this.y = height/2;
    this.initPivots();
  }
  
  private void initPivots() {
    for(int i=0; i<this.joints(); i++) {
      PShape shape = puppet.getChild("m"+i);
      this.shape[i] = shape;
      PShape pivot = puppet.getChild("pivot_m"+i);
      float px = pivot.getParams()[0];
      float py = pivot.getParams()[1];
      Vector p = new Vector(px, py);
      this.pivot[i] = p;
      //println("(" + p.x + ", " + p.y + ")");
    }
  }
  
  public int joints() {
    return Joints;
  }
  
  public void draw() {
    float x = this.x - this.cx;
    float y = this.y - this.cy;
    shape(puppet, x, y);
    //println("x=" + x + ", " + "y=" + y);
  }
  
  public void draw(float x, float y) {
    this.x = x;
    this.y = y;
    this.draw();
  }
  
  public void draw(float[] p) {
    assert(p.length == 2);
    this.x = p[0];
    this.y = p[1];
    this.draw();
  }
  
  public void scale(float size) {
    this.puppet.scale(size);
    this.puppet.width *= size;
    this.cx = this.puppet.width / 2.0;
    this.puppet.height *= size;
    this.cy = this.puppet.height / 2.0;
    Vector[] p = this.pivot;
    for(int i=0; i<this.joints(); i++) {
      p[i].scale(size);
    }
    this.scala *= size;
  }
  
  public void rotateAvatar(float angle) {
    this.puppet.translate(this.cx, this.cy);
    this.puppet.rotate(radians(angle));
    this.puppet.translate(-this.cx, -this.cy);
    this.angleAvatar = angle;
    Vector[] p = this.pivot;
    for(int i=0; i<this.joints(); i++) {
      p[i] = new Vector(this.pivot[i].x - this.cx, this.pivot[i].y - this.cy);
      //println("(" + p[i].x + ", " + p[i].y + ")");
      p[i].rotate(angle);
      p[i] = new Vector(this.pivot[i].x + this.cx, this.pivot[i].y + this.cy);
      println("(" + p[i].x + ", " + p[i].y + ")");
    }
  }
  
  public float getAngleAvatar() {
    return this.angleAvatar;
  }
  
  public void drawPivots() {
    Vector[] p = this.pivot;
    float x = this.x - this.cx;
    float y = this.y - this.cy;
    for(int i=0; i<this.joints(); i++) {
      fill(255, 230, 93);
      ellipse(x + p[i].x, y + p[i].y, 10, 10);
    }
  }
  
  //test
  public void drawLines() {
    Vector[] p = this.pivot;
    float x = this.x - this.cx;
    float y = this.y - this.cy;
    fill(255, 0, 0);
    ellipse(x + this.cx, y + this.cy, 10, 10);
    for(int i=0; i<this.joints(); i++) {
      line(x + this.cx, y + this.cy, x + p[i].x, y + p[i].y);
    }
  }
}
