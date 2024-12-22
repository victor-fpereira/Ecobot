class DisplayHud {

  
  // HUD é a sigla para Heads-Up Display, que traduzido literalmente significa "Tela de Cabeça Erguida".
  // No contexto de jogos e interfaces gráficas, o HUD refere-se à sobreposição de informações visuais
  // apresentadas ao jogador na tela, como status ou elementos importantes, sem interromper a interação com o jogo.
  // Fonte: CHATGPT

  void desenharHUD() {
        
    textFont(fonte);
    
    // Fundo do HUD
    fill(0, 0, 0, 150); // Cor preta com transparência
    rect(0, 0, width, 80);

    // Nível da bateria (barra de progresso)
    fill(255, 255, 255); // Cor branca para o contorno
    rect(20, 20, 200, Global.tamanhoImagemDisplay); // Contorno da barra
    fill(0, 255, 0); // Cor verde para a barra de energia
    rect(20, 20, Global.nivelBateria * 2, Global.tamanhoImagemDisplay); // Bateria proporcional à energia

    // Texto do nível da bateria
    fill(255); // Cor branca
    text("Bateria: " + Global.nivelBateria + "%", 230, 35);

    // Pontuação
    text("Pontuação: " + Global.pontuacao, 400, 35);

    // Velocidade
    text("Velocidade: " + Global.velocidadeRobo, 600, 35);

    // Lixo Restante
    image(imgLixo, 20, 50, Global.tamanhoImagemDisplay, Global.tamanhoImagemDisplay); // Ícone do lixo
    text("Lixo: " + Global.lixoQtd, 50, 65);

    // Plantas Secas
    image(imgPlantaSeca, 150, 50, Global.tamanhoImagemDisplay, Global.tamanhoImagemDisplay); // Ícone da planta
    text("Plantas: " + Global.plantaQtd, 180, 65);

    // Inimigos
    image(imgInimigo, 280, 50, Global.tamanhoImagemDisplay, Global.tamanhoImagemDisplay); // Ícone do inimigo
    text("Inimigos: " + Global.inimigoQtd, 310, 65);
    
        // Inimigos
    image(imgItemEspecial, 410, 50, Global.tamanhoImagemDisplay, Global.tamanhoImagemDisplay); // Ícone dos items especiais
    text("Items Especiais: " + Global.itemEspecialQtd, 440, 65);
  }
}
