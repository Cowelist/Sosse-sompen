extends Resource
 
class_name inventory
 
@export var itmes: Array[InventoryItem]
 
func insert(item: InventoryItem):
	for i in range(itmes.size()):
		if !itmes[i]:
			itmes[i] = item
			break
