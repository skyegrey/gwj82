class_name Camera extends Camera2D

@export var zoom_scaler: float
@export var min_zoom = Vector2(1, 1)
@export var max_zoom = Vector2(8, 8)
@export var camera_velocity: int = 2

func _process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_direction:
		position += (input_direction / zoom) * camera_velocity


func _input(event):
	if event is InputEventMouseButton:
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				zoom = Vector2(zoom + Vector2(1, 1) * zoom_scaler).min(max_zoom)
			MOUSE_BUTTON_WHEEL_DOWN:
				zoom = Vector2(zoom - Vector2(1, 1) * zoom_scaler).max(min_zoom)
