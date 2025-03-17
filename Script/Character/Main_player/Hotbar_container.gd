extends HBoxContainer

#@onready var inventory: Inventory = preload("res://Script/Character/Main_player/Inventroy.gd")
@onready var slots: Array = get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()
#	inventory.updated.connect(update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update() -> void: 
	for i in range(slots.size()):
		pass
#		var inventory_slot:InventorySlot = inventory.slots[i]
#		slots[i].update_to_slot(inventory_slot)
