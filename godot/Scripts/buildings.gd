class_name Buildings extends Node2D

@onready var town_center = $TownCenter
@onready var fog_layer: FogLayer = $"../Map/FogLayer"

@onready var farm: Farm = $Farm
@onready var buildings_positions = {
	Vector2i(10, 2): town_center
}

func _ready():
	var start_tile = Vector2i(10, 2)
	reveal_tiles(start_tile, 3)

func begin_placing_building():
	_create_building()

func _create_building():
	farm.visible = true
	farm.begin_placing()

func place_building(map_coordinates, building: Farm):
	reveal_tiles(map_coordinates, building.light_level)
	buildings_positions[map_coordinates] = building

func can_place_building(map_coordinates):
	if buildings_positions.has(map_coordinates):
		return false
	return true

func reveal_tiles(starting_tile, light_level):
	for revealed_tile in generate_revealed_tiles(light_level):
		fog_layer.reveal_tile(starting_tile + revealed_tile)

func generate_revealed_tiles(light_level):
	var quadrant_tiles = []
	for x in range(light_level + 1):
		for y in range(light_level + 1):
			if round(Vector2i(x, y).distance_to(Vector2i.ZERO)) <= light_level:
				quadrant_tiles.append(Vector2i(x, y))
	
	var revealed_tiles = []
	for quadrant_tile in quadrant_tiles:
		revealed_tiles.append_array(
			[
				quadrant_tile,
				quadrant_tile * Vector2i(-1, 1),
				quadrant_tile * Vector2i(1, -1),
				quadrant_tile * Vector2i(-1, -1)
			]
		)
	return revealed_tiles
	
	
