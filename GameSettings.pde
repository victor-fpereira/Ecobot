class GameSettings {

  void mostraInstrucoesJogo() {
    pushStyle();  // Inicia um novo estilo
    fill(0);
    int tamanhoFonte = 20;
    textSize(tamanhoFonte);
    text(
      "Tecla W: move o robô para cima.\n" +
      "Tecla A: move o robô para a esquerda.\n" +
      "Tecla S: move o robô para baixo.\n" +
      "Tecla D: move o robô para a direita.", width / 2, 25);
    //  text(
    //    "Tecla W: move o robô para cima.\n" +
    //    "Tecla A: move o robô para a esquerda.\n" +
    //    "Tecla S: move o robô para baixo.\n" +
    //    "Tecla D: move o robô para a direita.", posicaoValores * 5, posicaoPlacaY);
    //}
    popStyle();  // Restaura o estilo anterior
  }
}
