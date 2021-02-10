class Cover{
  int[][] cover = new int[40][30];
  
  Cover(){
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        cover[i][j] = 1;
      }
    }
  }
  
  void click(int x, int y, Board board){
    cover[x][y] = 0;
    
    if(board.getSquare(x, y) == 0){
      for(int i=-1; i<2; i++){
        for(int j=-1; j<2; j++){
          if(!(i+x<0 || i+x>=40 || y+j<0 || y+j>=30)){
            if(cover[x+i][y+j] == 1){
              click(x+i, y+j, board);
            }
          }
        }
      }
    }
  }
  
  void drawCover(){
    stroke(1);
    fill(100);
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        if(cover[i][j] == 1){
          square(i*20, j*20+100, 20);
        }
      }
    }
    noStroke();
  }
  
  
}
