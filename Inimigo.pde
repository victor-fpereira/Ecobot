class Inimigo extends Objeto {

  // Calcula a distância dos quadrados que representam os inimigos e o robô
  // e vai diminuindo a distância entre eles, de forma que exista uma 'perseguição'.
  // Essa função poderia estar na classe Objeto, mas como é algo específico, achei melhor
  // criar essa classe extra. Melhora a organização e o código fica mais fácil de se entender.

  void perseguir(ArrayList<Objeto> listaInimigos, float roboX, float roboY, float deltaTime) {

    for (Objeto obj : listaInimigos) {

      float distX = roboX - obj.x;
      float distY = roboY - obj.y;
      float angulo = atan2(distY, distX);

      // Calcula nova posição sem interferir em outros inimigos
      obj.x += cos(angulo) * Global.velocidadePerseguicao * deltaTime;
      obj.y += sin(angulo) * Global.velocidadePerseguicao * deltaTime;
    }
  }
}
