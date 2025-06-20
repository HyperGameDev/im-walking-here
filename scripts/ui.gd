class_name UI extends CanvasLayer

static var ref: UI

@onready var progress_happiness: ProgressBar = %Progress_Happiness
@onready var label_score: Label = %Label_Score_Value
@onready var label_time: Label = %Label_Time_Value
@onready var button_pause: Button = %Button_Pause

func _init() -> void:
	ref = self
	
func _ready() -> void:
	button_pause.pressed.connect(_on_pause_pressed)
	
func _on_pause_pressed() -> void:
	Main_Menu.ref.update_menu_state.emit(Main_Menu.ref.menu_states.PAUSE)

func _process(delta: float) -> void:
	label_score.text = str(GameManager.score)
	
	if Path.ref.round_length > 0.:
		var minutes = int(Path.ref.round_length) / 60
		var seconds = int(Path.ref.round_length) % 60
		label_time.text = "%02d:%02d" % [minutes, seconds]
	else:
		GameManager.finish_round()
		#
		
func reduce_happiness(amount:float) -> void:
	progress_happiness.value -= amount
		
func update_score() -> void:
	
	progress_happiness.value += GameManager.happiness_factor
	
	var new_score: int = GameManager.score + progress_happiness.value * GameManager.score_mult
	var tween: Tween = create_tween()
	tween.tween_property(GameManager,"score",new_score,.2)
	
