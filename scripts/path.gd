class_name Path extends Path2D

static var ref: Path2D

var round_length: float = 180.:
	set(value):
		round_length = value
		UI.ref.update_score()

@onready var player: PathFollow2D = $Player

func _init() -> void:
	ref = self

func _ready() -> void:
	Main_Menu.ref.update_menu_state.connect(_on_update_menu_state)
	
func _on_update_menu_state(state: Main_Menu.menu_states) -> void:
	if state == Main_Menu.ref.menu_states.PRE_GAMEPLAY:
		begin_walking()
		
func begin_walking() -> void:
	print("is walking()")
	var tween: Tween = create_tween()
	tween.parallel().tween_property(player,"progress_ratio",1.0,round_length)
	tween.parallel().tween_property(self,"round_length",0.,round_length)
	
	tween.finished.connect(_on_path_tween_finished)
	
func _on_path_tween_finished() -> void:
	Main_Menu.ref.update_menu_state.emit(Main_Menu.ref.menu_states.GAME_OVER)
