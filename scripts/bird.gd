extends AnimatedSprite2D
class_name Bird


var TimerMax : float = randf_range(3,7)
var time : float = TimerMax

func TimerCount(InDelta: float) -> void:
	if time > 0:
		time -= InDelta
	else:
		time = TimerMax
		make_bird_noise()
		#Sends a signal here

func _process(delta: float) -> void:
	TimerCount(delta)

func make_bird_noise() -> void:
	var i : int = randi_range(0,1)
	if i == 0:
		AudioManager.play_bird(global_position)
	else:
		AudioManager.play_discord()
	# TODO make the player lose scoremult
