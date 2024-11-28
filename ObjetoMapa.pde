class ObjetoMapa {

  Object object;
  float x, y;
  int largura, altura;
  color cor;

  void desenha(color cor, int largura) {
    
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

  int getLargura() {
    return largura;
  }
  int getAltura() {
    return altura;
  }
}
