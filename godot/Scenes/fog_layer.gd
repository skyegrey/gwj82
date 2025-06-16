class_name FogLayer extends TileMapLayer

func reveal_tile(tile_position: Vector2i):
	erase_cell(tile_position)
