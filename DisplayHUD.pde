class DisplayHud {


  PFont font;
  PImage lixoIcon, plantaIcon, inimigoIcon;

  int lixoRestante = 12;
  int plantasSecas = 5;
  int inimigos = 3;
  
  // HUD é a sigla para Heads-Up Display, que traduzido literalmente significa "Tela de Cabeça Erguida".
  // No contexto de jogos e interfaces gráficas, o HUD refere-se à sobreposição de informações visuais
  // apresentadas ao jogador na tela, como status ou elementos importantes, sem interromper a interação com o jogo.
  // Fonte: CHATGPT

  void desenharHUD() {
    
    //font = loadFont("font/Alef-Bold-48.vlw");
    font = createFont("font/arial.ttf", 16, true); // Carrega uma fonte
    textFont(font);
    
    lixoIcon = loadImage("icon/lixeira.png");
    plantaIcon = loadImage("icon/planta.png");
    inimigoIcon = loadImage("icon/inimigo.png");
    
    // Fundo do HUD
    fill(0, 0, 0, 150); // Cor preta com transparência
    rect(0, 0, width, 80);

    // Nível da bateria (barra de progresso)
    fill(255, 255, 255); // Cor branca para o contorno
    rect(20, 20, 200, 20); // Contorno da barra
    fill(0, 255, 0); // Cor verde para a barra de energia
    rect(20, 20, Global.nivelBateria * 2, 20); // Bateria proporcional à energia

    // Texto do nível da bateria
    fill(255); // Cor branca
    text("Bateria: " + Global.nivelBateria + "%", 230, 35);

    // Pontuação
    text("Pontuação: " + Global.pontuacao, 400, 35);

    // Velocidade
    text("Velocidade: " + Global.velocidadeRobo, 600, 35);

    // Lixo Restante
    image(lixoIcon, 20, 50, 20, 20); // Ícone do lixo
    text("Lixo: " + Global.lixoMapa, 50, 65);

    // Plantas Secas
    image(plantaIcon, 150, 50, 20, 20); // Ícone da planta
    text("Plantas: " + Global.plantas, 180, 65);

    // Inimigos
    image(inimigoIcon, 280, 50, 20, 20); // Ícone do inimigo
    text("Inimigos: " + Global.inimigos, 310, 65);
  }
}
