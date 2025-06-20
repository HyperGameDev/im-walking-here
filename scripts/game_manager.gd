extends Node

var score : float = 0
var score_mult : float = 1.:
	get:
		return score_mult
	set(val):
		if score_mult != val:
			score_mult = val
		score_mult = clampf(score_mult, 0.1, 2)

func reset_vals() -> void:
	score = 0
	score_mult = 1.

func finish_round() -> void:
	if score > SaveGame.Highscore:
		SaveGame.Highscore = score
		SaveGame.save_game()
	
	reset_vals()
