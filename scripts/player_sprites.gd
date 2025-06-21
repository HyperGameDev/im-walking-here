extends AnimatedSprite2D

func stop_play() -> void:
	stop()

func play_idle() -> void:
	play("idle")

func play_walk() -> void:
	play("walk")
