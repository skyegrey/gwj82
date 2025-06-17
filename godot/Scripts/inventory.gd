class_name Inventory extends Node

enum ResourceKey {FOOD}

@onready var inventory = {
	ResourceKey.FOOD: 0
}

func get_resource_count(resource_key: ResourceKey):
	return inventory[resource_key]

func add_resource(resource_key: ResourceKey, amount):
	inventory[resource_key] += amount
