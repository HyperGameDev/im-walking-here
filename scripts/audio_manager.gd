extends Node

@onready var menu: Node = $menu
@onready var game: Node = $game
@onready var bird: Node = $bird
@onready var discord: Node = $discord


func _ready() -> void:
	pass


func play_menu() -> void:
	
	pass

func play_game() -> void:
	
	pass

func play_bird(pos : Vector2) -> void:
	var birdNoise : AudioStreamPlayer2D = bird.get_children().pick_random()
	birdNoise.global_position = pos
	(birdNoise as AudioStreamPlayer2D).play()


func play_discord() -> void:
	
	pass
