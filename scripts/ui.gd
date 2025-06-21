class_name UI extends CanvasLayer

static var ref: CanvasLayer

@onready var progress_happiness: ProgressBar = %Progress_Happiness
@onready var label_score: Label = %Label_Score_Value
@onready var label_time: Label = %Label_Time_Value

func _init() -> void:
	ref = self

func _process(delta: float) -> void:
	label_score.text = str(GameManager.score)
	
	if Path.ref.round_length > 0.:
		var minutes = int(Path.ref.round_length) / 60
		var seconds = int(Path.ref.round_length) % 60
		label_time.text = "%02d:%02d" % [minutes, seconds]
	else:
		GameManager.finish_round()
		
func update_score() -> void:
	var new_score: int = GameManager.score + progress_happiness.value * GameManager.score_mult
	var tween: Tween = create_tween()
	tween.tween_property(GameManager,"score",new_score,.2)
