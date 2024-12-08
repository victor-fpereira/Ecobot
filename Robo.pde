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
      Global.nivelBateria += v;
    }
  }

  // Consulta o valor do nível da bateria
  int getNivelBateria() {
    return Global.nivelBateria;
  }

  void regarPlanta(Mapa obj) {
    Planta planta = (Planta) obj;
    if (planta.plantaSeca) {
      //Global.nivelBateria -= 2; // Pensar em usar essa opção
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
    
    switch (Global.direcaoAtual) {
    case 1: // Move para a direita
      if (x + Global.velocidadeRobo < Global.frameSizeWidth) {
        x += Global.velocidadeRobo;
      } else {
        x = Global.frameSizeWidth - largura;
      }
      break;

    case 2: // Move para a esquerda
      if (x - Global.velocidadeRobo > 0) {
        x -= Global.velocidadeRobo;
      } else {
        x = 0;
      }
      break;

    case 3: // Move para cima
      if (y - Global.velocidadeRobo > Global.cabecalho) {
        y -= Global.velocidadeRobo;
      } else {
        y = Global.cabecalho - largura;
      }
      break;

    case 4: // Move para baixo
      if (y + Global.velocidadeRobo < height) {
        y += Global.velocidadeRobo;
      } else {
        y = height - largura;
      }
      break;
    }

    // Desenha o robo na nova posicao
    robo.desenha(x, y);

    // Reduce battery level for each movement
    if (Global.direcaoAtual != 0) {
      robo.setNivelBateria(Global.nivelBateria - 1);
    }
  }

  void andar2() {

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

  void interacaoObjetos() {
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
        robo.aumentaVelocidade(obj, 1);
      } else if (obj.getTipoObjeto() == "inimigo") {
        robo.diminuiVelocidade(obj, 1);
      } else if (obj.getTipoObjeto() == "itemEspecial") {
        robo.aumentaNivelBateria(obj, 500);
      }
    }
  }
}
