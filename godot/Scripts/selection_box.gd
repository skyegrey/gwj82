class_name SelectionBox extends NinePatchRect

@onready var is_drawing_box: bool = false
@onready var drag_start_position: Vector2 = Vector2.ZERO

signal box_drawn

func _input(event):
	if is_drawing_box && event is InputEventMouseMotion:
		var width = abs(event.position.x - drag_start_position.x)
		var height = abs(event.position.y - drag_start_position.y)
		size = Vector2(width, height)
		position = Vector2(
			min(event.position.x, drag_start_position.x), 
			min(event.position.y, drag_start_position.y))
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if is_drawing_box && not event.pressed:
				box_drawn.emit(position, size)
				is_drawing_box = false
				visible = false
				size = Vector2(0, 0)
			if event.pressed:
				drag_start_position = event.position
				visible = true
				is_drawing_box = true
				position = event.position
