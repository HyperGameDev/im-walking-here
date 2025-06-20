extends AnimatedSprite2D
class_name Bird

var TimerMax : float = randf_range(2,4)
var time : float = TimerMax

func TimerCount(InDelta: float) -> void:
	if time > 0:
		time -= InDelta
	else:
		time = TimerMax
		if visible == true:
			make_bird_noise()

func _process(delta: float) -> void:
	TimerCount(delta)
	

func make_bird_noise() -> void:
	
	var i : int = randi_range(0,1)
	if i == 0:
		AudioManager.play_bird(global_position)
	else:
		AudioManager.play_discord(global_position)
	var score_cost : float = 300
	score_cost /= global_position.distance_to(Player.ref.global_position)
	score_cost*=80*Player.ref.progress_ratio
	UI.ref.reduce_happiness(score_cost)
