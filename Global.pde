static class Global {
  
  static boolean reiniciaJogo = false;
  static boolean mostrarIntro = false;

  static int aumentoBateria = 10;
  static int reducaoBateria = 10;
  static int limiteBateria = 100;
  static int nivelBateria = 0;
  static int pontuacao;

  static int velocidadeAceleracao = 10;
  static int velocidadeDeReducao = 10;
  static int velocidadeRobo = 0;
  static int limiteVelocidade = 200;
  static int plantas = 5;
  static int plantaSeca = 5;

  static int roboQtd = 1;
  static int lixoQtd = 0;
  static int plantaQtd = 0;
  static int inimigoQtd = 0;
  static int itemEspecialQtd = 0;
  static int obstaculosQtd = 0;
  static int estacaoRecargaQtd = 0;

  static int roboID = 0;
  static int lixoID = 1;
  static int plantaID = 2;
  static int inimigoID = 3;
  static int itemEspecialID = 4;
  static int obstaculosID = 5;
  static int estacaoRecargaID = 6;

  static int recompensaLixoColetado = 5;
  static int recompensaPlantaRegada = 10;
  static int energiaBateriaRegarPlanta = 2;

  // Espaço que os elementos podem aparecer sem sobrepor os mostradores
  static final int cabecalho = 100;

  static float velocidadePerseguicao = 10;

  // Tamanho dos quadrados que requesentam os objetos
  static int lado = 60;

  // Tamanho das imagens do display
  static int tamanhoImagemDisplay = 20;
}
