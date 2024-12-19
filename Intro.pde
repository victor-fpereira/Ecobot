class Intro {

  PFont fontTitulo, fontTexto;
  boolean mostrarIntro = true;
  boolean reinicia = false;

  void reinicia() {
    mostrarIntro = true;
    Global.nivelBateria = 100;
    Global.pontuacao = 0;
    Global.lixoQtd = 5;
    Global.plantas = 5;
    Global.plantaSeca = 5;
    Global.inimigoQtd = 5;
    Global.obstaculosQtd = 5;
    Global.estacaoRecargaQtd = 5;
    Global.itemEspecialQtd = 5;
    reinicia = false;
  }

  void keyPressed() {
    if (key == ' ') { mostrarIntro = false; }
    if (key == 'r' || key == 'R') reinicia = true;
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
    fill(255, 223, 0);
    text("Pressione ESPAÇO para começar!", width / 2, height - 50);

    popStyle();
  }
}
