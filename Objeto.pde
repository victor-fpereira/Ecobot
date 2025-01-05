// Classe base para os objetos no mapa
class Objeto {

  float x, y;
  int tipo;
  int quantidade;
  PImage imagem;
  boolean mudarImagem = false;
  boolean interagido, emColisao;

  Objeto() {
  }

  Objeto(float x, float y, PImage imagem, int tipo) {
    this.tipo = tipo;
    this.x = x;
    this.y = y;
    this.imagem = imagem;
  }

  void desenha(ArrayList<Objeto> listaObjetos) {
    for (Objeto obj : listaObjetos) {
      noFill();
      noStroke();
      rect(obj.x, obj.y, Global.lado, Global.lado);
      image(obj.imagem, obj.x, obj.y, Global.lado, Global.lado);
    }
  }

  ArrayList<Objeto> criaObjeto(int quantidade, int tipo, PImage imagem) {

    ArrayList<Objeto> listaObjetos = new ArrayList<>();

    for (int i=0; i<quantidade; i++) {
      x = random(width - Global.lado);
      y = random(Global.cabecalho, height - Global.lado);
      listaObjetos.add(new Objeto(x, y, imagem, tipo));
    }

    return listaObjetos;
  }
}
