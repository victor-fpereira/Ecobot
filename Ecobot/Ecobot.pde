Robo robo;
Placar placar;
ControleJogo controleJogo;
Mapa objetoMaisProximo;
DisplayHud displayHud;

PImage imgPlanta, imgPlantaSeca, imgLixeira, imgRobo, imgInimigo, imgItemEspecial, imgEstacao, imgObstaculo;

float posicaoX, posicaoY;
ArrayList<Mapa> listaObjetos;

void setup() {

  size(1200, 900);

  background(255);
  
  noStroke();

  displayHud = new DisplayHud();

  // Posicao inical dos objetos
  posicaoX = width / 2;
  posicaoY = height / 2;

  // Instancia objeto placar
  placar = new Placar();

  // Instancia objeto game set
  controleJogo = new ControleJogo();

  // carrega as imagens dos icones
  imgPlanta = loadImage("icon/planta.png");
  imgPlantaSeca = loadImage("icon/plantaSeca.png");
  imgLixeira = loadImage("icon/lixeira.png");
  imgRobo = loadImage("icon/robo.png");
  imgInimigo = loadImage("icon/inimigo.png");
  imgItemEspecial = loadImage("icon/itemEspecial.png");
  imgEstacao = loadImage("icon/estacao.png");
  imgObstaculo = loadImage("icon/obstaculo.png");

  // Gera coordenadas aleatórias para o lixo, de acordo com a quantidade setada na classe Global.lixoMapa
  listaObjetos = new ArrayList<>();

  // Instancia objeto robo e configura algumas funcionalidades
  robo = new Robo();
  robo.setPosicao(posicaoX, posicaoY);
  robo.setNivelBateria(Global.nivelBateria);
  robo.setVelocidade(Global.velocidadeRobo);
  robo.setLargura(10);
  robo.cor = color(0);
  robo.imagem = imgRobo;

  for (int i=0; i < Global.lixoMapa; i++) {
    Lixo lixo = new Lixo();
    lixo.x = random(0, width);
    lixo.y = random(Global.cabecalho, height);
    lixo.setLargura(10);
    lixo.imagem = imgLixeira;
    listaObjetos.add(lixo);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.plantas; i++) {
    Planta planta = new Planta();
    planta.x = random(0, width);
    planta.y = random(Global.cabecalho, height);
    planta.setLargura(10);
    planta.plantaSeca = false;
    planta.imagem = imgPlanta;
    listaObjetos.add(planta);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.plantaSeca; i++) {
    Planta planta = new Planta();
    planta.x = random(0, width);
    planta.y = random(Global.cabecalho, height);
    planta.setLargura(10);
    planta.imagem = imgPlantaSeca;
    planta.plantaSeca = true;
    listaObjetos.add(planta);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.obstaculos; i++) {
    Obstaculo obstaculo = new Obstaculo();
    obstaculo.x = random(0, width);
    obstaculo.y = random(Global.cabecalho, height);
    obstaculo.setLargura(10);
    obstaculo.imagem = imgObstaculo;
    listaObjetos.add(obstaculo);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.estacaoRecarga; i++) {
    EstacaoRecarga estacaoRecarga = new EstacaoRecarga();
    estacaoRecarga.x = random(0, width);
    estacaoRecarga.y = random(Global.cabecalho, height);
    estacaoRecarga.setLargura(10);
    estacaoRecarga.imagem = imgEstacao;
    listaObjetos.add(estacaoRecarga);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.inimigos; i++) {
    Inimigo inimigo = new Inimigo();
    inimigo.x = random(0, width);
    inimigo.y = random(Global.cabecalho, height);
    inimigo.setLargura(10);
    inimigo.imagem = imgInimigo;
    listaObjetos.add(inimigo);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.itemEspecial; i++) {
    ItemEspecial itemEspecial = new ItemEspecial();
    itemEspecial.x = random(0, width);
    itemEspecial.y = random(Global.cabecalho, height);
    itemEspecial.setLargura(10);
    itemEspecial.imagem = imgItemEspecial;
    listaObjetos.add(itemEspecial);
  }
}

void draw() {

  if (controleJogo.mostrarIntro) {
    controleJogo.mostrarIntroducao();
    return;
  }

  background(255);

  displayHud.desenharHUD();

  //if (robo.getNivelBateria() <= 0 || robo.getVelocidade() <= 0 || (Global.plantaSeca == 0 && Global.lixoMapa == 0)) {
  //  placar.mostraPontuacaoFinal();
  //  return;
  //}
  
  new Mapa().desenha(listaObjetos);
  
  robo.interacaoObjetos();
  
  robo.andar();
}

void keyPressed() {

  // Sai da ControleJogodução do jogo
  if (key == ' ') {
    controleJogo.mostrarIntro = false;
  } else if (key == 'r' || key == 'R') {
    controleJogo.reinicia();
  }
  
  // Atualiza a posição atual baseada na tecla direcional que foi pressionada
  switch (keyCode) {
  case RIGHT:
    Global.direcaoAtual = "direita";
    break;
  case LEFT:
    Global.direcaoAtual = "esquerda";
    break;
  case UP:
    Global.direcaoAtual = "cima";
    break;
  case DOWN:
    Global.direcaoAtual = "baixo";
    break;
  }
}
