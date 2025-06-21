extends Node2D

var time : float

func _process(delta: float) -> void:
	time += delta
	var x_position = global_position.x
	var y_position = sin(time * 3) * 1
	
	global_position = Vector2(x_position, global_position.y + y_position)
	pass
