class_name Buildings extends Node2D

# Building Scenes
const FARM = preload("res://Scenes/farm.tscn")
const BARRACKS = preload("res://Scenes/barracks.tscn")

# Scene references
@onready var town_center = $TownCenter
@onready var fog_layer: TileMapLayer = %FogLayer
@onready var camera: Camera2D = %Camera
@onready var ground_layer: TileMapLayer = %GroundLayer
@onready var inventory: Inventory = %Inventory
@onready var player_units = %PlayerUnits

@onready var buildings_positions = {
	Vector2i(10, 2): town_center
}

func _ready():
	var start_tile = Vector2i(10, 2)
	fog_layer.reveal_tiles(start_tile, 3)

func begin_placing_building(building_type: String):
	match building_type:
		"Farm":
			_create_building(FARM)
		"Barracks":
			_create_building(BARRACKS)

func _create_building(building_scene: PackedScene):
	var new_building = building_scene.instantiate()
	new_building.camera = camera
	new_building.ground_layer = ground_layer
	new_building.inventory = inventory
	new_building.buildings = self
	new_building.player_units = player_units
	add_child(new_building)

func place_building(map_coordinates, building: Building):
	fog_layer.reveal_tiles(map_coordinates, building.light_level)
	buildings_positions[map_coordinates] = building

func can_place_building(map_coordinates):
	if buildings_positions.has(map_coordinates):
		return false
	return true
