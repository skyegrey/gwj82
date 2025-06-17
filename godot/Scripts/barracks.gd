class_name Barracks extends Building

const SPEARMAN = preload("res://Scenes/spearman.tscn")

@onready var unit_capacity: int = 2

func _produce():
	var spawned_unit = player_units.spawn_unit(SPEARMAN)
	spawned_unit.position = position
