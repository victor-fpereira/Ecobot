class Mapa {

  float x, y;
  color cor;
  String tipo;
  float largura;
  
  void desenhaObjetosEstaticos(ArrayList<Mapa> listaObjetos) {

    for (int i=0; i<listaObjetos.size(); i++) {
      switch (listaObjetos.get(i).getTipoObjeto()) {
      case "lixo":
        lixo.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
        break;
      case "planta":
        Planta planta = (Planta) listaObjetos.get(i);
        if (planta.plantaSeca) {
          planta.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y, color(240, 150, 50));
        } else {
          planta.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y, color(0, 255, 50));
        }
        break;
      case "obstaculo":
        obstaculo.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
        break;
      case "estacao":
        estacaoRecarga.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
        break;
      case "inimigo":
        inimigo.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
        break;
      case "itemEspecial":
        itemEspecial.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
      }
    }
  }

  Mapa encontraObjetoMaisProximo(ArrayList<Mapa> lista) {

    float menorDistancia = Float.MAX_VALUE;
    Mapa objMapa = null;

    // Itera sobre todos os objetos lixo criados para poder achar o mais próximo do robo
    for (int i=0; i<lista.size(); i++) {
      float dist = dist(robo.getX(), robo.getY(), lista.get(i).getX(), lista.get(i).getY());
      if (dist < menorDistancia) {
        menorDistancia = dist;
        objMapa = lista.get(i);
      }
    }

    return objMapa;
  }

  void desenha(float x, float y) {
    // Push and pop style from documetation: https://processing.org/reference/pushStyle_.html
    pushStyle();  // Inicia um novo estilo
    fill(cor);
    square(x, y, largura);
    popStyle();  // Restaura o estilo anterior
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
}
