extends CanvasLayer

@onready var inventory = $InventoryGui

func _ready() -> void:
	inventory.close()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggel_inventory"):
		if inventory.isOpen:
			inventory.close()
		else: 
			inventory.open()
