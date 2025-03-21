extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var inventory = PlayerData.inventory  # Use the shared instance
#@onready var inventory = preload("res://Script/UI/inventory_gui/Resource_Items/PlayerInventory.tres").duplicate()
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready() -> void:
	print("Inventory instance:", inventory)
	if inventory and inventory.updated:
		inventory.updated.connect(update)
	update()

func update():
	print("Inventory updated")
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func open():
	visible = true
	isOpen = true
	opened.emit()
	
func close():
	visible = false
	isOpen = false
	closed.emit()
