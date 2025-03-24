extends Resource

class_name Inventory

#lager et signal for oppdatert/updated
signal updated

#lager en variabel som jeg kaller items, setter det til å være et Array som skal ha InventoryItems i seg,
#setter det som tomt på starten
@export var items: Array[InventoryItem] = []

#sjekker om items faktiskt er tomt og hvis det er sant setter den det tomt igjen
func _init() -> void:
	if items == null:
		items = []

#en function for å legge til item når det blir plukket opp
func insert(item: InventoryItem):
	for i in range(items.size()):
		if !items[i]:
			items[i] = item
			updated.emit()  # Always fire after inserting
			return
	items.append(item)
	updated.emit()

#startet på function for å fjerne item fra inventory
func remove_item(item: InventoryItem) -> void:
	var index = items.find(item)
	if index != -1:
		items[index] = null
		updated.emit()
