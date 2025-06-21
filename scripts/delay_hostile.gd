extends Node2D

@export var parent : WorldEntity

var TimerMax : float = randf_range(1,10)
var time : float = TimerMax



func TimerCount(InDelta: float) -> void:
	if time > 0:
		time -= InDelta
	else:
		enable_parent()
		queue_free()


func _process(delta: float) -> void:
	TimerCount(delta)

func enable_parent() -> void:
	parent.show_bird()
