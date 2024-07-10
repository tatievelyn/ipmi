// ALUMNO: Montenegro Evelyn Tatiana
// DOCENTE: Matias Jauregui Lorda
// COMISION 2

String elNombre;
int xBoton, yBoton;
int pantalla, tiempo, suma;
float textSizeValue = 5;
float miVariable = 30;
int contador;
float posX, posY, tamX, tamY;
PFont fuenteNueva;
PImage fondoinicial; // pantalla1
PImage imagen1; // pantalla2
PImage imagen2; // pantalla3
PImage pacman; // Pacman en movimiento

void setup() {
  size(640, 480);
  elNombre = "PACMAN";
  // Cargo mis imágenes una sola vez
  fondoinicial = loadImage("imagen1.jpg");
  imagen1 = loadImage("imagen2.png");
  imagen2 = loadImage("imagen3.jpg");
  pacman = loadImage("pacman.jpg"); // Cargar la imagen del Pacman
  fuenteNueva = createFont("Tahoma", 15);
  posX = 0;
  posY = 30;
  tamX = 60; // Tamaño del Pacman en la primera pantalla
  tamY = 60; // Tamaño del Pacman en la primera pantalla
  contador = 0;
  pantalla = 0;
  xBoton = width - 110;
  yBoton = height - 55;
}

void draw() {
  contador++;
  println(frameCount / 60);

  if (pantalla == 0) {
    // Pantalla de inicio
    tiempo = 30 * 60; // 30 segundos en frames
    if (contador < tiempo) {
      image(fondoinicial, 0, 0, width, height);
      miVariable += 1; // Incrementar la variable para el movimiento
      image(pacman, miVariable % (width + tamX), posY, tamX, tamY);
      textFont(fuenteNueva);
      textSize(textSizeValue);
      textAlign(CENTER, CENTER);
      fill(200);
      text(elNombre, width / 2, height / 2);
      // Incrementar el tamaño del texto
      if (textSizeValue < 100) {
        textSizeValue += 0.1;
      }
    } else {
      pantalla = 1;
      contador = 0;
    }
  } else if (pantalla == 1) {
    // Pantalla 1 (imagen1)
    tiempo = 30 * 60; // 30 segundos en frames
    if (contador < tiempo) {
      image(imagen1, 0, 0, width, height);
      textSize(15);
      fill(255);
      textAlign(LEFT, TOP);
      text("¿Cómo funciona el juego de Pac-Man?\nEl objetivo del personaje es comer todos los puntos de la pantalla,\nmomento en el que se pasa al siguiente nivel o pantalla.\nSin embargo, cuatro fantasmas o monstruos,\nShadow (Blinky), Speedy (Pinky), Bashful (Inky) y Pokey (Clyde),\nrecorren el laberinto para intentar capturar a Pac-Man.", 20, 20);
      miVariable = frameCount / 2;
      textAlign(CENTER, CENTER);
      text("¡¡COMENCEMOS!!\nBuena suerte", miVariable % width, height - 50);
    } else {
      pantalla = 2;
      contador = 0;
    }
  } else if (pantalla == 2) {
    // Pantalla 2 (imagen2)
    tiempo = 30 * 60; // 30 segundos en frames
    if (contador < tiempo) {
      image(imagen2, 0, 0, width, height);
      tamX = 20; // Tamaño del Pacman en la tercera pantalla
      tamY = 20; // Tamaño del Pacman en la tercera pantalla
      image(pacman, constrain(posX, tamX / 2, width - tamX / 2), constrain(posY, tamY / 2, height - tamY / 2), tamX, tamY); // Mostrar Pacman en pantalla 2
      textAlign(CENTER, CENTER);
      text("Posición X: " + posX + "\nPosición Y: " + posY, width / 2, height - 50);
    }
  }

  if (pantalla >= 1) {
    fill(255);
    rectMode(CENTER);
    rect(xBoton, yBoton, 100, 50);
    textSize(15);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Reiniciar", xBoton, yBoton);
  }
}

void mouseClicked() {
  // Verificar si se hizo clic dentro del botón
  if (pantalla >= 1 && mouseX > xBoton - 50 && mouseX < xBoton + 50 && mouseY > yBoton - 25 && mouseY < yBoton + 25) {
    textSizeValue = 5;
    suma = 0;
    contador = 0;
    pantalla = 0;
    tiempo = 0;
    frameCount = 0;
    println("¡Clic en el botón!");
  }
}

void keyPressed() {
  // Movimiento del Pacman con teclas 'F' y 'S'
  if (pantalla == 2) {
    if (key == 'f') {
      posX += 5; // Mover hacia la derecha
    }
    if (key == 's') {
      posY += 5; // Mover hacia abajo
    }
  }
}
