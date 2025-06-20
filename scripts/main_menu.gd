class_name Main_Menu extends CanvasLayer

static var ref: CanvasLayer

signal update_menu_state

var menu_state: menu_states
enum menu_states {MAIN_MENU,GAME_OVER,PAUSE,GAMEPLAY}

@onready var button_play: Button = %Button_Play
@onready var label_header: Label = %Label_Header


func _init() -> void:
	ref = self

func _ready() -> void:
	button_play.pressed.connect(_on_play_pressed)
	update_menu_state.connect(_on_update_menu_state)
	
func _on_play_pressed() -> void:
	update_menu_state.emit(menu_states.GAMEPLAY)
	
func _on_update_menu_state(state:menu_states) -> void:
	menu_state = state
	
	match menu_state:
		menu_states.GAMEPLAY:
			visible = false
		menu_states.MAIN_MENU:
			label_header.text = "I'M WALKIN' HERE"
			visible = true
		menu_states.GAME_OVER:
			visible = true
			label_header.text = "WALK OVER"
		menu_states.PAUSE:
			visible = true
			label_header.text = "PAUSED"
		
	get_tree().paused = state == menu_states.PAUSE
			
