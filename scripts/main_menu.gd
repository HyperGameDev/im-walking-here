class_name Main_Menu extends CanvasLayer

static var ref: CanvasLayer

signal update_menu_state

var menu_state: menu_states
enum menu_states {MAIN_MENU,GAME_OVER,PAUSE,PRE_GAMEPLAY,GAMEPLAY}

@onready var menu_bg: Node2D = %Menu_BG
@onready var label_footer: Label = %Label_Footer

@onready var button_play: Button = %Button_Play
@onready var button_settings: Button = %Button_Settings
@onready var button_continue: Button = %Button_Continue
@onready var button_replay: Button = %Button_Replay
@onready var player: AnimatedSprite2D = %Player


@onready var label_header: Label = %Label_Header
@onready var gameplay: Node2D = $"../Gameplay"
@onready var settings_panel: MarginContainer = %settings_panel


func _init() -> void:
	ref = self

func _ready() -> void:
	button_replay.pressed.connect(_on_replay_pressed)
	button_continue.pressed.connect(_on_continue_pressed)
	button_play.pressed.connect(_on_play_pressed)
	button_settings.pressed.connect(_on_settings_pressed)
	update_menu_state.connect(_on_update_menu_state)
	update_menu_state.emit(menu_states.MAIN_MENU)
	
	Main_Menu.ref.label_footer.text = "HIGH SCORE: " + str(SaveGame.Highscore)
	
func _on_replay_pressed() -> void:
	GameManager.restart_game()

func _on_continue_pressed() -> void:
	update_menu_state.emit(menu_states.GAMEPLAY)
	
func _on_play_pressed() -> void:
	update_menu_state.emit(menu_states.PRE_GAMEPLAY)
	
func _on_settings_pressed() -> void:
	settings_panel.visible = !settings_panel.visible
	pass

func _on_update_menu_state(state:menu_states) -> void:
	menu_state = state
	
	UI.ref.visible = menu_state == menu_states.GAMEPLAY
	
	print("MENU STATE: ",str(menu_states.keys()[menu_state]))
	match menu_state:
		menu_states.PRE_GAMEPLAY:
			update_menu_state.emit(menu_states.GAMEPLAY)
			if Player.ref != null:
				Player.ref.walk_state()
			AudioManager.play_game()
			get_tree().call_group("spawners", "start_round")
		menu_states.GAMEPLAY:
			gameplay.visible = true
			visible = false
		menu_states.MAIN_MENU:
			player.visible = true
			menu_bg.visible = true
			button_play.visible = true
			button_continue.visible = false
			button_settings.visible = true
			button_replay.visible = false
			
			gameplay.visible = false
			label_header.text = "I'M WALKIN' HERE"
			visible = true
			AudioManager.play_menu()
			get_tree().call_group("spawners", "cleanup")
		menu_states.GAME_OVER:
			player.visible = false
			menu_bg.visible = false
			button_play.visible = false
			button_continue.visible = false
			button_settings.visible = false
			button_replay.visible = true
			
			
			label_header.text = "WALK OVER"
			GameManager.finish_round()
			get_tree().call_group("spawners", "cleanup")
			if Player.ref != null:
				Player.ref.idle_state()
				
			visible = true
		menu_states.PAUSE:
			player.visible = true
			menu_bg.visible = false
			button_play.visible = false
			button_continue.visible = true
			button_settings.visible = true
			button_replay.visible = true
			
			visible = true
			label_header.text = "PAUSED"
			if Player.ref != null:
				Player.ref.stop_state()
		
	get_tree().paused = menu_state == menu_states.PAUSE
