class_name EnemyBase extends Building

const SPECTRE = preload("res://Scenes/spectre.tscn")

func _ready():
	super()
	# Bubble up to All Enemy Buildings
	production_timer.start()
	is_placing = false

func _produce():
	var spawned_unit = enemy_units.spawn_unit(position, SPECTRE)
	spawned_unit.position = position
