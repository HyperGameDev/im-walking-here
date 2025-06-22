extends Node

var happiness_factor : float = .3
var happiness_bonus : float = 20.
var score_cost: float = 1500.
var score_cost_mult: float = 30.
var score : int = 0
var score_mult : float = 10.
const ROUND_LENGTH: float = 60.
		
func restart_game() -> void:
	reset_vals()
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")

func reset_vals() -> void:
	score = 0
 
func finish_round() -> void:
	if score > SaveGame.Highscore:
		SaveGame.Highscore = score
		SaveGame.save_game()
		
	Main_Menu.ref.label_footer.text = "HIGH SCORE: " + str(SaveGame.Highscore)
