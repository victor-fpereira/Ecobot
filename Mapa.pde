class Mapa {

  float x, y;
  color cor;
  String tipo;
  float largura;

  Mapa encontraObjetoMaisProximo(ArrayList<Mapa> lista) {

    float menorDistancia = Float.MAX_VALUE;

    // Itera sobre todos os objetos lixo criados para poder achar o mais próximo do robo
    for (int i=0; i<lista.size(); i++) {
      float dist = dist(robo.getX(), robo.getY(), lista.get(i).getX(), lista.get(i).getY());
      if (dist < menorDistancia) {
        menorDistancia = dist;
        objetoMaisProximo = lista.get(i);
      }
    }

    return objetoMaisProximo;
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
