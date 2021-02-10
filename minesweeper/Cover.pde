class Cover{
  int[][] cover = new int[40][30];
  
  Cover(){
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        cover[i][j] = 1;
      }
    }
  }
  
  int leftClick(int x, int y, Board board){
    cover[x][y] = 0;
    
    if(board.getSquare(x, y) == 0){
      for(int i=-1; i<2; i++){
        for(int j=-1; j<2; j++){
          if(!(i+x<0 || i+x>=40 || y+j<0 || y+j>=30)){
            if(cover[x+i][y+j] == 1){
              leftClick(x+i, y+j, board);
            }
          }
        }
      }
    } else if(board.getSquare(x, y) == 10) {
      return 2;
    }
    return 1;
  }
  
  void rightClick(int x, int y){
    if(cover[x][y] == 1){
      cover[x][y] = 2;
    } else if(cover[x][y] == 2){
      cover[x][y] = 1;
    }
  }
  
  void drawCover(){
    stroke(1);
    fill(100);
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        if(cover[i][j] != 0){
          fill(100);
          square(i*20, j*20+100, 20);
        }
        if (cover[i][j] == 2){
          fill(255, 0, 0);
          triangle(i*20+5, j*20+100+5, i*20+5, j*20+100+15, i*20+15, j*20+100+10);
        }
      }
    }
    noStroke();
  }
  
  int getSquare(int x, int y){
    return cover[x][y];
  }
  
  boolean isUnCovered(){
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        if(cover[i][j] == 1){
          return false;
        }
      }
    }
    return true;
  }
  
  
}
