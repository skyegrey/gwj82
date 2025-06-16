class_name Inventory extends Node

enum ResourceKeys {FOOD}

@onready var inventory = {
	ResourceKeys.FOOD: 0
}

func get_resource_count(resource_key: ResourceKeys):
	return inventory[resource_key]
