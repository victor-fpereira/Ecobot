Robo robo;
Placar placar;
Lixo lixo;
Planta planta;
Obstaculo obstaculo;
ItemEspecial itemEspecial;
Inimigo inimigo;
EstacaoRecarga estacaoRecarga;
GameSettings gameSet;

ArrayList<Lixo> listaLixo;

float posicaoX, posicaoY;

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

  // Instancia objeto placar
  placar = new Placar();

  // Gera coordenadas aleatórias para o lixo, de acordo com a quantidade setada na classe Global.lixoMapa
  listaLixo = new ArrayList<>();
  for (int i=0; i < Global.lixoMapa; i++) {
    lixo = new Lixo();
    lixo.x = random(0, width);
    lixo.y = random(Global.cabecalho, height);
    listaLixo.add(lixo);
  }

  // Instancia objeto planta
  planta = new Planta();
  planta.setPosicao(posicaoX - 100, posicaoY);

  // Instancia objeto obstaculo
  obstaculo = new Obstaculo();
  obstaculo.setPosicao(posicaoX - 200, posicaoY);

  // Instancia objeto inimigo
  inimigo = new Inimigo();
  inimigo.setPosicao(posicaoX - 300, posicaoY);

  // Instancia objeto item especial
  itemEspecial = new ItemEspecial();
  itemEspecial.setPosicao(posicaoX - 400, posicaoY);

  // Instancia objeto game set
  gameSet = new GameSettings();

  // Instancia a estacao de recarga
  estacaoRecarga = new EstacaoRecarga();
  estacaoRecarga.setPosicao(posicaoX - 500, posicaoY);
}

void draw() {

  background(255);

  placar.mostraPontuacao();
  gameSet.mostraInstrucoesJogo();

  robo.desenha(color(0), 15);

  // Pega as coordenadas da lista coordenadas da lista de objetos do tipo lixo. Para cada objeto, pega o x e y.
  for (int i=0; i<listaLixo.size(); i++) {
    lixo.desenha(listaLixo.get(i).x, listaLixo.get(i).y, color(214, 214, 214), 15);
  }

  planta.desenha(color(50, 225, 55), 15);
  planta.setQuantidade(1);

  obstaculo.desenha(color(0, 0, 255), 15);
  inimigo.desenha(color(255, 0, 0), 15);
  itemEspecial.desenha(color(255, 230, 85), 15);
  estacaoRecarga.desenha(color(255, 130, 0), 15);
}

void keyPressed() {
  robo.andar();
}
