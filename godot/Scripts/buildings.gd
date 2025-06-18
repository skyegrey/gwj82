class_name Buildings extends Node2D

# Scene references
@onready var town_center = $TownCenter
@onready var fog_layer: TileMapLayer = %FogLayer
@onready var camera: Camera2D = %Camera
@onready var ground_layer: TileMapLayer = %GroundLayer
@onready var inventory: Inventory = %Inventory
@onready var player_units = %PlayerUnits
@onready var enemy_units = %EnemyUnits

# State variables
@onready var buildings_positions = {}

# TODO Convert to signal
func place_building(map_coordinates, building: Building):
	fog_layer.reveal_tiles(map_coordinates, building.light_level)
	buildings_positions[map_coordinates] = building

func _create_building(building_scene: PackedScene):
	var new_building = building_scene.instantiate()
	new_building.camera = camera
	new_building.ground_layer = ground_layer
	new_building.inventory = inventory
	new_building.buildings = self
	new_building.player_units = player_units
	new_building.enemy_units = enemy_units
	add_child(new_building)
	return new_building
