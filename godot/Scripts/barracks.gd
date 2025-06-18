class_name Barracks extends Building

const SPEARMAN = preload("res://Scenes/spearman.tscn")

@onready var unit_capacity: int = 4
@onready var spawned_units: int = 0

func _produce():
	if spawned_units < unit_capacity:
		var spawned_unit: Unit = player_units.spawn_unit(position, SPEARMAN)
		spawned_units += 1
		spawned_unit.tree_exited.connect(_decrease_unit_spawn_count)

func _decrease_unit_spawn_count():
	spawned_units -= 1
