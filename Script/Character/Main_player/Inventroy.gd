extends Node2D

class_name Inventory

signal updated_inventory

@onready var Inventory_space = [null, null]
#@export var slots: Array[InventorySlot]

func _ready() -> void:
	print("Inventory being called")
	add_item_to_inventory("Leg")
	add_item_to_inventory("Leg")
	add_item_to_inventory("Leg")
	remove_item_from_inventory("weg")
func add_item_to_inventory(new_item):
	for i in range (Inventory_space.size()):
		if Inventory_space[i] == null:
			Inventory_space[i] = new_item
			emit_signal("updated_inventory", Inventory_space)
			return
		else:
			print("Inventory full")
			print(Inventory_space)

func remove_item_from_inventory(item):
	for i in range(Inventory_space.size()):
		if Inventory_space[i] == item:
			Inventory_space[i] = null
			emit_signal("updated_inventory")
			return
		elif Inventory_space[i] != item:
			print("can not remove item since it is not in inventory")
