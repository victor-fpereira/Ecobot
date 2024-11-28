Robo robo;
Placar placar;
Lixo lixo;
Planta planta;
Obstaculo obstaculo;
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
  lixo.setPosicao(posicaoX,posicaoY);
  
  // Instancia objeto planta
  planta = new Planta();
  planta.setPosicao(posicaoX - 100, posicaoY - 10);
  
  // Instancia objeto item special
    planta = new Planta();
  planta.setPosicao(posicaoX - 100, posicaoY - 10);
  

}

void draw() {
  background(255);
  placar.mostraPontuacao();
  robo.desenha(color(0), 15);
  lixo.desenha(color(214, 214, 214), 15);
  planta.desenha(color(50,225,55), 20);

}

void keyPressed() {
  robo.andar();
}
