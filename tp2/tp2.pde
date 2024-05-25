// ALUMNO: Montenegro Evelyn Tatiana
// DOCENTE: Matias Jauregui Lorda
// COMISION 2



String elNombre;

int pantalla, tiempo, suma;
int textSizeValue = 5;  // Renombrado para evitar conflicto con la función textSize()
int tam = 100;
int miVariable = 30;
int contador;
float posX, posY, tamX, tamY;
PFont fuenteNueva;
PImage fondoinicial; // pantalla1
PImage imagen1; // pantalla2
PImage imagen2; // pantalla3
PImage pacman; // foto pacman en movimiento

void setup() {
  size(640, 480);
  elNombre = "PACMAN";
  // Cargo mis imágenes una sola vez
  fondoinicial = loadImage("imagen1.jpg");
  imagen1 = loadImage("imagen2.png");
  imagen2 = loadImage("imagen3.jpg");
  pacman = loadImage("pacman.jpg");
  fuenteNueva = loadFont("Tahoma.vlw"); // Cargo la fuente una vez
  posX = 50;
  posY = 112;
  tamX = 20;
  tamY = 20 ;
  contador = 0;
  pantalla = 0; // Inicializa en pantalla 0
}

void draw() {

  contador++;
  println(frameCount / 2);

  if (pantalla == 0) {
    // Pantalla de inicio
    if (contador < 100) {
      image(fondoinicial, 0, 0, width, height);
      miVariable = frameCount / 2;
      image(pacman, miVariable, 30, 120, 100);
      textFont(fuenteNueva);
      textSize(textSizeValue);
      textAlign(100, 240);
      fill(200);

      text(elNombre, 100, 240);

      // Incrementar el tamaño del texto
      textSizeValue += 5;
      if (textSizeValue > 100) { // tamaño que quiero llegar
        textSizeValue = 100;
        pantalla = 1; // Cambio a segunda pantalla (imagen1)
      }
    }
  } else if (pantalla == 1) {
    // Pantalla 1 (imagen1)
    image(imagen1, 0, 0, width, height);
    textSize(15);
    fill(255);
    text("¿Cómo funciona el juego de Pac-Man?\nEl objetivo del personaje es comer todos los puntos de la pantalla,\nmomento en el que se pasa al siguiente nivel o pantalla.\nSin embargo, cuatro fantasmas o monstruos,\nShadow (Blinky), Speedy (Pinky), Bashful (Inky) y Pokey (Clyde),\nrecorren el laberinto para intentar capturar a Pac-Man.", 50, 100);
    miVariable = frameCount / 2;
    text("!!COMENCEMOS!!\nBuena suerte", miVariable, 450, 400);

    // Cambiar a la tercera pantalla después de un tiempo o condición
    if (contador >= 200) {
      pantalla = 2;
    }
  } else if (pantalla == 2) {
    // Pantalla 2 (imagen2)
    image(imagen2, 0, 0, width, height);
    image (pacman, posX, posY, tamX, tamY);
    if (keyPressed) {
      if (key == 'f') {
        posX = random(width) ;
      }
      if ( key == 's') {
        posY = random( height);
      }
    }
  }
  //boton para reinciar sketch
  fill (255);
  rect ( width/2 - 50, height -75, 400, 50); // lugar= en la parte inferior
  textSize (24);
  fill (0);
  textAlign( 500, 430);
  text ( "REINICIAR", width/2, height - 50); // parte inferior

  // logica para reinciar
  if ( mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height -75 && mouseY < height -25 &&mousePressed) {
    pantalla = 0 ; // vuelve a la pantalla de inicio
    tiempo = 0; // reinicia el tiempo
  }
}
