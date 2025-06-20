class_name Main_Menu extends CanvasLayer

static var ref: CanvasLayer

signal update_menu_state

var menu_state: menu_states
enum menu_states {MAIN_MENU,GAME_OVER,PAUSE,GAMEPLAY}

@onready var button_play: Button = %Button_Play
@onready var button_settings: Button = %Button_Settings


@onready var label_header: Label = %Label_Header
@onready var gameplay: Node2D = $"../Gameplay"


func _init() -> void:
	ref = self

func _ready() -> void:
	button_play.pressed.connect(_on_play_pressed)
	button_settings.pressed.connect(_on_settings_pressed)
	update_menu_state.connect(_on_update_menu_state)
	update_menu_state.emit(menu_states.MAIN_MENU)

func _on_play_pressed() -> void:
	update_menu_state.emit(menu_states.GAMEPLAY)
	
func _on_settings_pressed() -> void:
	pass

func _on_update_menu_state(state:menu_states) -> void:
	menu_state = state
	print("MENU STATE: ",str(menu_states.keys()[menu_state]))
	match menu_state:
		menu_states.GAMEPLAY:
			gameplay.visible = true
			visible = false
		menu_states.MAIN_MENU:
			gameplay.visible = false
			label_header.text = "I'M WALKIN' HERE"
			visible = true
		menu_states.GAME_OVER:
			visible = true
			label_header.text = "WALK OVER"
		menu_states.PAUSE:
			visible = true
			label_header.text = "PAUSED"
		
	get_tree().paused = state == menu_states.PAUSE
