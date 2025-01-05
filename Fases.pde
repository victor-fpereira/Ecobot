class Fases {

  int nivel = 1;
  int numeroFases = 0;
  boolean tocarSomFimJogo = true;
  boolean tocarSomInicioJogo = true;

  // FONTE: CHATGPT

  float alpha = 0;        // Opacidade inicial
  float fadeDuration = 2; // Duração do fade em segundos
  float startTime;        // Tempo de início do fade
  boolean fading = true;  // Controla se o fade está ativo


  void defineNovoNivelJogo(int nivel) {

    // Matriz com os valores de configuração para cada nível

    int[][] configuracoes = {
      {200, 100, 5, 5, 5, 5, 5, 5}, // Nível 1
      {200, 80, 4, 4, 10, 4, 10, 4}, // Nível 2
      {200, 60, 3, 3, 15, 3, 15, 3}    // Nível 3
    };

    // Atualiza a quantidade de fases do jogo
    numeroFases = configuracoes.length;

    // Obtém a configuração correspondente ao nível
    int[] config = configuracoes[nivel - 1];  // -1 porque o array começa no zero

    // Aplica os valores globais
    Global.velocidadeRobo = config[0];
    Global.nivelBateria = config[1];
    Global.lixoQtd = config[2];
    Global.plantaQtd = config[3];
    Global.inimigoQtd = config[4];
    Global.itemEspecialQtd = config[5];
    Global.obstaculosQtd = config[6];
    Global.estacaoRecargaQtd = config[7];
  }

  // Redefine as configurações quando o jogo reinicia
  void redefinirConfiguracoes() {
    Global.pontuacao = 0;
    fases.nivel = 1;
    fases.defineNovoNivelJogo(fases.nivel);
    criaListaObjetos();
  }

  // FONTE: CHATGPT

  void iniciarFade() {
    startTime = millis(); // Reinicia o timer do fade
    fading = true;        // Ativa o fade
    loop();               // Garante que o loop de desenho esteja ativo
  }


  // FONTE: CHATGPT

  void fazerFade() {

    // Atualiza o valor do alpha diretamente com base no millis()
    alpha = map(millis(), startTime, startTime + fadeDuration * 1000, 0, 255);
    alpha = constrain(alpha, 0, 255); // Garante que fique dentro do intervalo

    // Desenha o fundo e o efeito de fade
    background(17, 100, 23);
    fill(188, 227, 191, alpha);
    rect(0, 0, width, height);

    // Finaliza o fade após o tempo especificado
    if (millis() >= startTime + fadeDuration * 1000) {
      fading = false; // Interrompe o fade
      somFundo.loop(); // Retoma o loop do som de fundo
    } else {
      redraw(); // Atualiza manualmente o próximo frame
    }
  }

  void fimDoJogo(boolean  venceu) {
    background(10, 148, 196);
    new Pontuacao().mostraPontuacaoFinal();
    Global.fimJogo = true;
    if (tocarSomFimJogo) {
      if (venceu) {
        somFundo.pause();
        somFimJogoVencer.play();
      } else {
        somFundo.pause();
        somFimJogoPerder.play();
      }
    }
    tocarSomFimJogo = false;
  }

  void keyPressed() {
    if (keyPressed && key == ENTER) {
      Global.mostrarIntro = false;
      if (tocarSomInicioJogo) {
        somFundo.pause();
        somInicioJogo.play();
        tocarSomInicioJogo = false;
      }
    }
    if (key == 'r' || key == 'R') {
      Global.mostrarIntro = true;
      Global.reiniciaJogo = true;
      tocarSomInicioJogo = true;
      tocarSomFimJogo = true;
      somFundo.loop();
    }
  }
}
