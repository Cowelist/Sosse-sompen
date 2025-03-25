#PlayerData.gd (Autoload)
extends Node

#lagrer en variabel for inventory som jeg bruker der jeg trenger inventory
var inventory = preload("res://Script/UI/inventory_gui/Resource_Items/PlayerInventory.tres").duplicate()

#ready function 
func _ready():
	if inventory.updated:
		inventory.updated.connect(func(): print("Inventory updated signal emitted from PlayerData"))
