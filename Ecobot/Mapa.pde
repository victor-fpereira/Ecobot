class Mapa {

  float x, y;
  color cor;
  String tipo;
  float largura;
  PImage imagem;

  Mapa encontraObjetoMaisProximo(ArrayList<Mapa> lista) {

    float menorDistancia = Float.MAX_VALUE;
    Mapa objMapa = null;

    // Itera sobre todos os objetos lixo criados para poder achar o mais próximo do robo
    for (int i=0; i < lista.size(); i++) {
      float dist = dist(robo.getX(), robo.getY(), lista.get(i).getX(), lista.get(i).getY());
      if (dist < menorDistancia) {
        menorDistancia = dist;
        objMapa = lista.get(i);
      }
    }
    
    
    println(menorDistancia);
    
    // Só retorna o objeto se a distância for 30 ou menor
    if (menorDistancia <= 30) {
        return objMapa;
    } else {
        return null; // Caso nenhum objeto esteja "tocando" o robô, retorna null
    }
  }

  void desenha(ArrayList<Mapa> listaObjetos) {
    for (int i=0; i<listaObjetos.size(); i++) {
      float x = listaObjetos.get(i).x;
      float y = listaObjetos.get(i).y;
      pushStyle();
      fill(255, 0, 0, 0); // Alterar a transparencia para 0 faz os quadrados ficarem invisiveis
      square(x, y, Global.tamanhoIcone);
      popStyle();
      image(listaObjetos.get(i).imagem, x, y, Global.tamanhoIcone, Global.tamanhoIcone);
    }
  }

  void desenha(float x, float y, PImage imagem) {
    square(x, y, largura);
    image(imagem, x, y, Global.tamanhoIcone, Global.tamanhoIcone);
  }


  void setPosicao(float x, float y) {
    this.x = x;
    this.y = y;
  }

  float getLargura() {
    return largura;
  }

  void setLargura(float largura) {
    this.largura = largura;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setTipoObjeto(String tipo) {
    this.tipo = tipo;
  }

  String getTipoObjeto() {
    return tipo;
  }

  void setImagem(String imgPath) {
    PImage img = loadImage(imgPath);
    image(img, x, y, Global.tamanhoIcone, Global.tamanhoIcone);
  }
}
