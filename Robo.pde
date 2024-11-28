class Robo extends ObjetoMapa {

  // Muda o valor do nível da bateria
  void setNivelBateria(int nb) {
    Global.nivelBateria = nb;
  }

  void setVelocidade(int v) {
    Global.velocidadeRobo = v;
  }

  // Consulta o valor do nível da bateria
  int getNivelBateria() {
    return Global.nivelBateria;
  }

  void regarPlanta() {
  }

  void recarregarBateria() {
  }

  void coletarLixo() {
  }

  // A cada tempo T, o nível da bateria diminui.
  void tempoBateriaAtiva() {
  }

  void moveRobo(int x, int y) {
    robo.setPosicao(x, y);
    robo.desenha(cor, largura);
  }

  void andar() {
    switch (key) {
    case 'd':
      if (posicaoX + Global.velocidadeRobo < width) {
        posicaoX += Global.velocidadeRobo;
        robo.moveRobo(posicaoX, posicaoY);
      } else {
        posicaoX = width - largura;
        robo.moveRobo(posicaoX, posicaoY);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;

    case 'a':
      if (posicaoX - Global.velocidadeRobo > 0) {
        posicaoX -= Global.velocidadeRobo;
        robo.moveRobo(posicaoX, posicaoY);
      } else {
        posicaoX = 0;
        robo.moveRobo(posicaoX, posicaoY);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;

    case 'w':
      if (posicaoY - Global.velocidadeRobo > 0) {
        posicaoY -= Global.velocidadeRobo;
        robo.moveRobo(posicaoX, posicaoY);
      } else {
        posicaoY = 0;
        robo.moveRobo(posicaoX, posicaoY);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;

    case 's':
      if (posicaoY + Global.velocidadeRobo < height) {
        posicaoY += Global.velocidadeRobo;
        robo.moveRobo(posicaoX, posicaoY);
      } else {
        robo.moveRobo(posicaoX, height - largura);
        posicaoY = height - largura;
        robo.moveRobo(posicaoX, posicaoY);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;
    }
  }
}
