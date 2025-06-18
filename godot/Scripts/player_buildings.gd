class_name PlayerBuildings extends Buildings

# Building Scenes
const FARM = preload("res://Scenes/farm.tscn")
const BARRACKS = preload("res://Scenes/barracks.tscn")

func _ready():
	buildings_positions = {
		Vector2i(10, 2): town_center
	}
	var start_tile = Vector2i(10, 2)
	fog_layer.reveal_tiles(start_tile, 3)

func begin_placing_building(building_type: String):
	match building_type:
		"Farm":
			_create_building(FARM)
		"Barracks":
			_create_building(BARRACKS)

func can_place_building(map_coordinates):
	if buildings_positions.has(map_coordinates):
		return false
	return true
