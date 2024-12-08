class Robo extends Mapa {

  // Muda o valor do nível da bateria
  void setNivelBateria(int nb) {
    Global.nivelBateria = nb;
  }

  void setVelocidade(int v) {
    Global.velocidadeRobo = v;
  }

  int getVelocidade() {
    return Global.velocidadeRobo;
  }

  void diminuiVelocidade(Mapa obj, int v) {
    float dist = dist(robo.getX(), robo.getY(), obj.getX(), obj.getY());
    if (dist - robo.getLargura() - obj.getLargura() <= 0) {
      Global.velocidadeRobo -= v;
    }
  }

  void aumentaVelocidade(Mapa obj, int v) {
    float dist = dist(robo.getX(), robo.getY(), obj.getX(), obj.getY());
    if (dist - robo.getLargura() - obj.getLargura() <= 0) {
      Global.velocidadeRobo += v;
    }
  }

  void aumentaNivelBateria(Mapa obj, int v) {

    float dist = dist(robo.getX(), robo.getY(), obj.getX(), obj.getY());
    if (dist - robo.getLargura() - obj.getLargura() <= 0) {
      if (Global.nivelBateria < Global.limiteBateria) {
        //  Evita que a o nível da bateria suba acima do limite máximo  
        if (Global.nivelBateria + v  >=  Global.limiteBateria) {
          Global.nivelBateria = Global.limiteBateria;
        } else {
          Global.nivelBateria += v;
        }
      }
    }
  }

  // Consulta o valor do nível da bateria
  int getNivelBateria() {
    return Global.nivelBateria;
  }

  void regarPlanta(Mapa obj) {
    Planta planta = (Planta) obj;
    if (planta.plantaSeca) {
      Global.nivelBateria -= 2;
      Global.pontuacao += 10;
      Global.plantas -= 1;
      Global.plantaSeca -= 1;
      planta.plantaSeca = false;
    }
  }

  void recarregarBateria() {
  }

  void coletarLixo(Mapa obj) {
    float dist = dist(robo.getX(), robo.getY(), obj.getX(), obj.getY());
    if (dist - robo.getLargura() - obj.getLargura() <= 0) {
      listaObjetos.remove(obj);
      Global.pontuacao += Global.recompensaLixoColetado;
      Global.lixoMapa -= 1;
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
