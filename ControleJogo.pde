class ControleJogo {

  PFont fontTitulo, fontTexto;
  boolean mostrarIntro = true;

  void reinicia() {
    mostrarIntro = true;
    Global.nivelBateria = 100;
    Global.pontuacao = 0;
    Global.lixoMapa = 5;
    Global.velocidadeRobo = 25;
    Global.plantas = 5;
    Global.plantaSeca = 5;
    Global.inimigos = 5;
    Global.obstaculos = 5;
    Global.estacaoRecarga = 5;
    Global.itemEspecial = 5;
  }

  void mostrarIntroducao() {

    pushStyle();

    background(34, 139, 34);

    // Camada transparente
    fill(0, 0, 0, 150); // Preto com transparência
    rect(50, 100, width - 100, height - 200);

    // Título e texto dentro do retângulo
    textAlign(CENTER);
    fill(255, 223, 0);
    textSize(24);
    text("Bem-vindo ao EcoBot!", width / 2, 150);

    textAlign(LEFT);
    textSize(18);
    text(
      "Tecla W: move o robô para cima.\n" +
      "Tecla A: move o robô para a esquerda.\n" +
      "Tecla S: move o robô para baixo.\n" +
      "Tecla D: move o robô para a direita.\n\n" +
      "Objetivo: Regar todas as plantas e coletar todo o lixo antes da bateria acabar.\n" +
      "Existem estações de recarga, inimigos, obstáculos e items especiais.",
      100, 200
      );

    // Instrução para começar
    textAlign(CENTER);
    textSize(20);
    fill(255, 223, 0);
    text("Pressione ESPAÇO para começar!", width / 2, height - 50);

    popStyle();
  }
}
