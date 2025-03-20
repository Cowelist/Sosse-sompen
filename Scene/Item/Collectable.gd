extends Area2D

@export var itemRes: InventoryItem

func collect(inventory: Inventory) -> void:
	#inventory.insert(itemRes)
	queue_free()
	

	
	
