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

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.plantaSeca; i++) {
    planta = new Planta();
    planta.x = random(0, width);
    planta.y = random(Global.cabecalho, height);
    planta.setLargura(10);
    planta.plantaSeca = true;
    listaObjetos.add(planta);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.obstaculos; i++) {
    obstaculo = new Obstaculo();
    obstaculo.x = random(0, width);
    obstaculo.y = random(Global.cabecalho, height);
    obstaculo.setLargura(10);
    obstaculo.cor = color(0, 0, 255);
    listaObjetos.add(obstaculo);
  }

  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.estacaoRecarga; i++) {
    estacaoRecarga = new EstacaoRecarga();
    estacaoRecarga.x = random(0, width);
    estacaoRecarga.y = random(Global.cabecalho, height);
    estacaoRecarga.setLargura(10);
    estacaoRecarga.cor = color(140, 48, 240);
    listaObjetos.add(estacaoRecarga);
  }
  
  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.inimigos; i++) {
    inimigo = new Inimigo();
    inimigo.x = random(0, width);
    inimigo.y = random(Global.cabecalho, height);
    inimigo.setLargura(10);
    inimigo.cor = color(255, 0, 0);
    listaObjetos.add(inimigo);
  }
  
  // Gera coordenadas aleatórias para a planta, de acordo com a quantidade setada na classe Global.plantas
  for (int i=0; i < Global.itemEspecial; i++) {
    itemEspecial = new ItemEspecial();
    itemEspecial.x = random(0, width);
    itemEspecial.y = random(Global.cabecalho, height);
    itemEspecial.setLargura(10);
    itemEspecial.cor = color(255, 255, 70);
    listaObjetos.add(itemEspecial);
  }

}

void draw() {

  background(255);


  if (robo.getNivelBateria() <= 0 || robo.getVelocidade() <= 0 || (Global.plantaSeca == 0 && Global.lixoMapa == 0)) {
    fill(50, 240, 62); // Red color
    textAlign(CENTER, CENTER);
    placar.mostraPontuacaoFinal();
    textFont(createFont("Arial", 50));
    text("O jogo acabou!", width / 2, height / 2);
    return;
  }

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
      Planta planta = (Planta) listaObjetos.get(i);
      if (planta.plantaSeca) {
        planta.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y, color(240, 150, 50));
      } else {
        planta.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y, color(0, 255, 50));
      }
      break;
    case "obstaculo":
      obstaculo.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
      break;
    case "estacao":
      estacaoRecarga.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
      break;
     case "inimigo":
        inimigo.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
      break;
     case "itemEspecial":
       itemEspecial.desenha(listaObjetos.get(i).x, listaObjetos.get(i).y);
    }
  }

  //itemEspecial.desenha(color(255, 230, 85), 15);
}

void keyPressed() {

  robo.andar();

  // Busca o objeto mais próximo do robo
  Mapa obj = robo.encontraObjetoMaisProximo(listaObjetos);
  if (key == ' ') {
    switch (obj.getTipoObjeto()) {
    case "lixo":
      robo.coletarLixo(obj);
      break;
    case "planta":
      robo.regarPlanta(obj);
      break;
    }
  }
  switch (keyCode) {
    case RIGHT:
    case LEFT:
    case UP:
    case DOWN:
      if (obj.getTipoObjeto() == "obstaculo") {
        robo.diminuiVelocidade(obj, 1);
      } else if (obj.getTipoObjeto() == "estacao") {
        robo.aumentaNivelBateria(obj, 5);
        robo.aumentaVelocidade(obj, 5);
      } else if (obj.getTipoObjeto() == "inimigo") {
        robo.diminuiVelocidade(obj, 5);
      } else if (obj.getTipoObjeto() == "itemEspecial") {
        robo.aumentaNivelBateria(obj, 500);
      }
    }
}
