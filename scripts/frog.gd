extends Node2D

var time : float
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _process(delta: float) -> void:
	time += delta
	var x_position : float = global_position.x
	var y_position : float = sin(time * 3) * 1
	
	global_position = Vector2(x_position, global_position.y + y_position)

func _on_item_clicked() -> void:
	audio_stream_player_2d.play()
	
