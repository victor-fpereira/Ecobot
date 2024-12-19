class Robo extends Objeto {

  float x, y;
  boolean[] teclas = new boolean[4]; // Estados das teclas (cima, baixo, esquerda, direita)

  float lado;
  boolean mensagemExibida = false; // Controle para exibir mensagem uma única vez
  boolean perseguindoRobo = false; // Indica se o quadrado é vermelho e deve perseguir o robo

  boolean colidindo = false; // Controle de colisão atual


  // Verifica se as coordenadas x e y do objeto + lado do quadrado são menores que a distância do x e y do robo.
  // Se for, então o robo está enconstando no objeto.
  boolean verificarColisao(Objeto objeto, float roboX, float roboY) {
    if (roboX < objeto.x + Global.lado && roboX + Global.lado > objeto.x && roboY < objeto.y + Global.lado && roboY + Global.lado > objeto.y) {
      return true;
    } else {
      return false;
    }
  }

  /*
   Se você estiver usando Java 8 ou uma versão mais recente, pode usar o método removeIf() da lista. Este método permite remover elementos
   que atendem a uma condição específica.
   Explicação: O método removeIf() percorre a lista e remove os elementos que retornam true no lambda.
   A condição é passada diretamente, e você pode colocar a lógica de verificação ali.
   FONTE: CHATGPT
   */

  void removeLixo(ArrayList<Objeto> listaObjetos) {
    listaObjetos.removeIf(obj -> {
      if (verificarColisao(obj, this.x, this.y) && key == ' ') {
        Global.lixoQtd--; // Atualiza a quantidade de lixo no jogo
        Global.pontuacao += Global.recompensaLixoColetado; // Atualiza a pontuação do jogador
        return true; // Remove o objeto da lista
      }
      return false; // Mantém o objeto
    }
    );
  }

  void regarPlanta(ArrayList<Objeto> listaObjetos, PImage imagemPlanta) {
    for (Objeto obj : listaObjetos) {
      if (verificarColisao(obj, this.x, this.y) && key == ' ' && !obj.interagido) {
        Global.plantaQtd--; // Atualiza a quantidade de planta no jogo
        Global.pontuacao += Global.recompensaPlantaRegada;  // Atualiza a pontuação do jogador
        obj.imagem = imagemPlanta;
        obj.interagido = true;  // Marca o objeto como interagido
      }
    }
  }

  void estacao(ArrayList<Objeto> listaObjetos) {
    for (Objeto obj : listaObjetos) {
      if (verificarColisao(obj, this.x, this.y) && key == ' ') {
        if (Global.nivelBateria + Global.aumentoBateria < Global.limiteBateria) {
          Global.nivelBateria += Global.aumentoBateria; // Aumenta a bateria do robô
        } else {
          Global.nivelBateria = Global.limiteBateria; // Não deixa ultrapassar o limite máximo
        }
      }
    }
  }

  void obstaculo(ArrayList<Objeto> listaObjetos) {
    for (Objeto obj : listaObjetos) {
      // Verifica se há colisão atualmente
      boolean emColisao = verificarColisao(obj, this.x, this.y);

      // Interage apenas quando a colisão começa (de false -> true)
      if (emColisao && !obj.interagido) {
        Global.nivelBateria -= Global.reducaoBateria; // Reduz a bateria do robô
        obj.interagido = true; // Marca que o objeto está em colisão
      }

      // Reseta a flag quando não há mais colisão
      if (!emColisao) {
        obj.interagido = false;
      }
    }
  }

  void inimigo(ArrayList<Objeto> listaObjetos) {
    for (Objeto obj : listaObjetos) {
      // Verifica se há colisão atualmente
      boolean emColisao = verificarColisao(obj, this.x, this.y);

      // Interage apenas quando a colisão começa (de false -> true)
      if (emColisao && !obj.interagido) {
        Global.velocidadeRobo -= Global.velocidadeDeReducao; // Reduz a velocidade do robô

        obj.interagido = true; // Marca que o objeto está em colisão
      }

      // Reseta a flag quando não há mais colisão
      if (!emColisao) {
        obj.interagido = false;
      }
    }
  }


  void itemEspecial(ArrayList<Objeto> listaObjetos) {

    // Essa funçõa 'removeIf' serve para remover um elemento da lista.
    // Como a lista está sempre sendo utilizada para leitura, o programa
    // estava dando uns erros de ConcurrentModificationException.
    // Ou seja, o programa tentava remover um elemento da lista enquanto estava
    // sendo utilizada para leitura. Essa função do Java resolve isso de forma elegante.
    // Para entender melhor a sintaxe, procure por 'Funções lambda' do Java.
    // Parece um conteúdo complicado, mas não é.

    listaObjetos.removeIf(obj -> {
      if (verificarColisao(obj, this.x, this.y)) {
        Global.itemEspecialQtd--; // Atualiza a quantidade de planta no jogo
        if (Global.velocidadeRobo + Global.velocidadeAceleracao < Global.limiteVelocidade) {
          Global.velocidadeRobo += Global.velocidadeAceleracao; // Aumenta a bateria do robô
        } else {
          Global.velocidadeRobo = Global.limiteVelocidade; // Não deixa ultrapassar o limite máximo
        }
        return true; // Remove o objeto da lista
      }
      return false; // Mantém o objeto
    }
    );
  }

  void moverRobo(ArrayList<Objeto> listaRobo, float deltaTime) {

    // Muda as coordenadas do quadrado que representa o robô, fazendo novos desenhos
    // em posições diferentes. O deltatime é um artifício para que o movimento ocorra
    // de forma suave, ou seja, a cada quadro a movimentação é de uma fração de um inteiro.
    // Anteriormente eu estava usando posições com números float (1.1, 1.4 ...)
    // mas a  movimentação ficava truncada, dando a impressão que o robô dava 'saltos' na tela,
    // ao invés de se movimentar de forma suave e contínua. Cortesia do meu querido CHATGPT.
    // Nota extra: Usar apenas 'if' ao invés de 'else if' deixa a movimentação mais solta.
    // Pois mais de uma tecla / direção pode ser acionada ao mesmo tempo, permitindo o robô se
    // mover nas diagonais também.

    for (Objeto obj : listaRobo) {
      if (teclas[0]) { // Cima
        obj.y -= Global.velocidadeRobo * deltaTime;
      }
      if (teclas[1]) { // Baixo
        obj.y += Global.velocidadeRobo * deltaTime;
      }
      if (teclas[2]) { // Esquerda
        obj.x -= Global.velocidadeRobo * deltaTime;
      }
      if (teclas[3]) { // Direita
        obj.x += Global.velocidadeRobo * deltaTime;
      }

      // Limita o robô dentro da tela e atualiza a posição do objeto (robô)
      obj.x = constrain(obj.x, 25, width - 25);
      obj.y = constrain(obj.y, 25, height - 25);

      // Atualiza a posição atual do robô, para usar como comparador nas interações com os outros objetos.
      this.x = obj.x;
      this.y = obj.y;
    }
  }

  // Cada posição do array guarda um valor de true, para indicar a posição do robô.
  // Fonte: CHATGPT
  // Nota extra: Usar apenas 'if' ao invés de 'else if' deixa a movimentação mais solta.
  // Pois mais de uma tecla / direção pode ser acionada ao mesmo tempo, permitindo o robô se
  // mover nas diagonais também.

  void keyPressed() {
    if (keyCode == UP) teclas[0] = true;
    if (keyCode == DOWN) teclas[1] = true;
    if (keyCode == LEFT) teclas[2] = true;
    if (keyCode == RIGHT) teclas[3] = true;
  }

  // Ao soltar a tecla, a posição do array é  atualizada para false, indicando que o
  // robô não se move mais naquela direção.
  // Fonte: CHATGPT
  // Nota extra: Usar apenas 'if' ao invés de 'else if' deixa a movimentação mais solta.
  // Pois mais de uma tecla / direção pode ser solta ao mesmo tempo, permitindo o robô se
  // mover nas diagonais também.

  void keyReleased() {
    if (keyCode == UP) teclas[0] = false;
    if (keyCode == DOWN) teclas[1] = false;
    if (keyCode == LEFT) teclas[2] = false;
    if (keyCode == RIGHT) teclas[3] = false;
  }
}
