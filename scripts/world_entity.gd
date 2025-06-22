extends Node2D
class_name WorldEntity


func _ready() -> void:
	if get_child_count() < 2:
		process_mode = Node.PROCESS_MODE_DISABLED
	for i : Node in get_children(): 
		if i is Bird:
			i.visible = false
	for b : Node in get_children(): 
		if b is Button:
			b.visible = false

func show_bird() -> void:
	for i : Node in get_children(): 
		if i is Bird:
			i.visible = true
	for b : Node in get_children(): 
		if b is Button:
			b.visible = true

func _on_item_clicked() -> void:
	if !get_child_count() > 2:
		return
	for i : Node in get_children(): 
		if i is Bird:
			if i.visible == false:
				return
			i.queue_free()
			UI.ref.increase_happiness(GameManager.happiness_bonus)
			
	for b : Node in get_children(): 
		if b is Button:
			b.queue_free()
