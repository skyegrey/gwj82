class_name EnemyBuildings extends Buildings

const ENEMY_BASE = preload("res://Scenes/enemy_base.tscn")

func _ready():
	var base_map_coordinates = Vector2i(7, -10)
	var enemy_base = _create_building(ENEMY_BASE)
	enemy_base.position = fog_layer.to_global(fog_layer.map_to_local(base_map_coordinates))
