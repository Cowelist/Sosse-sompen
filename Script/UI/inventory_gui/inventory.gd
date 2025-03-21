extends Resource
 
class_name Inventory
 
signal updated
 
@export var items: Array[InventoryItem] = []
 
func _init() -> void:
	if items == null:
		items = []
 
func insert(item: InventoryItem):
	for i in range(items.size()):
		if !items[i]:
			items[i] = item
			updated.emit()  # Always fire after inserting
			return
	items.append(item)
	updated.emit()

func remove_item(item: InventoryItem) -> void:
	var index = items.find(item)
	if index != -1:
		items[index] = null
		updated.emit()
