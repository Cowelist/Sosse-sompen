extends Node2D

#funtion for når inventory er lukket
func _on_inventory_gui_closed() -> void:
	get_tree().paused = false

#function for når inventory er åpnet, pauser alt annet i spillet
func _on_inventory_gui_opened() -> void:
	get_tree().paused = true
