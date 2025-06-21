extends PathFollow2D
class_name Player

static var ref : Player

func _init() -> void:
	ref = self

@onready var player_sprites: AnimatedSprite2D = $Player_Sprites

func stop_state() -> void:
	player_sprites.stop_play()

func idle_state() -> void:
	player_sprites.play_idle()


func walk_state() -> void:
	player_sprites.play_walk()
