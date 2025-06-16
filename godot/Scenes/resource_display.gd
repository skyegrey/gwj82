class_name ResourceDisplay extends Control

@onready var inventory: Inventory = %Inventory

@onready var resource_count_text = $ResourceCountText

func _process(delta):
	resource_count_text.text = str("Food: ",
		inventory.get_resource_count(Inventory.ResourceKeys.FOOD))
