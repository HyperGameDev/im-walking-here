class_name Path extends Path2D

static var ref: Path2D

var round_length: float = 180.

@onready var player: PathFollow2D = $Player

func _init() -> void:
	ref = self

func _ready() -> void:
	Main_Menu.ref.update_menu_state.connect(_on_update_menu_state)
	
func _on_update_menu_state(state) -> void:
	if state == Main_Menu.ref.menu_states.GAMEPLAY:
		begin_walking()
		
func begin_walking() -> void:
	print("is walking()")
	var tween: Tween = create_tween()
	tween.parallel().tween_property(player,"progress_ratio",1.0,round_length)
	tween.parallel().tween_property(self,"round_length",0.,round_length)
