extends Button

signal item_clicked 

@export var parent : Node

func _ready() -> void:
	pressed.connect(_on_pressed)
	item_clicked.connect(parent._on_item_clicked)

func _on_pressed() -> void:
	item_clicked.emit()
	
	pass # Replace with function body.
