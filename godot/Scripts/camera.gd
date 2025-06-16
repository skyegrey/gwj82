class_name Camera extends Camera2D

@export var zoom_scaler: float
@export var min_zoom = Vector2(1, 1)
@export var max_zoom = Vector2(8, 8)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom = Vector2(zoom + Vector2(1, 1) * zoom_scaler).min(max_zoom)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom = Vector2(zoom - Vector2(1, 1) * zoom_scaler).max(min_zoom)
