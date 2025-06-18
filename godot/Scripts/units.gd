class_name Units extends Node2D

@onready var camera = %Camera
@onready var fog_layer = %FogLayer

func spawn_unit(_position: Vector2, unit_scene: PackedScene) -> Unit:
	var new_unit: Unit = unit_scene.instantiate()
	new_unit.position = _position
	add_child(new_unit)
	new_unit.velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	new_unit.move_and_slide()
	return new_unit
