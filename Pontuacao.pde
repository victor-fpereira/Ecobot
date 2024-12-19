class Pontuacao {

  void mostraPontuacaoFinal() {
    pushStyle(); // Salva o estilo atual

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
    text("Lixo restante: " + Global.lixoQtd, width / 2, height / 2);
    text("Plantas secas: " + Global.plantaQtd, width / 2, height / 2 + 40);

    // Botão ou instrução para reiniciar
    textSize(18);
    fill(0); // Preto
    text("Pressione 'R' para reiniciar o jogo", width / 2, height / 2 + 100);

    popStyle(); // Restaura o estilo anterior
  }
   
}
