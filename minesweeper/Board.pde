class Board{
  
  int[][] grid = new int[40][30];
  
  Board(){
    //initialize a random grid of mines
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        
        if(random(0, 1) > 0.9){
          grid[i][j] = 10;
        } else {
          grid[i][j] = 0;
        }
        
      }
    }
    //fill the empty squares based on num of mines around it
    int count;
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        
        if(grid[i][j] != 10){
          count = 0; 
          for(int x=-1; x<2; x++){
            for(int y=-1; y<2; y++){
              if(i+x >= 0 && i+x < 40 && j+y >= 0 && j+y < 30 ){
                //own coord is always not a mine, no need to account for it
                if(grid[i+x][j+y] == 10){
                  count += 1;
                }
              }
              
            }
          }
          grid[i][j] = count;
        }
        
      }
    }
    
  }
  
  void drawBoard(){
    for(int i=0; i<40; i++){
      for(int j=0; j<30; j++){
        //get right colour
        switch(grid[i][j]) {
          case 1:
            fill(color(100, 100, 255));
            break;
          case 2:
            fill(color(100, 255, 100));
            break;
          case 3:
            fill(color(150, 0, 150));
            break;
          case 4:
            fill(color(0, 0, 100));
            break;
          case 10:
            fill(color(255, 50, 50));
            break;
          default:
            fill(color(255, 255, 255));
            break;
        }
        //draw number or mine
        if(grid[i][j] == 10){
          circle(i*20+5, j*20+100-5, 10);
        } else {
          text(grid[i][j], i*20, j*20+100);
        }
      }
    }
  }
  
  
  
}
