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
      "Tecla D: move o robô para a direita.", (width / 10) * 3, 25); // Divide a tela em 10 partes iguais e inicia da 3 parte.
      text(
        "Inimigo: objeto vermelho.\n" +
       "Item especial: objeto amarelo.\n" +
        "Obstaculo: objeto azul.\n" +
        "Planta: objeto verde.\n" +
        "Planta seca: objeto marrom.\n" +
        "Lixo: objeto cinza.", (width / 10) * 6, 25);
    
    popStyle();  // Restaura o estilo anterior
  }
}
