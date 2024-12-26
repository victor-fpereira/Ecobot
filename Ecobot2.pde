import processing.sound.*;

Robo robo;
Inimigo inimigo;
Objeto estacaoRecarga, planta, itemEspecial, obstaculo, lixo;

ArrayList<Objeto> listaEstacaoRecarga, listaPlanta, listaItemEspecial, listaObstaculo, listaInimigo, listaLixo, listaRobo;
PImage imgPlanta, imgPlantaSeca, imgLixo, imgRobo, imgInimigo, imgItemEspecial, imgEstacao, imgObstaculo, logo;
PImage[] imgFundo = new PImage[3];
float lastFrameTime;     // Tempo do último frame
float deltaTime;         // Tempo entre frames

PFont fonte;

DisplayHud displayHud;

Intro intro;

Fases fases;

SoundFile somFundo, somPontuacao, somItemEspecial, somInimigo, somObstaculo,
  somInicioJogo, somFimJogoVencer, somFimJogoPerder, somRecargaBateria, somTransicaoFase;

void setup() {

  //fullScreen();

  size(1000, 1000);

  noLoop();             // Para o loop automático de draw
  noFill();

  displayHud = new DisplayHud();

  intro = new Intro();

  Global.mostrarIntro = true;
  
  // Os ícones foram pegos do site https://www.flaticon.com/br/

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

  logo = loadImage("background/titulo.png");

  imgFundo[0] = loadImage("background/fase1.jpg");
  imgFundo[1] = loadImage("background/fase2.jpg");
  imgFundo[2] = loadImage("background/fase3.jpg");

  for (int i=0; i<imgFundo.length; i++) {
    imgFundo[i].resize(1000, 1000);
  }

  fases = new Fases();
  fases.defineNovoNivelJogo(fases.nivel);

  criaListaObjetos();

  somFundo = new SoundFile(this, "sound/fundo.mp3");
  somFundo.loop(); // Toca continuamente

  // TODOS OS CONTEÚDOS DE SOM FORAM COPIADOS DO https://pixabay.com/pt/music/search/ciclo/
  
  somInicioJogo = new SoundFile(this, "sound/gamestart.mp3");
  somTransicaoFase = new SoundFile(this, "sound/muda-fase.mp3");
  somPontuacao = new SoundFile(this, "sound/pontuacao.mp3");
  somItemEspecial = new SoundFile(this, "sound/magic-items.mp3");
  somInimigo =  new SoundFile(this, "sound/enemy.mp3");
  somObstaculo =  new SoundFile(this, "sound/obstaculo.mp3");
  somRecargaBateria = new SoundFile(this, "sound/engine.mp3");
  somFimJogoVencer = new SoundFile(this, "sound/win.mp3");
  somFimJogoPerder = new SoundFile(this, "sound/loose.mp3");
}

void draw() {

  if (Global.mostrarIntro) {
    intro.mostrarIntroducao();
    fases.iniciarFade();
    return;
  } else if (Global.reiniciaJogo) {
    fases.redefinirConfiguracoes();
    Global.reiniciaJogo = false;
  } else if (Global.nivelBateria > 0 && Global.velocidadeRobo > 0 && Global.plantaQtd == 0 && Global.lixoQtd == 0) {
    if (fases.nivel < fases.numeroFases) {
      fases.nivel++; // Aumenta um nível da fase em 1
      fases.defineNovoNivelJogo(fases.nivel);
      criaListaObjetos();
      somTransicaoFase.play();
    } else {
      Global.fimJogo = true;
      fases.fimDoJogo(true);
      return;
    }
  } else if (Global.nivelBateria <= 0 || Global.velocidadeRobo <= 0) {
    Global.fimJogo = true;
    fases.fimDoJogo(false);
    return;
  }

  // Efeito para transicionar entre as telas do jogo
  if (fases.fading) {
    fases.fazerFade();
    return;
  }

  background(imgFundo[fases.nivel - 1]);

  // Calcula o delta time
  float currentTime = millis() / 1000.0;
  deltaTime = currentTime - lastFrameTime;
  lastFrameTime = currentTime;

  displayHud.desenharHUD();

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

// Função para agrupamento

void criaListaObjetos() {

  // Limpa as listas apenas depois que a  primeira fase foi concluída.
  // Se for a primeira fase, ignora a limpeza das listas.

  if (listaEstacaoRecarga != null) {
    listaEstacaoRecarga.clear();
    listaPlanta.clear();
    listaItemEspecial.clear();
    listaObstaculo.clear();
    listaInimigo.clear();
    listaLixo.clear();
    listaRobo.clear();
  }

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

// Função para tratar as teclas pressionadas
void keyPressed() {
  robo.keyPressed();
  fases.keyPressed();
}

// Função para tratar as teclas liberadas
void keyReleased() {
  robo.keyReleased();
}
