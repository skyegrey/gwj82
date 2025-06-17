class_name PlayerUnits extends Node2D

# Scene Refs
@onready var selection_box: SelectionBox = %SelectionBox
@onready var camera = %Camera
@onready var fog_layer = %FogLayer

# Child Refs
@onready var select_collider = $SelectArea/SelectCollider
@onready var select_area = $SelectArea

# State Variables
@onready var selected_units = []


func _ready():
	selection_box.box_drawn.connect(_create_selected_collider)
	select_area.area_entered.connect(_select_unit)

func _process(delta):
	pass

func _canvas_position_to_game_space(_position): 
	return (_position - Vector2(600, 400)) / camera.zoom + camera.position

func spawn_unit(unit_scene: PackedScene):
	var new_unit: PlayerUnit = unit_scene.instantiate()
	new_unit.fog_layer = fog_layer
	add_child(new_unit)
	return new_unit

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				if selected_units:
					for unit: PlayerUnit in selected_units:
						unit.move_to_position(
							_canvas_position_to_game_space(event.position))

func _create_selected_collider(collider_position, collider_size):
	selected_units = []
	select_area.monitoring = true
	select_collider.shape.size = collider_size / camera.zoom
	select_collider.position = _canvas_position_to_game_space(collider_position) \
	+ select_collider.shape.size / 2

func _select_unit(unitArea: Area2D):
	selected_units.append(unitArea.get_parent())
	await RenderingServer.frame_post_draw
	select_area.monitoring = false
	
