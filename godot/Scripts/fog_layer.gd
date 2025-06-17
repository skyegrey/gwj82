class_name FogLayer extends TileMapLayer

func reveal_tile(tile_position: Vector2i):
	erase_cell(tile_position)

func reveal_tiles(starting_tile, light_level):
	for revealed_tile in generate_revealed_tiles(light_level):
		reveal_tile(starting_tile + revealed_tile)

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
