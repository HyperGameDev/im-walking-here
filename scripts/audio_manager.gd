extends Node

@onready var menu_song: AudioStreamPlayer = $menu/menu_song
@onready var game_song: AudioStreamPlayer = $game/game_song

@onready var bird: Node = $bird
@onready var discord: Node = $discord


func _ready() -> void:
	pass


func play_menu() -> void:
	menu_song.play()


func play_game() -> void:
	game_song.play()


func play_bird(pos : Vector2) -> void:
	var birdNoise : AudioStreamPlayer2D = bird.get_children().pick_random()
	birdNoise.global_position = pos
	(birdNoise as AudioStreamPlayer2D).play()


func play_discord() -> void:
	var discordNoise : AudioStreamPlayer = discord.get_children().pick_random()
	discordNoise.play()
