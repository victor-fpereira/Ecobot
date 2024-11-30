class Robo extends Mapa {

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

  void coletarLixo(Mapa obj) {
    float dist = dist(robo.getX(), robo.getY(), obj.getX(), obj.getY());
    println("Distancia"  + dist);
    println("largura robo" + robo.getLargura());
    println("largura objeto" + obj.getLargura());
    if (dist - robo.getLargura() - obj.getLargura() <= 0) {
      listaObjetos.remove(obj);
    }
  }

  // A cada tempo T, o nível da bateria diminui.
  void tempoBateriaAtiva() {
  }

  void andar() {
    
    // Move element based on arrow keys
    switch (keyCode) {
    case RIGHT:
      if (x + Global.velocidadeRobo < Global.frameSizeWidth) {
        x += Global.velocidadeRobo;
        robo.desenha(x, y);
      } else {
        x = Global.frameSizeWidth - largura;
        robo.desenha(x, y);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;

    case LEFT:
      if (x - Global.velocidadeRobo > 0) {
        x -= Global.velocidadeRobo;
        robo.desenha(x, y);
      } else {
        x = 0;
        robo.desenha(x, y);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;

    case UP:
      if (y - Global.velocidadeRobo > Global.cabecalho) {
        y -= Global.velocidadeRobo;
        robo.desenha(x, y);
      } else {
        y = Global.cabecalho - largura;
        robo.desenha(x, y);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;

    case DOWN:
      if (y + Global.velocidadeRobo < height) {
        y += Global.velocidadeRobo;
        robo.desenha(x, y);
      } else {
        y = height - largura;
        robo.desenha(x, y);
      }
      robo.setNivelBateria(Global.nivelBateria - 1);
      break;
    }
  }
}
