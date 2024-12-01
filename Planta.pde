class Planta extends Mapa {
  
  boolean plantaSeca = false;
  color cor;
  
  Planta() {
    super.setTipoObjeto("planta");
  }
  
  // New method with an additional 'color' parameter
  void desenha(float x, float y, color cor) {
    pushStyle();  // Starts a new style
    fill(cor);    // Sets the fill color
    square(x, y, largura); // Draws the square
    popStyle();   // Restores the previous style
  }

}
