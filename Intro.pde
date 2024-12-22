class Intro {

  PFont fontTitulo, fontTexto;

  void mostrarIntroducao() {

    pushStyle();

    background(17, 100, 23);

    // Exibe o logo em uma posição desejada
    // Centraliza o logo na tela
    float logoX = (width - logo.width) / 2;
    float logoY = (height - logo.height) / 5;

    // SOURCE: https://fontmeme.com/fontes/fonte-games/
    image(logo, logoX, logoY);

    // Título e texto dentro do retângulo
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text(
      "Instruções do jogo:\n\n" +
      "Seta para cima: move o robô para cima.\n" +
      "Seta para a esquerda: move o robô para a esquerda.\n" +
      "Seta para baixo: move o robô para baixo.\n" +
      "Seta para a direita: move o robô para a direita.\n\n" +
      "Objetivo: Regar todas as plantas e coletar todo o lixo antes da bateria acabar.\n" +
      "Existem estações de recarga, inimigos, obstáculos e items especiais.",
      width / 2, height / 1.6
      );


    textAlign(CENTER);
    textSize(25);
    fill(255);
    text("Pressione ESPAÇO para começar!", width / 2, height - 50);

    popStyle();
  }

  void mostraInstrucoes() {

    pushStyle();

    background(10, 148, 196);

    // Camada transparente
    //fill(0, 0, 0, 150); // Preto com transparência
    //rect(50, 100, width - 100, height - 200);

    textAlign(LEFT);
    textSize(18);
    text(
      "Seta para cima: move o robô para cima.\n" +
      "Seta para a esquerda: move o robô para a esquerda.\n" +
      "Seta para baixo: move o robô para baixo.\n" +
      "Seta para a direita: move o robô para a direita.\n\n" +
      "Objetivo: Regar todas as plantas e coletar todo o lixo antes da bateria acabar.\n" +
      "Existem estações de recarga, inimigos, obstáculos e items especiais.",
      100, 200
      );

    // Instrução para começar
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text("Pressione ESPAÇO para começar!", width / 2, height - 50);

    popStyle();
  }
}
