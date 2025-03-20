extends Area2D

@export var itemRes: InventoryItem

func collect(Inventory: inventory) -> void:
	Inventory.insert(itemRes)
	queue_free()
	

	
	
