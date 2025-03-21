# PlayerData.gd (Autoload)
extends Node

var inventory = preload("res://Script/UI/inventory_gui/Resource_Items/PlayerInventory.tres").duplicate()

func _ready():
	if inventory.updated:
		inventory.updated.connect(func(): print("Inventory updated signal emitted from PlayerData"))
