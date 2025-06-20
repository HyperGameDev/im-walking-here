extends Node

var score : float = 0
var score_mult : float = 1.

func reset_vals() -> void:
	score = 0
	score_mult = 1.

func finish_round() -> void:
	if score > SaveGame.Highscore:
		SaveGame.Highscore = score
		SaveGame.save_game()
	
	reset_vals()
