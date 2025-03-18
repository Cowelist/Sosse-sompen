extends Area2D
#class_name Fishing_interaction_area

func _ready() -> void:
	var player_inventory = get_node("res://Script/Character/Main_player/Inventroy.gd")
	player_inventory.updated_inventory.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	var player_inventory = get_node("res://Script/Character/Main_player/Inventroy.gd")
	print(player_inventory.inventory_space)
	print("hei")
