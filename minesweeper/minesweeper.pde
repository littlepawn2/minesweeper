
Board board = new Board();
Cover cover = new Cover();
int gameState = 1; //1-running 2-dead

void setup(){
  size(800, 700);
  noStroke();
  textAlign(CENTER, CENTER);
}


void draw(){
  board.drawBoard();
  cover.drawCover();
  
  if(cover.isUnCovered()){
    board.drawBoard();
    textSize(50);
     fill(255);
    if(board.checkLost(cover)){
      text("YOU LOST", 400, 350);
    } else {
      text("YOU WON", 400, 350);
    }
    noLoop();
  }
  
  if(gameState == 2){
    textSize(50);
    fill(255);
    text("GAME OVER", 400, 350);
    noLoop();
  }
  
}

void mousePressed(){
  if (mouseButton == LEFT)
    gameState = cover.leftClick((int)mouseX/20, (int)(mouseY-100)/20, board);
  if (mouseButton == RIGHT)
    cover.rightClick((int)mouseX/20, (int)(mouseY-100)/20);
}
