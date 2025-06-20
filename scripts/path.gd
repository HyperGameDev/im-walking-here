extends Path2D

func _ready() -> void:
	Main_Menu.ref.update_menu_state.connect(_on_update_menu_state)
	
func _on_update_menu_state(state) -> void:
	if state == Main_Menu.ref.menu_states.GAMEPLAY:
		#begin_walking()
		pass
