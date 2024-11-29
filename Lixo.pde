class Lixo extends ObjetoMapa {

  int quantidade;
  float posicaoX, posicaoY;
  int largura;

  void desenha(float x, float y, color cor, int largura) {
    super.desenha(cor, largura);
    super.setPosicao(x, y);
  }
}
