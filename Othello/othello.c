//***************************************************
// Filename: othello.c
//
// Author: Matt Doan and Jacob Schafer
//***************************************************

#include "othello.h"
bool isValidMoveUp(char board[][SIZE], int row, int col, char disc);
bool isValidMoveUpLeft(char board[][SIZE], int row, int col, char disc);
bool isValidMoveUpRight(char board[][SIZE], int row, int col, char disc);
bool isValidMoveDown(char board[][SIZE], int row, int col, char disc);
bool isValidMoveDownLeft(char board[][SIZE], int row, int col, char disc);
bool isValidMoveRight(char board[][SIZE], int row, int col, char disc);
bool isValidMoveLeft(char board[][SIZE], int row, int col, char disc);
bool isValidMoveDownRight(char board[][SIZE], int row, int col, char disc);

// Displays the board (as SIZE x SIZE grid) on console
void displayBoard(char board[][SIZE]) {
	printf("\n");
	for (int i = 0; i < SIZE; i++) {
		printf((i == 0 ? "%5d" : "%3d"), i+1);
	}
	printf("\n");

	for (int i = 0; i < SIZE; i++) {
		printf("%2d", i+1);
		for (int j = 0; j < SIZE; j++) {
			printf("%3c", board[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}

// Initializes the board with start configuration of discs (see project specs)
void initializeBoard(char board[][SIZE])
{
	for(int j  = 0; j<SIZE; j++){
		for(int i = 0; i<SIZE; i++){
			board[j][i] = EMPTY;
		}
	}
	board[3][3] = BLACK;
	board[4][3] = WHITE;
	board[4][4]	= BLACK;
	board[3][4] = WHITE;
}



char oppColor(char ghost){
	if (ghost == WHITE){return BLACK;}
	else if (ghost == BLACK){return WHITE;}
	return EMPTY;
}

// Returns true if moving the disc to location row,col is valid; else returns false
bool isValidMove(char board[][SIZE], int row, int col, char disc){


	//printf("%c\n",disc);
	if (isValidMoveUp(board,row,col,disc)){
		printf("%s\n","UP");
		return true;
	}
	if (isValidMoveDown(board,row,col,disc)){
		printf("%s\n","DOWN");
		return true;
	}
	if (isValidMoveRight(board,row,col,disc)){
		printf("%s\n","RIGHT");
		return true;
	}
	if (isValidMoveLeft(board,row,col,disc)){
		printf("%s\n","LEFT");
		return true;
	}
	if (isValidMoveUpLeft(board,row,col,disc)){
		printf("%s\n","UPLEFT");
		return true;
	}
	if (isValidMoveUpRight(board,row,col,disc)){
		printf("%s\n","UPRIGHT");
		return true;
	}
	if (isValidMoveDownLeft(board,row,col,disc)){
		printf("%s\n","DOWNLEFT");
		return true;
	}
	if (isValidMoveDownRight(board,row,col,disc)){
		printf("%s\n","DOWNRIGHT");
		return true;
	}


	if(isValidMoveUp(board, row, col ,disc) || isValidMoveUpRight(board, row, col ,disc) || isValidMoveRight(board, row, col ,disc) || isValidMoveDown(board, row, col ,disc) || isValidMoveDownLeft(board, row, col ,disc) || isValidMoveUpLeft(board, row, col ,disc) || (isValidMoveLeft(board, row, col ,disc)) || (isValidMoveDownRight(board,row,col,disc))){return true;}
	else{return false;}


}









bool isValidMoveUp(char board[][SIZE], int row, int col, char disc){
	if (col>1 && board[row][col-1]==oppColor(disc)){
		for (int j=col-2;j>=0;j--){
			if (board[row][j]==disc){return true;}
			if (board[row][j]==EMPTY){return false;}
		}
	}
	return false;
}
//upright
bool isValidMoveUpRight(char board[][SIZE], int row, int col, char disc){
	if (row<SIZE-2 && col < SIZE-2 && board[row+1][col+1]==oppColor(disc)){
		int j = col+2;
		for (int i = row+2; i<SIZE && j<SIZE;i++){
			if (board[i][j]==disc){return true;}
			if (board[i][j]==EMPTY){return false;}
			j++;
		}
	}
	return false;
}


//right
bool isValidMoveRight(char board[][SIZE], int row, int col, char disc){
	if (row<SIZE-2 && board[row+1][col]==oppColor(disc)){
		for (int i=row+2;i<SIZE;i++){
			if (board[i][col]==disc){return true;}
			if (board[i][col]==EMPTY){return false;}
		}
	}
	return false;
}

//botright works
bool isValidMoveDownRight(char board[][SIZE], int row, int col, char disc){
	if (row<SIZE-2 && col >1 && board[row+1][col-1]==oppColor(disc)){
		int j = col-2;
		for (int i = row+2; i<SIZE && j>=0;i++){
			if (board[i][j]==disc){return true;}
			if (board[i][j]==EMPTY){return false;}
			j--;
		}
	}
	return false;
}

bool isValidMoveDown(char board[][SIZE], int row, int col, char disc){
	if (col<SIZE-2 && board[row][col+1]==oppColor(disc)){
		for (int j=col+2;j<SIZE;j++){
			if (board[row][j]==disc){return true;}
			if (board[row][j]==EMPTY){return false;}
		}
	}
	return false;
}
//downleft
bool isValidMoveDownLeft(char board[][SIZE], int row, int col, char disc){
	if (row>1 && col >1 && board[row-1][col-1]==oppColor(disc)){
		int j = col-2;
		for (int i = row-2; i>=0 && j>=0;i--){
			if (board[i][j]==disc){return true;}
			if (board[i][j]==EMPTY){return false;}
			j--;
		}
	}
	return false;
}
//upleft works
bool isValidMoveUpLeft(char board[][SIZE], int row, int col, char disc){
	if (row>1 && col < SIZE-2 && board[row-1][col+1]==oppColor(disc)){
		int j = col+2;
		for (int i = row-2; i>=0 && j<SIZE;i--){
			if (board[i][j]==disc){return true;}
			if (board[i][j]==EMPTY){return false;}
			j++;
		}
	}
	return false;
}


bool isValidMoveLeft(char board[][SIZE], int row, int col, char disc){
	if (row>1 && board[row-1][col]==oppColor(disc)){
		for (int i=row-2;i>=0;i--){
			if (board[i][col]==disc){return true;}
			if (board[i][col]==EMPTY){return false;}
		}
	}
	return false;
}

// Places the disc at location row,col and flips the opponent discs as needed
void placeDiscAt(char board[][SIZE], int row, int col, char disc) {
	printf("%s %d %d\n","Starting place at ",row,col);

	if (isValidMove(board,row,col,disc)){board[row][col]=disc;}

	if (isValidMoveUp(board, row, col, disc)) {
		for (int j=col-1;board[row][j]==oppColor(disc);j--){
			printf("%s\n", "up");
			board[row][j]=disc;
		}
  	}
	//down
	if (isValidMoveDown(board, row, col, disc)) {
		for (int j=col+1;board[row][j]==oppColor(disc);j++){
			printf("%s\n", "down");
			board[row][j]=disc;
		}
	}
	//left
	if (isValidMoveLeft(board, row, col, disc)) {
		for (int i=row-1;board[i][col]==oppColor(disc);i--){
			printf("%s\n", "left");
			board[i][col]=disc;
		}
	}
	//right
	if (isValidMoveRight(board, row, col, disc)) {
		for (int i=row+1;board[i][col]==oppColor(disc);i++){
			printf("%s\n", "right");
			board[i][col]=disc;
		}
	}
	if (isValidMoveDownRight(board, row, col, disc)){
		int j=col-1;
		for (int i=row+1;board[i][j]==oppColor(disc);i++){
			printf("%s\n", "UR");
			board[i][j]=disc;
			j--;
		}
	}

	if (isValidMoveUpLeft(board, row, col, disc)){
		int j=col+1;
		for (int i=row-1;board[i][j]==oppColor(disc);i--){
			printf("%s\n", "DL");
			board[i][j]=disc;
			j++;
		}
	}
	//this one is correct
	if (isValidMoveUpRight(board, row, col, disc)){
		int j=col+1;
		for (int i=row+1;board[i][j]==oppColor(disc);i++){
			printf("%s\n", "DR");
			j++;
		}
	}
//correct
	if (isValidMoveDownLeft(board, row, col, disc)){
		int j=col-1;
		for (int i=row-1;board[i][j]==oppColor(disc);i--){
			board[i][j]=disc;
			j--;
		}
	}
}


// Returns true if a valid move for disc is available; else returns false
bool isValidMoveAvailable(char board[][SIZE], char disc){
	for (int i = 0; i<SIZE; i++){
		for (int j = 0; j<SIZE; j++){
			if (isValidMove(board, i, j, disc)){
				return true;
			}
		}
	}
	return false;
}
// Returns true if the board is fully occupied with discs; else returns false
bool isBoardFull(char board[][SIZE])
{
	for(int j  = 0; j<SIZE; j++) {
		for (int i = 0; i < SIZE; i++) {
			if (board[j][i] == EMPTY) {
				return false;
			}
		}
	}
	return true;
}

// Returns true if either the board is full or a valid move is not available for either disc
bool isGameOver(char board[][SIZE])
{
	if (isBoardFull(board)){return true;}
	if (!isValidMoveAvailable(board, WHITE) && !isValidMoveAvailable(board, BLACK)){printf("test"); return true;}
	return false;}

	// If there is a winner, it returns the disc (BLACK or WHITE) associated with the winner.
	// In case of a tie, it returns EMPTY
	char checkWinner(char board[][SIZE]){
		int blackPoints = 0;
		int whitePoints = 0;
		for(int j  = 0; j<SIZE; j++) {
			for (int i = 0; i < SIZE; i++) {
				if (board[j][i] == BLACK) {
					blackPoints++;
				}
				if (board[j][i] == WHITE) {
					whitePoints++;
				}
			}
		}
		if(blackPoints > whitePoints){
			return BLACK;
		}
		else{return WHITE;}
	}
