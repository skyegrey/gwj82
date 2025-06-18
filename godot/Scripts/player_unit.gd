class_name PlayerUnit extends Unit

# Properties
@export var minimum_distance_to_taget_position = 5
@export var movement_speed: float = 15

# Scene Refernces
@onready var fog_layer: FogLayer

# State variables
@onready var is_moving_towards_target: bool = false
@onready var target_location: Vector2
@onready var current_map_tile: Vector2i


func _physics_process(delta):
	velocity = Vector2.ZERO
	if is_moving_towards_target:
		if position.distance_to(target_location) >= minimum_distance_to_taget_position:
			velocity = position.direction_to(target_location) * movement_speed
			move_and_slide()
		else:
			is_moving_towards_target = false
			
		var new_map_tile = fog_layer.local_to_map(fog_layer.to_local(position))
		if current_map_tile != new_map_tile:
			current_map_tile = new_map_tile
			fog_layer.reveal_tiles(current_map_tile, 1)

#func _process(delta):
	#if is_moving_towards_target:
	#
		#position = position.move_toward(target_location, movement_speed * delta)
		#var new_map_tile = fog_layer.local_to_map(fog_layer.to_local(position))
		#if current_map_tile != new_map_tile:
			#current_map_tile = new_map_tile
			#fog_layer.reveal_tiles(current_map_tile, 1)
		#if position == target_location:
			#is_moving_towards_target = false

func move_to_position(_target_location):
	current_map_tile = fog_layer.local_to_map(fog_layer.to_local(position))
	is_moving_towards_target = true
	target_location = _target_location
