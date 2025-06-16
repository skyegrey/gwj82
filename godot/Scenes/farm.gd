class_name Farm extends Node2D

@onready var camera = %Camera
@onready var ground_layer: TileMapLayer = %GroundLayer

@onready var buildings: Buildings = %Buildings


# Children Refs
@onready var invalid_placement_sprite = $InvalidPlacementSprite
@onready var valid_placement_sprite = $ValidPlacementSprite

# States
@onready var is_placing: bool = false
@onready var can_place: bool = false

# Properties
@onready var light_level = 1


func begin_placing():
	is_placing = true

func _process(delta):
	pass

func _get_mouse_map_coordinates(_position):
	return ground_layer.local_to_map(ground_layer.to_local(_position / camera.zoom))

func _input(event):
	if is_placing:
		if event is InputEventMouseButton:
			if event.pressed == true:
				if can_place:
					end_placing(_get_mouse_map_coordinates(event.position))
		if event is InputEventMouseMotion:
			position = ground_layer.map_to_local(_get_mouse_map_coordinates(event.position))
			# TODO Extract to toggle function
			toggle_can_place_building(
				buildings.can_place_building(_get_mouse_map_coordinates(
					event.position)))

func toggle_can_place_building(_can_place: bool):
	can_place = _can_place
	valid_placement_sprite.visible = _can_place
	invalid_placement_sprite.visible = not _can_place
	

func end_placing(map_coordinates):
	valid_placement_sprite.visible = false
	buildings.place_building(map_coordinates, self)
	is_placing = false
