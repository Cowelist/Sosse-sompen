extends CanvasLayer

#lager en inventory variabel og setter den som inventory gui-en
@onready var inventory = $InventoryGui

#ready function som lukker inventory 
func _ready() -> void:
	inventory.close()

#event som sjekker for klikk, har satt inventory som T knappen
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
			inventory.close()
		else:
			inventory.open()
