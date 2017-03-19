int N = 3;
Peca mp[][]= new Peca[3][3];

void criar(){
  int k = 1;
  for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
      Peca p = new Peca(k++,j*width/N,i*height/N,width/N,height/N);
      mp[i][j]=p;
      //if(k==9) j=N;
    }
  }
}

void update(){
  for(int ii=0; ii<N; ii++){
    for(int jj=0; jj<N; jj++){
      if(mp[ii][jj].num!=9)
        mp[ii][jj].drawPeca();
    }
  }
}

void setup(){
  size(400,400);
  background(255,255,255);
  criar();
}

int[][] m = {{1,1,1},{1,1,1},{1,1,0}};
int i,j,c=0;

void draw(){
   background(255,255,255);
  if(mousePressed){
     //println("*"+mp[0][1].x1);
     mp[j][i].x1=mouseX-(width/N)*0.5;
     mp[j][i].y1=mouseY-(height/N)*0.5;
     if((i!=mouseX/(width/N) || j!=mouseY/(height/N)) && c==0){
        Peca temp = mp[mouseY/(height/N)][mouseX/(width/N)];
        mp[mouseY/(height/N)][mouseX/(width/N)] = mp[j][i];
        mp[j][i]=temp;
        c=1;
     }
  }
  else{
    c=0;
    println(""+i+"-"+j);
    i=mouseX/(width/N);
    j=mouseY/(height/N);  }
  
  update();
    
}