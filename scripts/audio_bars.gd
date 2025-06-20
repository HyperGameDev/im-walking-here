extends HSlider

@export var audioBus : String

var busindex : int

func _ready() -> void:
	busindex = AudioServer.get_bus_index(audioBus)
	value = db_to_linear(AudioServer.get_bus_volume_db(busindex))

func _on_value_changed(newValue: float) -> void:
	AudioServer.set_bus_volume_db(busindex, linear_to_db(newValue))
