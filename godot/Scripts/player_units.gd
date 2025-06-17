class_name PlayerUnits extends Node2D


func spawn_unit(unit_scene: PackedScene):
	var new_unit = unit_scene.instantiate()
	add_child(new_unit)
	return new_unit
