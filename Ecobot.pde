Robo robo;
Placar placar;
Lixo lixo;
Planta planta;
Obstaculo obstaculo;
ItemEspecial itemEspecial;
Inimigo inimigo;

int posicaoX, posicaoY;

void setup() {

  size(1200, 900);
  background(255);

  // Posicao inical dos objetos
  posicaoX = width / 2;
  posicaoY = height / 2;

  // Instancia objeto robo e configura algumas funcionalidades
  robo = new Robo();
  robo.setPosicao(posicaoX, posicaoY);
  robo.setNivelBateria(100);
  robo.setVelocidade(50);

  // Instancia objeto placar
  placar = new Placar();

  // Instancia objeto lixo
  lixo = new Lixo();
  lixo.setPosicao(posicaoX - 50, posicaoY - 10);

  // Instancia objeto planta
  planta = new Planta();
  planta.setPosicao(posicaoX - 100, posicaoY - 10);

  // Instancia objeto obstaculo
  obstaculo = new Obstaculo();
  obstaculo.setPosicao(posicaoX - 200, posicaoY - 10);
  
  // Instancia objeto inimigo
  inimigo = new Inimigo();
  inimigo.setPosicao(posicaoX - 300, posicaoY - 10);
  
  // Instancia objeto item especial
  itemEspecial = new ItemEspecial();
  itemEspecial.setPosicao(posicaoX - 400, posicaoY - 10);
}

void draw() {
  background(255);
  placar.mostraPontuacao();
  robo.desenha(color(0), 15);
  lixo.desenha(color(214, 214, 214), 15);
  planta.desenha(color(50, 225, 55), 15);
  obstaculo.desenha(color(85, 115, 255), 15);
  inimigo.desenha(color(255, 0, 0), 15);
  itemEspecial.desenha(color(255, 230, 85), 15);
}

void keyPressed() {
  robo.andar();
}
