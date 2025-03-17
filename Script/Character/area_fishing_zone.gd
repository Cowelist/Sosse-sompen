extends Area2D
#class_name Fishing_interaction_area



func _on_body_entered(body: Node2D) -> void:
	print("hei")


func _on_area_entered(area: Area2D) -> void:
	print("player on area enterd")
