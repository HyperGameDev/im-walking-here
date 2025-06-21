extends Marker2D
class_name EntitySpawner

func _ready() -> void:
	add_to_group("spawners")

const entity_array : Array = [
	"res://scenes/world_entities/rock1.tscn",
	"res://scenes/world_entities/tree_1.tscn",
	"res://scenes/world_entities/tree_2.tscn",
	"res://scenes/world_entities/tree_1.tscn",
	"res://scenes/world_entities/tree_2.tscn",
	"res://scenes/world_entities/rock1.tscn",
	"res://scenes/world_entities/rock2.tscn",
	"res://scenes/world_entities/cloud1.tscn",
	"res://scenes/world_entities/cloud2.tscn"
	
]



func start_round() -> void:
	var i : Node = load(entity_array.pick_random()).instantiate()
	add_child(i)

func cleanup() -> void:
	if !get_child_count() > 0:
		return
	for i : Node in get_children():
		i.queue_free()
