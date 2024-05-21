//evelyn tatiana montenegro
//comision 2

PImage mipaisaje ;

void setup() {
  size (800, 400);
  mipaisaje   = loadImage("mipaisaje.png");
}

void draw() {
  background(#E3F4FF);
  image(mipaisaje, 0, 0, 400, 400);
  fill(#C4BCA4);
  rect(400, 260, 800, 400);
  fill(#1CBCEA);
  noStroke();
  triangle(400, 260, 800, 320, 800, 260);
  fill(#A3D9FC);
  noStroke();
  rect(400, 100, 400, 100 );
  fill(#47AFF2);
  noStroke();
  rect(400, 0, 400, 100);
  stroke(0);
  fill(#349B4C);
  curve(400, 800, 400, 260, 700, 260, 400, 400);
}
