extends Control

#lagde signaler
signal opened
signal closed

#setter isOpen til false på starten
var isOpen: bool = false

#loader inventory pg setter det som inventory som er 
@onready var inventory = PlayerData.inventory  # Use the shared instance
#@onready var inventory = preload("res://Script/UI/inventory_gui/Resource_Items/PlayerInventory.tres").duplicate()
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

#
func _ready() -> void:
	print("Inventory instance:", inventory)
	if inventory and inventory.updated:
		inventory.updated.connect(update)
	update()

#function for å oppdatere inventory
func update():
	print("Inventory updated")
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

#simpel function for open
func open():
	visible = true
	isOpen = true
	opened.emit()

#simpel funksjon for close 
func close():
	visible = false
	isOpen = false
	closed.emit()
