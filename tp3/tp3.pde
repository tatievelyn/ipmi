// https://youtu.be/dX2EdDFm3M0

PImage imagen;
int cant = 20;
int tam;
float ellipseSize = 17;
boolean alternateColorBW = false; // Variable para alternar entre negro/blanco en cada celda
boolean alternateColorRA = false; // Variable para alternar entre rojo/azul en cada celda
boolean reset = false; // Variable para detectar si se debe reiniciar el programa

void setup() {
  size(800, 400);
  imagen = loadImage("imagen.png");
  tam = width / cant;
}

void draw() {
  if (reset) {
    resetProgram();
    reset = false;
  }
  drawGrid();
}

void mousePressed() {
  ellipseSize = map(mouseY, 0, height, 2, 30);
  alternateColorBW = !alternateColorBW;
  alternateColorRA = false;
}

void keyPressed() {
  if (key == 'T' || key == 't') {
    alternateColorRA = !alternateColorRA;
    alternateColorBW = false;
  } else if (key == ' ') { // resetear con la barra espaciadora
    reset = true;
  }
}

void drawGrid() {
  image(imagen, 0, 0, 400, 400);
  translate(width / 2, 0);
  for (int i = 0; i < cant; i++) {
    for (int j = 0; j < cant; j++) {
      // Determina el color de fondo de la celda
      if (alternateColorBW) {
        if ((i + j) % 2 == 0) {
          fill(255);
        } else {
          fill(0);
        }
      } else {
        if ((i + j) % 2 == 0) {
          fill(0);
        } else {
          fill(255);
        }
      }
      rect(i * tam, j * tam, tam, tam);
      // Determina el color de la elipse basado en la alternancia elegida
      if (alternateColorBW) {
        if ((i + j) % 2 == 0) {
          fill(0);
        } else {
          fill(255);
        }
      } else if (alternateColorRA) {
        if ((i + j) % 2 == 0) {
          fill(255, 0, 0);
        } else {
          fill(0, 0, 255);
        }
      } else {
        if ((i + j) % 2 == 0) {
          fill(255);
        } else {
          fill(0);
        }
      }
      ellipse(i * tam + tam / 2, j * tam + tam / 2, ellipseSize, ellipseSize);
    }
  }
}

void resetProgram() {
  // Restablece las variables a su estado inicial
  ellipseSize = 17;
  alternateColorBW = false;
  alternateColorRA = false;
}
