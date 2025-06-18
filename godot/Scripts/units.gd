class_name Units extends Node2D

@onready var camera = %Camera
@onready var fog_layer = %FogLayer

func spawn_unit(unit_scene: PackedScene) -> Unit:
	var new_unit: Unit = unit_scene.instantiate()
	add_child(new_unit)
	return new_unit
