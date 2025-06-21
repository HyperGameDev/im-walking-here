extends Node2D


func _ready() -> void:
	if get_child_count() < 2:
		process_mode = Node.PROCESS_MODE_DISABLED

func _on_item_clicked() -> void:
	if !get_child_count() > 2:
		return
	
	for i : Node in get_children(): 
		if i is Bird:
			i.queue_free()
