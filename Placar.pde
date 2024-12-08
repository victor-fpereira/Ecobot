class Placar {

  int pontuacao;

  void aumentaPontuacao(int pontos) {
    pontuacao += pontos;
  }

  void diminuiPontuacao(int pontos) {
    pontuacao -= pontos;
  }

  void mostraPontuacaoFinal1() {
    pushStyle(); // Salva o estilo atual

    background(255);

    // Fundo do placar
    fill(34, 139, 34, 200); // Verde escuro com transparência
    rectMode(CENTER);
    rect(width / 2, height / 2, width * 0.8, height * 0.6, 20); // Placa arredondada

    // Título
    textAlign(CENTER);
    textSize(32);
    fill(255, 223, 0); // Amarelo vibrante
    text("Placar Final", width / 2, height / 2 - 100);

    // Informações
    textSize(20);
    fill(255); // Texto branco
    text("Pontuação: " + Global.pontuacao, width / 2, height / 2 - 40);
    text("Lixo restante: " + Global.lixoMapa, width / 2, height / 2);
    text("Plantas secas: " + Global.plantaSeca, width / 2, height / 2 + 40);

    // Botão ou instrução para reiniciar
    textSize(18);
    fill(255, 69, 0); // Laranja vibrante
    text("Pressione 'R' para reiniciar o jogo", width / 2, height / 2 + 100);

    popStyle(); // Restaura o estilo anterior
  }

  void mostraPontuacao() {
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
    text(Global.lixoMapa, posicaoValores, posicaoPlacaY * 4);
    text("Plantas secas:", posicaoPlacaX, posicaoPlacaY * 5);
    text(Global.plantas, posicaoValores, posicaoPlacaY * 5);
    text("Inimigos:", posicaoPlacaX, posicaoPlacaY * 6);
    text(Global.inimigos, posicaoValores, posicaoPlacaY * 6);
    popStyle();  // Restaura o estilo anterior
  }
}
