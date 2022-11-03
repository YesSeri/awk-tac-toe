#!/bin/awk
BEGIN {
	print "Welcome to Awk-Tac-Toe";
	is_player_1 = 1;
	 for (x = 1; x <= 9; x++){
		 board[x] = x;
	 }
	 print (board[1] == 2);
	for (x = 0; x <=2; x++){
		print(board[x*3+1], board[x*3+2], board[x*3+3])
	}

	player_1["name"] = "Hank";
	player_1["symbol"] = "x";

	player_2["name"] = "Hank";
	player_2["symbol"] = "o";

	print "It is player 1's turn! Let's go", player_1["name"], "!";
	print_board();
}  # Begin section
play_turn();
END { print "Thank you for playing." }     # End section

function play_turn(){
	if (is_gameover()){
		return 1;
	}
   	if(is_legal_input($1)){
		symbol = get_symbol();
		board[$1] = symbol;
		print_board();
		is_player_1 = !is_player_1 ;
	} else {
		print "Illegal move";
	}
	if (is_gameover()){
		print "GAME OVER";
	}
}

function is_legal_input(input){
	if (input in board){
		return 1;
	}
	return 0;
}
function print_board(){
	for (idx in board){
		printf board[idx]
		if (idx % 3 == 0) {
			printf "\n";
		}
	}
}

function get_name(){
	if(is_player_1){
		return player_1["name"];
	} else {
		return player_2["name"]l
	}
}

function get_symbol(){
	if(is_player_1){
		return player_1["symbol"];
	} else {
		return player_2["symbol"]l
	}
}

function is_gameover(){
	if (check_symbol_gameover("x") || check_symbol_gameover("o")){
		return 1;
	} else{
		return 0;
	}
}
function check_symbol_gameover(symbol){
	# Horizontal check
	if (symbol == board[1] && symbol == board[2] && symbol == board[3]){
		return 1;
	}
	if (symbol == board[4] && symbol == board[5] && symbol == board[6]){
		return 1;
	}
	if (symbol == board[7] && symbol == board[8] && symbol == board[9]){
		return 1;
	}

	# Vertical check
	if (symbol == board[1] && symbol == board[4] && symbol == board[7]){
		return 1;
	}
	if (symbol == board[2] && symbol == board[5] && symbol == board[8]){
		return 1;
	}
	if (symbol == board[3] && symbol == board[6] && symbol == board[9]){
		return 1;
	}

	# Diagonal check
	if (symbol == board[1] && symbol == board[5] && symbol == board[9]){
		return 1;
	}
	if (symbol == board[3] && symbol == board[5] && symbol == board[7]){
		return 1;
	}
	return 0;

}


