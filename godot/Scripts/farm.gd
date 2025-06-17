class_name Farm extends Building

func _produce():
	inventory.add_resource(Inventory.ResourceKey.FOOD, 1)
