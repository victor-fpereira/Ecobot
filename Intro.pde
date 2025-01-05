class Intro {

  PFont fontTitulo, fontTexto;

  void mostrarIntroducao1() {

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
    textSize(25);
    fill(0);
    text(
      "Instruções do jogo:\n\n" +
      "Seta para cima: move o robô para cima.\n" +
      "Seta para a esquerda: move o robô para a esquerda.\n" +
      "Seta para baixo: move o robô para baixo.\n" +
      "Seta para a direita: move o robô para a direita.\n\n" +
      "Objetivo: Regar todas as plantas e coletar todo o lixo antes da bateria acabar.\n" +
      "Existem estações de recarga, inimigos, obstáculos e items especiais." +
      "Os items especiais aumentam a velocidade do robô e aumentam a pontuação",
      width / 2, height / 1.6
      );

    textAlign(CENTER);
    textSize(35);
    fill(255);
    text("Pressione ENTER para começar!", width / 2, height - 50);

    popStyle();
  }

  void mostrarIntroducao() {

    pushStyle();

    background(17, 100, 23);

    // Exibe o logo em uma posição desejada
    // Centraliza o logo na tela
    float logoX = (width - logo.width) / 2;
    float logoY = (height - logo.height) / 5;

    // SOURCE: https://fontmeme.com/fontes/fonte-games/
    image(logo, logoX, logoY);

    // Definir as dimensões e posição do quadrado
    int boxWidth = width / 2;
    int boxHeight = 300;
    int boxX = width / 2 - boxWidth / 2;
    int boxY = height / 2;

    // Desenhar o quadrado com bordas arredondadas
    fill(255);
    noStroke();
    rect(boxX, boxY, boxWidth, boxHeight, 20); // Borda arredondada

    // Adiciona o título
    fill(0);
    textSize(25);
    text("Instruções do Jogo", boxX + boxWidth / 2.5, boxY + 40);

    // Definine as instruções
    textSize(20);
    String instrucoes =
      "\nUse as setas para mover o robô para cima, baixo, direita e esquerda.\n\n" +
      "Objetivo: Regar todas as plantas e coletar todo o lixo antes da bateria acabar ou a velocidade\n chegar a zero.\n\n" +
      "Estação de recarga: aumenta o nível da bateria.\nInimigos: diminui a velocidade do robô.\n" +
      "Obstáculos: diminuem o nível da bateria.\nItems especiais: amentam o nível da bateria e a pontuação.";

    // Desenhar o texto dentro do quadrado
    //text(instructions, width / 2, boxY + 100);
    text(instrucoes, boxX + 50, boxY + 70);

    textAlign(CENTER);
    textSize(35);
    fill(10, 255, 8);
    text("Pressione ENTER para começar!", width / 2, height - 50);

    popStyle();
  }
}
