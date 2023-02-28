int rows = 6;
int cols = 7;
int res = 100;
int who = 1;
boolean end = false;
int[][] board = { 
                  {0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0},
                  {0,0,0,0,0,0,0}
                                   }; //address [row,col] == y,x
  
 
void setup(){
  size(800,800);
  noStroke();


}

void mouseClicked(){
  if(!(mouseX < 50 || mouseX >= 750)){ //clicking in buffer does nothing
    int col = floor((mouseX-50)/res);
    //println(col);
    
    for(int i=5; i>=0; i--){
      if(board[i][col] == 0){
        board[i][col] = who;
        checkWin(who);
        who *=-1;
        break;
      }
    }
  }
  
}

void checkWin(int player){
  //horizontal check
  for(int i=0; i<rows; i++){ //for every row
    for(int j=0; j<cols-3; j++){ //for every horizontal overlapping line in each row
      //if row is all same value
      if(board[i][j] == player && board[i][j+1] == player && board[i][j+2] == player && board[i][j+3] == player){
        println(player, "wins");
        end = true;
        break;
      }
    }
  }
  
  //vertical check
  for(int j=0; j<cols; j++){ //for every column
    for(int i=0; i<rows-3; i++){ //for every vertical overlapping line in each column
      //if column is all same value
      if(board[i][j] == player && board[i+1][j] == player && board[i+2][j] == player && board[i+3][j] == player){
        println(player, "wins");
        end = true;
        break;
      }
    }
  }

  //diagonal / check
  for(int i=3; i<rows; i++){ //for every row at least 4 from the top
    for(int j=0; j<cols-3; j++){ //for every diagonal overlapping line in each row
      //if column is all same value
      if(board[i][j] == player && board[i-1][j+1] == player && board[i-2][j+2] == player && board[i-3][j+3] == player){
        println(player, "wins");
        end = true;
        break;
      }
    }
  }

  //diagonal \ check
  for(int j=3; j<cols; j++){ //for every column
    for(int i=3; i<rows; i++){ //for every vertical overlapping line in each column
      //if column is all same value
      if(board[i][j] == player && board[i-1][j-1] == player && board[i-2][j-2] == player && board[i-3][j-3] == player){
        println(player, "wins");
        end = true;
        break;
      }
    }
  }
  
  //check draw
  boolean draw = true;
  for(int j=0; j<cols; j++){ 
    for(int i=0; i<rows; i++){
      if(board[i][j]== 0){
        draw = false;
        break;
      }
    }
  }
  if(draw){
    println("Draw"); 
    end = true;
  }
  
}

void draw(){
  background(200);
  
  //populate board
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      
      if(board[j][i] == 1){
        fill(255,0,0);
      }else if(board[j][i] == -1){
        fill(255,255,0);
      }else{ //board[j][i] == 0
        fill(255);
      }
      circle(50+i*res+res/2, 150+j*res+res/2, res*0.8);
    }
  }
  
  if(!end){
    //show next move
    if(!(mouseX < 50 || mouseX >= 750)){
      int col = floor((mouseX-50)/res);
      if(who == 1){
        fill(255,0,0,100);
      }else{ //who == -1
        fill(255,255,0,100);
      }
      circle(50+res*col+res/2, 0.8*res, res*0.8);
    }
  } else {
    noLoop();
  }
}
