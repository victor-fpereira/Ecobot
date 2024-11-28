class Placar {

  int pontuacao;

  void aumentaPontuacao(int pontos) {
    pontuacao += pontos;
  }

  void diminuiPontuacao(int pontos) {
    pontuacao -= pontos;
  }

  int mostraPontuacao() {
    pushStyle();  // Inicia um novo estilo
    fill(0);
    int tamanhoFonte = 20;
    int posicaoPlacaX = 25;
    int posicaoPlacaY = 25;
    int posicaoValores = posicaoPlacaX + 140;
    textSize(tamanhoFonte);
    text("Nível da bateria:", posicaoPlacaX, posicaoPlacaY);
    text(Global.nivelBateria, posicaoValores, posicaoPlacaY);
    text("Pontuação:", posicaoPlacaX, posicaoPlacaY * 2 );
    text(Global.pontuacao, posicaoValores, posicaoPlacaY * 2 );
    text("Velocidade:", posicaoPlacaX, posicaoPlacaY * 3);
    text(Global.velocidadeRobo, posicaoValores, posicaoPlacaY * 3 );
    text("Lixo restante:", posicaoPlacaX, posicaoPlacaY * 4);
    text(Global.lixoRestante, posicaoValores, posicaoPlacaY * 4);
    text("Plantas secas:", posicaoPlacaX, posicaoPlacaY * 5);
    text(Global.plantasSecas, posicaoValores, posicaoPlacaY * 5);
    popStyle();  // Restaura o estilo anterior
    return pontuacao;
  }
}
