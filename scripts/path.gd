extends Path2D

@onready var player: PathFollow2D = $Player

func _ready() -> void:
	Main_Menu.ref.update_menu_state.connect(_on_update_menu_state)
	
func _on_update_menu_state(state) -> void:
	if state == Main_Menu.ref.menu_states.GAMEPLAY:
		begin_walking()
		
func begin_walking() -> void:
	print("is walking()")
	var tween: Tween = create_tween()
	tween.tween_property(player,"progress_ratio",1.0,180.0)
