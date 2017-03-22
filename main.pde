
void setup(){
  size(400,400);
  background(255,255,255);
}

int N=3;
int[][] a = {{2,3,9},{1,5,6},{4,7,8}};
int[][] a1 = {{5,2,8},{4,1,6},{7,3,9}};

Estado e = new Estado(a);

Estado queue_dropMenor(ArrayList<Estado> queue) {
  float menorAvaliacao = queue.get(0).g;
  int p = 0;
  for (int i=1; i<queue.size(); i++) {
    if (queue.get(i).g<menorAvaliacao) {
      menorAvaliacao = queue.get(i).g;
      p = i;
    }
  }
  Estado estado = queue.get(p);
  queue.remove(p);
  return estado;
}

boolean igual(Estado a, Estado b){
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      if(a.M[i][j]!=b.M[i][j]){
        return false;
      }
    }
  }
  return true;
}

boolean existe(ArrayList<Estado> list, Estado a){
  for(Estado e: list){
    if(igual(e,a))
      return true;
  }
  return false;
}

ArrayList<Estado> solucao = new ArrayList<Estado>();

void A(){
  ArrayList<Estado> queue = new ArrayList<Estado>();
  ArrayList<Estado> temp = new ArrayList<Estado>();
  solucao.add(e);
  queue.add(e);
  while (!queue.isEmpty()) {
    Estado estado = queue_dropMenor(queue);
    estado.imprime();
    if (estado.isObjective()) {
      while(estado.pai!=null){
        temp.add(estado);
        estado = estado.pai;
      }
      for(int i=temp.size();i>0;i--){
        solucao.add(temp.get(i-1));
      }
      print("Estado objetivo");
      return;
    }
    ArrayList<Estado> filhos = estado.expande();
    for (int i=0; i<filhos.size(); i++) {
      if(!existe(queue,filhos.get(i)))
        queue.add(filhos.get(i));
    }
  }
}

//TABULEIRO

void criar(int[][] m) {
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      Peca p = new Peca(m[j][i], j*width/N, i*height/N, width/N, height/N);
    }
  }
}

int s = 0;
int i = 0;
void draw(){
  if(s==0)  
    A();
  s=1;  
  criar(solucao.get(i).M);
  i++;
  if(i==solucao.size()) i=0;
  delay(500);
  /*
  Estado e = new Estado(a);
  println(e.custo());
  int[] aa = e.getPecaVazia();
  println(aa[0]+" "+aa[1]);
  e.imprime();
  ArrayList<Estado> filhos = new ArrayList<Estado>();
  filhos = e.expande();
  for(Estado k : filhos){
    k.imprime();
    println(k.g);
  }
  */
  //exit();
}