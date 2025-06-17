extends Node2D

@onready var farm_button = $CanvasLayer/UI/BuildMenu/FarmButton
@onready var barracks_button = $CanvasLayer/UI/BuildMenu/BarracksButton
@onready var buildings = $Buildings

func _ready():
	farm_button.pressed.connect(_on_farm_button_pressed)
	barracks_button.pressed.connect(_on_barracks_button_pressed)

func _on_farm_button_pressed():
	# TODO Convert to resources
	buildings.begin_placing_building("Farm")

func _on_barracks_button_pressed():
	# TODO Convert to resources
	buildings.begin_placing_building("Barracks")
