void drawGrid(PImage img, int cells, int cellSize, float ellSize, boolean altColorBW, boolean altColorRA, int colorMode) {
  image(img, 0, 0, 400, 400);
  translate(width / 2, 0);

  for (int i = 0; i < cells; i++) {
    for (int j = 0; j < cells; j++) {
      // Determina el tamaño de la elipse
      float currentEllipseSize = ellSize;
      if (altColorRA) {
        float distance = dist(mouseX, mouseY, width / 2 + i * cellSize + cellSize / 2, j * cellSize + cellSize / 2);
        currentEllipseSize = map(distance, 0, dist(0, 0, width, height), 5, 50);
      }

      // Obtener los colores de la celda
      color squareColor = getCellColor(i, j, altColorBW, altColorRA, colorMode, true);
      color ellipseColor = getCellColor(i, j, altColorBW, altColorRA, colorMode, false);

      fill(squareColor);
      rect(i * cellSize, j * cellSize, cellSize, cellSize);

      fill(ellipseColor);
      ellipse(i * cellSize + cellSize / 2, j * cellSize + cellSize / 2, currentEllipseSize, currentEllipseSize);
    }
  }
}

color getCellColor(int i, int j, boolean altColorBW, boolean altColorRA, int colorMode, boolean isSquare) {
  if (colorMode == 0) { // blanco y negro
    if (altColorBW) {
      return ((i + j) % 2 == 0) == isSquare ? color(255) : color(0);
    } else {
      return ((i + j) % 2 == 0) == isSquare ? color(0) : color(255);
    }
  } else if (colorMode == 1 || altColorRA) { // rojo y azul
    if (altColorRA) {
      return ((i + j) % 2 == 0) == isSquare ? color(255, 0, 0) : color(0, 0, 255);
    } else {
      return ((i + j) % 2 == 0) == isSquare ? color(255) : color(0);
    }
  } else { // Colores aleatorios
    if (isSquare) {
      return color(random(255), random(255), random(255));
    } else {
      color squareColor = getCellColor(i, j, altColorBW, altColorRA, colorMode, true);
      return color(255 - red(squareColor), 255 - green(squareColor), 255 - blue(squareColor));
    }
  }
}

void resetProgram() {
  // Restablece las variables a su estado inicial
  ellipseSize = 17;
  alternateColorBW = false;
  alternateColorRA = false;
  colorMode = 0;
}
