class_name PlayerUnit extends Unit

@export var movement_speed: float = 15

# Scene Refernces
@onready var fog_layer: FogLayer

# State variables
@onready var is_moving_twoards_target: bool = false
@onready var target_location: Vector2
@onready var current_map_tile: Vector2i

func _process(delta):
	if is_moving_twoards_target:
		position = position.move_toward(target_location, movement_speed * delta)
		var new_map_tile = fog_layer.local_to_map(fog_layer.to_local(position))
		if current_map_tile != new_map_tile:
			current_map_tile = new_map_tile
			fog_layer.reveal_tiles(current_map_tile, 1)
		if position == target_location:
			is_moving_twoards_target = false

func move_to_position(_target_location):
	current_map_tile = fog_layer.local_to_map(fog_layer.to_local(position))
	is_moving_twoards_target = true
	target_location = _target_location
