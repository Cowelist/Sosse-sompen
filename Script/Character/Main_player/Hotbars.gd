extends TextureButton


var Inventory_space = [null, null]
var hotbar
var slots = []
#@onready var slots = $Scene/UI/Player_UI/Inventory/Hotbar/HBoxContainer.get_children()

func _ready() -> void:
	hotbar = get_node_or_null("$Scene/UI/Player_UI/Inventory/Hotbar/HBoxContainer")  # Safely get node
	if hotbar:
		slots = hotbar.get_children()
		print(slots)
	else:
		print("HBoxContainer not found!")
	
	
	print("Inventory being called")
	add_item_to_inventory("Leg")
	add_item_to_inventory("Leg")
	add_item_to_inventory("Leg")
	remove_item_from_inventory("weg")
func add_item_to_inventory(new_item):
	for i in range (Inventory_space.size()):
		if Inventory_space[i] == null:
			Inventory_space[i] = new_item
			slots[i].get_node("Hotbar_1").texture = new_item
			return
	print("Inventory full")
	print(Inventory_space)

func remove_item_from_inventory(item):
	for i in range(Inventory_space.size()):
		if Inventory_space[i] == item:
			Inventory_space[i] = null
			print("item has been removed")
			return
		elif Inventory_space[i] != item:
			print("can not remove item since it is not in inventory")
