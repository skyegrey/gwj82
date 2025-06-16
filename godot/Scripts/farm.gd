class_name Farm extends Node2D

# Scene Refs
@onready var camera = %Camera
@onready var ground_layer: TileMapLayer = %GroundLayer
@onready var inventory = %Inventory
@onready var buildings: Buildings = %Buildings


# Children Refs
@onready var invalid_placement_sprite = $InvalidPlacementSprite
@onready var valid_placement_sprite = $ValidPlacementSprite
@onready var production_timer = $ProductionTimer

# States
@onready var is_placing: bool = false
@onready var can_place: bool = false

# Properties
@onready var light_level = 1


func _ready():
	production_timer.timeout.connect(_produce)


func _process(delta):
	pass

func begin_placing():
	is_placing = true

func _get_mouse_map_coordinates(_position):
	return ground_layer.local_to_map(ground_layer.to_local((_position - 
	Vector2(600, 400)) / camera.zoom + camera.position))

func _input(event):
	if is_placing:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
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
	production_timer.start()
	valid_placement_sprite.visible = false
	buildings.place_building(map_coordinates, self)
	is_placing = false

func _produce():
	inventory.add_resource(Inventory.ResourceKey.FOOD, 1)
