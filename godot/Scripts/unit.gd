class_name Unit extends CharacterBody2D

# TODO Export to resource
@onready var max_hp = 100
@onready var current_hp = 100

# Child refs
@onready var progress_bar = $ProgressBar

func _update_progress_bar(hp):
	var new_value = float(hp) / max_hp
	
	if new_value != 1:
		progress_bar.visible = true
		var resulting_color = Color.GREEN
		if new_value >= .5:
			# Set color between Green & Yellow
			resulting_color = Color.GREEN * ((new_value - .5) * 2) + Color.YELLOW * ((1 - new_value) * 2)
		else:
			# Set color between Yellow & Red
			resulting_color = Color.RED * ((.5 - new_value) * 2) + Color.YELLOW * (new_value * 2)

		progress_bar.get_theme_stylebox("fill").bg_color = resulting_color
		progress_bar.value = float(hp) / max_hp
	else:
		progress_bar.visilbe = false
