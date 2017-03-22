class Estado{
  Estado pai=null;
  int N = 3; //Tamanho
  int M[][] = new int[N][N];
  int g = 0;
  
  public Estado() {
    int num = 0;
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        this.M[j][i] = ++num;
      }
    }
  }
  
  public Estado(int[][] m){
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        this.M[j][i] = m[i][j];
      }
    }
    this.g = custo();
  }
  
  public void imprime(){
    println("+++++++++++++++++");
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        print(this.M[j][i]+" ");
      }
      println();
    }
  }
  
  public int h(int x, int y){
    int num = 0;
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        ++num;
        if(num == M[y][x]){
          return (int)(abs(x-i)+abs(y-j));
        }
      }
    }
    return -1;
  }
  
  public boolean isObjective() {    //verifica se o estado é objetivo
    int c=0;
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        c+=h(i,j);
      }
    }
    if(c==0)
      return true;
    return false;
  }
  
  public int custo(){
    int c=0;
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        c+=h(i,j);
      }
    }
    return c;
  }
  
  //Retorna a posição da peça vazia
  public int[] getPecaVazia(){
    int num = 0;
    int[] a = {-1,-1};
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        if(M[i][j] == 9){
          a[0] = j;
          a[1] = i;
          return a;
        }
      }
    }
    return a;
  }
  
  //Retorna uma copia do estado atual
  public int[][] copia(){
    int[][] c = new int[N][N];
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        c[j][i] = M[i][j];
      }
    }
    return c;
  }
  
  //Espande o estado
  ArrayList<Estado> expande() { //Expansão dos estados
    ArrayList<Estado> filhos = new ArrayList<Estado>();
    //Obtem a posição do valor 9
    int[] pvazio = getPecaVazia();
    for (int k=1; k<5; k++) {
      int[][] cp = copia();
      switch(k){
        case 1:{
          if(!((pvazio[0]+1)>(N-1))){
            cp[pvazio[0]][pvazio[1]] = cp[pvazio[0]+1][pvazio[1]];
            cp[pvazio[0]+1][pvazio[1]] = 9;
            Estado temp = new Estado(cp);
            temp.g+=this.g;
            temp.pai = this;
            filhos.add(temp);
          }
          break;  
        }
        case 2:{
          if(!((pvazio[0]-1)<0)){
            cp[pvazio[0]][pvazio[1]] = cp[pvazio[0]-1][pvazio[1]];
            cp[pvazio[0]-1][pvazio[1]] = 9;
            Estado temp = new Estado(cp);
            temp.g+=this.g;
            temp.pai = this;
            filhos.add(temp);
          }
          break;  
        }
        case 3:{
          if(!((pvazio[1]+1)>(N-1))){
            cp[pvazio[0]][pvazio[1]] = cp[pvazio[0]][pvazio[1]+1];
            cp[pvazio[0]][pvazio[1]+1] = 9;
            Estado temp = new Estado(cp);
            temp.g+=this.g;
            temp.pai = this;
            filhos.add(temp);
          }
          break;  
        }
        case 4:{
          if(!((pvazio[1]-1)<0)){
            cp[pvazio[0]][pvazio[1]] = cp[pvazio[0]][pvazio[1]-1];
            cp[pvazio[0]][pvazio[1]-1] = 9;
            Estado temp = new Estado(cp);
            temp.g+=this.g;
            temp.pai = this;
            filhos.add(temp);
          }
          break;  
        }
      }
    }
    return filhos;
  }
  
}