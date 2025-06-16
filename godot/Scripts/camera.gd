class_name Camera extends Camera2D

@export var zoom_scaler: float
@export var min_zoom = Vector2(1, 1)
@export var max_zoom = Vector2(8, 8)

@onready var is_dragging: bool = false
@onready var drag_start_position: Vector2 = Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton:
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				zoom = Vector2(zoom + Vector2(1, 1) * zoom_scaler).min(max_zoom)
			MOUSE_BUTTON_WHEEL_DOWN:
				zoom = Vector2(zoom - Vector2(1, 1) * zoom_scaler).max(min_zoom)
			MOUSE_BUTTON_RIGHT:
				is_dragging = event.pressed
				if is_dragging:
					drag_start_position = event.position
	if event is InputEventMouseMotion:
		if is_dragging:
			var drag_vector = drag_start_position - event.position 
			drag_start_position = event.position
			position += drag_vector / zoom
