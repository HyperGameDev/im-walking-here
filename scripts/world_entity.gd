extends Node2D

func _ready() -> void:
	if get_child_count() < 2:
		process_mode = Node.PROCESS_MODE_DISABLED

func _on_item_clicked() -> void:
	print("it happened")
	pass
