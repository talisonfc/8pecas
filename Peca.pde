class Peca {
  int num = 0;
  float x1, y1, x2, y2; 

  public Peca(int n, float x1, float y1, float x2, float y2) {
    this.num = n;
    this.x1=x1;
    this.y1=y1;
    this.x2=x2;
    this.y2=y2;

    drawPeca();
  }

  void drawPeca() {
    if(this.num==9){
      stroke(0,0,0);
      fill(240, 240, 240);
      rect(x1, y1, x2, y2);
    }
    else{
      stroke(0,0,0);
      fill(255,255,255);
      rect(x1, y1, x2, y2);

      textSize(52);
      stroke(0, 0, 0);
      fill(72, 158, 255);
      text(num, x1+48, y1+86);
    }
  }

  void setX1(float x1) {
    this.x1 = x1;
  }

  void setY1(float y1) {
    this.y1 = y1;
  }
}