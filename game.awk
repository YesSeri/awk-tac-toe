#!/bin/awk
BEGIN {
	print "AAA";
	is_player_1 = true;
	for (x = 1; x <= 9; x++)
		board[x] = x 
	print is_player_1;
}  # Begin section
play_turn();
print_board();
END { print "Thank you for playing." }     # End section

function play_turn(){
	if(is_legal_input($1)){
		print "legal move";
	} else {
		print "illegal move. square not available";
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
