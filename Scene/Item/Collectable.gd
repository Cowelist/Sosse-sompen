extends Area2D

func collect() -> void:
	queue_free()
	
func _on_hurt_box_area_entered(area) -> void:
	if area.has_method("collect"):
		area.collect() 
	
