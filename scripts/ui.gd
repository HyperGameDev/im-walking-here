class_name UI extends CanvasLayer

static var ref: CanvasLayer

@onready var progress_happiness: ProgressBar = %Progress_Happiness
@onready var label_score: Label = %Label_Score_Value
@onready var label_time: Label = %Label_Time_Value

func _init() -> void:
	ref = self

func _process(delta: float) -> void:
	if Path.ref.round_length > 0.:
		var minutes = int(Path.ref.round_length) / 60
		var seconds = int(Path.ref.round_length) % 60
		label_time.text = "%02d:%02d" % [minutes, seconds]
	else:
		GameManager.finish_round()
