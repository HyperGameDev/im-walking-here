extends Node

@onready var menu_song: AudioStreamPlayer = $menu/menu_song
@onready var game_song: AudioStreamPlayer = $game/game_song

@onready var bird: Node = $bird
@onready var discord: Node = $discord


func _ready() -> void:
	pass


func play_menu() -> void:
	if OS.is_debug_build():
		return
	menu_song.play()
	game_song.stop()


func play_game() -> void:
	if OS.is_debug_build():
		return
	game_song.play()
	menu_song.stop()


func play_bird(pos : Vector2) -> void:
	if OS.is_debug_build():
		return
	var birdNoise : AudioStreamPlayer2D = bird.get_children().pick_random()
	birdNoise.global_position = pos
	(birdNoise as AudioStreamPlayer2D).play()


func play_discord(pos : Vector2) -> void:
	if OS.is_debug_build():
		return

	var discordNoise : AudioStreamPlayer2D = discord.get_children().pick_random()
	discordNoise.global_position = pos
	(discordNoise as AudioStreamPlayer2D).play()
