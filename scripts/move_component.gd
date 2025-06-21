extends Node2D

@export var parent : Node2D

func _ready() -> void:
	parent.z_index += 10

func _process(delta: float) -> void:
	parent.global_position.x -= delta * 50
	parent.global_position.y += delta * 10
