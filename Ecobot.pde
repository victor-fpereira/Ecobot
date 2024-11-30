Robo robo;
Placar placar;
Lixo lixo;
Planta planta;
Obstaculo obstaculo;
ItemEspecial itemEspecial;
Inimigo inimigo;
EstacaoRecarga estacaoRecarga;
GameSettings gameSet;
Mapa objetoMaisProximo;
float posicaoX, posicaoY;
ArrayList<Mapa> listaObjetos;


void setup() {

  size(1200, 900);

  background(255);

  // Posicao inical dos objetos
  posicaoX = width / 2;
  posicaoY = height / 2;

  // Instancia objeto robo e configura algumas funcionalidades
  robo = new Robo();
  robo.setPosicao(posicaoX, posicaoY);
  robo.setNivelBateria(Global.nivelBateria);
  robo.setVelocidade(Global.velocidadeRobo);
  robo.setLargura(15);
  robo.cor = color(0);

  // Instancia objeto placar
  placar = new Placar();

  // Instancia objeto game set
  gameSet = new GameSettings();

  // Gera coordenadas aleatórias para o lixo, de acordo com a quantidade setada na classe Global.lixoMapa
  listaObjetos = new ArrayList<>();

  for (int i=0; i < Global.lixoMapa; i++) {
    lixo = new Lixo();
    lixo.x = random(0, width);
    lixo.y = random(Global.cabecalho, height);
    lixo.setLargura(15);
    lixo.cor = color(200, 200, 200);
    listaObjetos.add(lixo);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.plantas; i++) {
    planta = new Planta();
    planta.x = random(0, width);
    planta.y = random(Global.cabecalho, height);
    planta.setLargura(10);
    planta.cor = color(0, 255, 0);
    listaObjetos.add(planta);
  }


  //// Instancia objeto obstaculo
  //obstaculo = new Obstaculo();
  //obstaculo.setPosicao(posicaoX - 200, posicaoY);

  //// Instancia objeto inimigo
  //inimigo = new Inimigo();
  //inimigo.setPosicao(posicaoX - 300, posicaoY);

  //// Instancia objeto item especial
  //itemEspecial = new ItemEspecial();
  //itemEspecial.setPosicao(posicaoX - 400, posicaoY);


  //// Instancia a estacao de recarga
  //estacaoRecarga = new EstacaoRecarga();
  //estacaoRecarga.setPosicao(posicaoX - 500, posicaoY);
}

void draw() {

  background(255);

  placar.mostraPontuacao();
  gameSet.mostraInstrucoesJogo();

  robo.desenha(robo.getX(), robo.getY());

  // Pega as coordenadas da lista coordenadas da lista de objetos do tipo lixo. Para cada objeto, pega o x e y.
  for (int i=0; i<listaObjetos.size(); i++) {
    switch (listaObjetos.get(i).getTipoObjeto()) {
    case "lixo":
      lixo.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
      break;
    case "planta":
      planta.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
      break;
    }
  }

  //planta.desenha(color(50, 225, 55), 15);
  //planta.setQuantidade(1);

  //obstaculo.desenha(color(0, 0, 255), 15);
  //inimigo.desenha(color(255, 0, 0), 15);
  //itemEspecial.desenha(color(255, 230, 85), 15);
  //estacaoRecarga.desenha(color(255, 130, 0), 15);
}

void keyPressed() {

  robo.andar();

  // Busca o objeto mais próximo do robo
  Mapa obj = robo.encontraObjetoMaisProximo(listaObjetos);
  if (key == ' ') {
    switch (obj.getTipoObjeto()) {
    case "lixo":
      robo.coletarLixo(obj);
    }
  }
}
