class Robo extends Mapa {

  int tempoUltimaDiminuição = 0;  // Tempo da última diminuição em milissegundos
  int intervalo = 3000;  // Intervalo de 3 segundos (3000 milissegundos) para diminuir a bateria

  Mapa ultimoObjetoInteracao = null; // Armazena o último objeto que o robo teve contato

  Robo() {
    super.setTipoObjeto("robo");
  }

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

    // Aumenta a velocidade do robo apenas se encostar no objeto
    if (dist - robo.getLargura() - obj.getLargura() <= 0) {

      // Se a velocidade atual + a taxa de incremento for menor que o maximo permitido,
      // aumenta a velocidade, senao aumenta a velocidade ao limite maximo permitido.
      if (Global.velocidadeRobo + v < Global.limiteVelocidade) {
        Global.velocidadeRobo += v;
      } else {
        Global.velocidadeRobo = Global.limiteVelocidade;
      }
    }
  }

  void diminuiNivelBateria() {
    // Verifica se o intervalo de tempo passou
    if (millis() - tempoUltimaDiminuição >= intervalo) {
      if (Global.nivelBateria > 0) {
        Global.nivelBateria--;  // Diminui a bateria em 1 %
      }
      tempoUltimaDiminuição = millis();  // Atualiza o tempo da última diminuição
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
      Global.nivelBateria -= Global.energiaBateriaRegarPlanta;
      Global.pontuacao += Global.recompensaPlantaRegada;
      Global.plantas += 1;
      Global.plantaSeca -= 1;
      planta.plantaSeca = false;
    }
  }

  void coletarLixo(Mapa obj) {
    float dist = dist(robo.getX(), robo.getY(), obj.getX(), obj.getY());
    if (dist - robo.getLargura() - obj.getLargura() <= 0) {
      listaObjetos.remove(obj);
      Global.pontuacao += Global.recompensaLixoColetado;
      Global.lixoMapa -= 1;
    }
  }

  void interacaoObjetos() {
    // Busca o objeto mais próximo do robo
    Mapa obj = robo.encontraObjetoMaisProximo(listaObjetos);

    // Verifica se o objeto encontrado é válido
    if (obj == null) {
      println("Nenhum objeto encontrado.");
      return;  // Caso não haja objetos, retorna sem fazer nada
    }else {
      println("objeto encontrado.");
    }
  
     // Verifica se o objeto encontrado é o mesmo do anterior
    if (obj == ultimoObjetoInteracao) {
      return;  // Se o objeto é o mesmo, ignora a interação
    } else {
      // Atualiza o último objeto interagido
      ultimoObjetoInteracao = obj;
      println("Novo objeto encontrado: " + obj.getTipoObjeto());
    }

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
      } else if (obj.getTipoObjeto() == "inimigo") { // Acelera o consumo da bateria
        intervalo -= 50;
      } else if (obj.getTipoObjeto() == "itemEspecial") {
        robo.aumentaNivelBateria(obj, 100);
      }
    }
  }

  void andar() {

    switch (Global.direcaoAtual) {
    case "direita":
      if (x + Global.velocidadeRobo < Global.frameSizeWidth) {
        x += Global.velocidadeRobo;
      } else {
        x = Global.frameSizeWidth - largura;
      }
      break;

    case "esquerda":
      if (x - Global.velocidadeRobo > 0) {
        x -= Global.velocidadeRobo;
      } else {
        x = 0;
      }
      break;

    case "cima":
      if (y - Global.velocidadeRobo > Global.cabecalho) {
        y -= Global.velocidadeRobo;
      } else {
        y = Global.cabecalho - largura;
      }
      break;

    case "baixo": // Move para baixo
      if (y + Global.velocidadeRobo < height) {
        y += Global.velocidadeRobo;
      } else {
        y = height - largura;
      }
      break;
    }

    // Desenha o robo na nova posicao
    robo.desenha(x, y, robo.imagem);

    // Diminui o nivel da bateria a cada movimento
    if (Global.direcaoAtual != "parado") {
      diminuiNivelBateria();
    }
  }
}
