class Vector {
  public float x;
  public float y;
  
  Vector() {
  }
  
  Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public float mag(Vector v) {
    return sqrt(v.x * v.x + v.y * v.y);
  }
  
  public float dist(Vector v1, Vector v2) {
    float dx = v1.x - v2.x;
    float dy = v1.y - v2.y;
    return sqrt(dx * dx + dy * dy);
  }
  
  public void rotate(float angle) {
    //println("(" + this.x + ", " + this.y + ")");
    float x = this.x * cos(radians(angle)) - this.y * sin(radians(angle));
    float y = this.x * sin(radians(angle)) + this.y * cos(radians(angle));
    this.x = x;
    this.y = y;
    //println("(" + this.x + ", " + this.y + ")");
  }
  
  public void scale(float size) {
    //println("(" + this.x + ", " + this.y + ")");
    this.x *= size;
    this.y *= size;
    //println("(" + this.x + ", " + this.y + ")");
  }
}
