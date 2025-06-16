extends Node2D


@onready var farm_button = $CanvasLayer/UI/BuildMenu/FarmButton
@onready var buildings = $Buildings

func _ready():
	farm_button.pressed.connect(_on_farm_button_pressed)

func _on_farm_button_pressed():
	buildings.begin_placing_building()
