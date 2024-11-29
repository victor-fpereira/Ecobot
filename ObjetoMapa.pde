class ObjetoMapa {

  float x, y;
  float largura, altura;
  color cor;

  void desenha(color cor, float altura, float largura, byte formato) {

    // Push and pop style from documetation: https://processing.org/reference/pushStyle_.html
    pushStyle();  // Inicia um novo estilo
    fill(cor);

    switch (formato) {
    case Global.quadrado:
      square(x, y, largura);
      break;
    case Global.circulo:
      circle(x, y, largura);
      break;
    default:
      square(x, y, largura);
    }

    popStyle();  // Restaura o estilo anterior
    this.largura = largura; // Armazena a largura do objeto para uso futuro
  }

  void desenha(color cor, float largura) {
    // Push and pop style from documetation: https://processing.org/reference/pushStyle_.html
    pushStyle();  // Inicia um novo estilo
    fill(cor);
    square(x, y, largura);
    popStyle();  // Restaura o estilo anterior
    this.largura = largura; // Armazena a largura do objeto para uso futuro
  }

  void setPosicao(float x, float y) {
    this.x = x;
    this.y = y;
  }

  float getLargura() {
    return largura;
  }

  float getAltura() {
    return altura;
  }
}
