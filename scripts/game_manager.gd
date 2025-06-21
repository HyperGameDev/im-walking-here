extends Node

var happiness_factor : float = .1
var score : int = 0
var score_mult : float = 10.
	#get:
		#return score_mult
	#set(val):
		#if score_mult != val:
			#if score_mult > 0.:
				#score_mult = val
		##score_mult = clampf(score_mult, 0.1, 2)
		
func restart_game() -> void:
	reset_vals()
	
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")

func reset_vals() -> void:
	score = 0
	#score_mult = 1.

func finish_round() -> void:
	if score > SaveGame.Highscore:
		SaveGame.Highscore = score
		SaveGame.save_game()
		
	Main_Menu.ref.label_footer.text = "HIGH SCORE: " + str(SaveGame.Highscore)
