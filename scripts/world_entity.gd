extends Node2D
class_name WorldEntity


func _ready() -> void:
	if get_child_count() < 2:
		process_mode = Node.PROCESS_MODE_DISABLED
	for i : Node in get_children(): 
		if i is Bird:
			i.visible = false

func show_bird() -> void:
	for i : Node in get_children(): 
		if i is Bird:
			i.visible = true

func _on_item_clicked() -> void:
	if !get_child_count() > 2:
		return
	for i : Node in get_children(): 
		if i is Bird:
			i.queue_free()
