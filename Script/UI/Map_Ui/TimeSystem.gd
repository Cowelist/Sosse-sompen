class_name TimeSystem extends Node

signal updated

@export var date_time: DateTime
@export var ticks_pr_sec: int = 6

func _process(delta: float) -> void:
	date_time.increas_by_sec(delta * ticks_pr_sec)
	updated.emit(date_time)
	


func _on_updated() -> void:
	pass # Replace with function body.
