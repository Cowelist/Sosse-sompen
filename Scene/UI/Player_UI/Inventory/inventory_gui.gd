extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var inventory: inventory = preload("res://Script/UI/inventory_gui/Resource_Items/PlayerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready() -> void:
	update()

func update():
	for i in range(min(inventory.itmes.size(), slots.size())):
		slots[i].update(inventory.itmes[i])

func open():
	visible = true
	isOpen = true
	opened.emit()
	
func close():
	visible = false
	isOpen = false
	closed.emit()
