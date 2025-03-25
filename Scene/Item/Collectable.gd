extends Area2D

#lagrer itemRes som InventoryItem, export gjør så jeg kan sette verdien i inspector
@export var itemRes: InventoryItem

#function for å plukke opp item
func collect(inventory: Inventory) -> void:
	inventory.insert(itemRes)
	queue_free()
