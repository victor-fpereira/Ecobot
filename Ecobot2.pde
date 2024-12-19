// Posição do robo

Robo robo;
Inimigo inimigo;
Objeto estacaoRecarga, planta, itemEspecial, obstaculo, lixo;

ArrayList<Objeto> listaEstacaoRecarga, listaPlanta, listaItemEspecial, listaObstaculo, listaInimigo, listaLixo, listaRobo;
PImage imgPlanta, imgPlantaSeca, imgLixo, imgRobo, imgInimigo, imgItemEspecial, imgEstacao, imgObstaculo;
float lastFrameTime;     // Tempo do último frame
float deltaTime;         // Tempo entre frames


PFont fonte;

DisplayHud displayHud;
Intro intro;

int step = 0;

void setup() {

  //fullScreen();
  size(1000, 1000);

  lastFrameTime = millis() / 1000.0; // Tempo inicial em segundos

  displayHud = new DisplayHud();

  intro = new Intro();

  // carrega as imagens dos icones
  imgPlanta = loadImage("icon/planta.png");
  imgPlantaSeca = loadImage("icon/plantaSeca.png");
  imgLixo = loadImage("icon/lixeira.png");
  imgRobo = loadImage("icon/robo.png");
  imgInimigo = loadImage("icon/inimigo.png");
  imgItemEspecial = loadImage("icon/itemEspecial.png");
  imgEstacao = loadImage("icon/estacao.png");
  imgObstaculo = loadImage("icon/obstaculo.png");

  imgLixo = loadImage("icon/lixeira.png");
  imgPlanta = loadImage("icon/planta.png");
  imgInimigo = loadImage("icon/inimigo.png");

  fonte = createFont("font/arial.ttf", 16, true);

  robo = new Robo();
  listaRobo = robo.criaObjeto(Global.roboQtd, Global.roboID, imgRobo);

  lixo = new Objeto();
  listaLixo = lixo.criaObjeto(Global.lixoQtd, Global.lixoID, imgLixo);

  planta = new Objeto();
  listaPlanta = planta.criaObjeto(Global.plantaQtd, Global.plantaID, imgPlantaSeca);

  estacaoRecarga = new Objeto();
  listaEstacaoRecarga = estacaoRecarga.criaObjeto(Global.estacaoRecargaQtd, Global.estacaoRecargaID, imgEstacao);

  itemEspecial = new Objeto();
  listaItemEspecial = itemEspecial.criaObjeto(Global.itemEspecialQtd, Global.itemEspecialID, imgItemEspecial);

  obstaculo = new Objeto();
  listaObstaculo = obstaculo.criaObjeto(Global.obstaculosQtd, Global.obstaculosID, imgObstaculo);

  inimigo = new Inimigo();
  listaInimigo = inimigo.criaObjeto(Global.inimigoQtd, Global.inimigoID, imgInimigo);
}

void draw() {

  if (intro.mostrarIntro) {
    intro.mostrarIntroducao();
    return;
  } else if (intro.reinicia) {
    intro.reinicia();
  } else if (Global.nivelBateria <= 0 || Global.velocidadeRobo <= 0 || (Global.plantaQtd == 0 && Global.lixoQtd == 0)) {
    fimDoJogo();
    return;
  }

  // Calcula o delta time
  float currentTime = millis() / 1000.0;
  deltaTime = currentTime - lastFrameTime;
  lastFrameTime = currentTime;

  // Desenha o fundo
  background(200);


  displayHud.desenharHUD(imgLixo, imgPlanta, imgInimigo, fonte);

  planta.desenha(listaPlanta);
  estacaoRecarga.desenha(listaEstacaoRecarga);
  itemEspecial.desenha(listaItemEspecial);
  obstaculo.desenha(listaObstaculo);
  inimigo.desenha(listaInimigo);
  lixo.desenha(listaLixo);

  // Faz os inimigos perseguirem o robo
  inimigo.perseguir(listaInimigo, robo.x, robo.y, deltaTime);

  // Ações do robo
  robo.moverRobo(listaRobo, deltaTime);
  robo.desenha(listaRobo);
  robo.itemEspecial(listaItemEspecial);
  robo.removeLixo(listaLixo);
  robo.obstaculo(listaObstaculo);
  robo.estacao(listaEstacaoRecarga);
  robo.regarPlanta(listaPlanta, imgPlanta);
  robo.inimigo(listaInimigo);
}

void fimDoJogo() {

  frameRate(30);
  noStroke();
  // Calcula os valores de cor para a transição
  int redValue = max(0, 200 - step * 2);
  int greenValue = min(255, 200 + step * 5);
  int blueValue = max(0, 200 - step * 2);
  int alphaValue = min(255, 50 + step * 10);

  // Preenche com a cor calculada
  fill(redValue, greenValue, blueValue, alphaValue);
  rect(0, 0, width, height); // Cobre toda a tela

  // Incrementa o passo para avançar a transição
  if (step < 50) { // Define um limite para a transição (50 passos)
    step++;
  } else {
    new Pontuacao().mostraPontuacaoFinal();
    frameRate(60); // Volta a taxa de atualização padrão
  }
}

// Função para tratar as teclas pressionadas
void keyPressed() {
  robo.keyPressed();
  intro.keyPressed();
}

// Função para tratar as teclas liberadas
void keyReleased() {
  robo.keyReleased();
}
