
Board board = new Board();
Cover cover = new Cover();

void setup(){
  size(800, 700);
  noStroke();
  textAlign(CENTER, CENTER);
}


void draw(){
  board.drawBoard();
  cover.drawCover();
  
  
}

void mousePressed(){
  cover.click((int)mouseX/20, (int)(mouseY-100)/20, board);
}
