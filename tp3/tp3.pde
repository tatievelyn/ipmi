// https://youtu.be/VTix0Y5R5kQ

PImage imagen;
int cant = 20;
int tam;
float ellipseSize = 17;
boolean alternateColorBW = false; // Variable para alternar entre negro/blanco en cada celda
boolean alternateColorRA = false; // Variable para alternar entre rojo/azul en cada celda
boolean reset = false; // Variable para detectar si se debe reiniciar el programa
int colorMode = 0; // Variable para alternar entre los modos de color

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
  drawGrid(imagen, cant, tam, ellipseSize, alternateColorBW, alternateColorRA, colorMode);
}

void mousePressed() {
  alternateColorBW = !alternateColorBW;
  alternateColorRA = false;
}

void keyPressed() {
  if (key == 'T' || key == 't') {
    alternateColorRA = !alternateColorRA; // Alternar rojo/azul y tamaño elipses
    alternateColorBW = false; // Asegurar que blanco/negro esté desactivado
  } else if (key == ' ') { // resetear con la barra espaciadora
    reset = true;
  } else if (key == 'C' || key == 'c') { // Alternar entre los modos de color
    colorMode = (colorMode + 1) % 3; // Alternar entre 0, 1 y 2
  }
}
