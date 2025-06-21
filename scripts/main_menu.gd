class_name Main_Menu extends CanvasLayer

static var ref: CanvasLayer

signal update_menu_state

var menu_state: menu_states
enum menu_states {MAIN_MENU,GAME_OVER,PAUSE,GAMEPLAY}

@onready var button_play: Button = %Button_Play
@onready var button_settings: Button = %Button_Settings


@onready var label_header: Label = %Label_Header
@onready var gameplay: Node2D = $"../Gameplay"
@onready var settings_panel: MarginContainer = %settings_panel


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
	settings_panel.visible = !settings_panel.visible
	pass

func _on_update_menu_state(state:menu_states) -> void:
	menu_state = state
	print("MENU STATE: ",str(menu_states.keys()[menu_state]))
	match menu_state:
		menu_states.GAMEPLAY:
			gameplay.visible = true
			visible = false
			if Player.ref != null:
				Player.ref.walk_state()
			#AudioManager.play_game()
		menu_states.MAIN_MENU:
			gameplay.visible = false
			label_header.text = "I'M WALKIN' HERE"
			visible = true
			#AudioManager.play_menu()
		menu_states.GAME_OVER:
			visible = true
			label_header.text = "WALK OVER"
			GameManager.finish_round()
			if Player.ref != null:
				Player.ref.idle_state()
		menu_states.PAUSE:
			visible = true
			label_header.text = "PAUSED"
			if Player.ref != null:
				Player.ref.stop_state()
		
	get_tree().paused = state == menu_states.PAUSE
