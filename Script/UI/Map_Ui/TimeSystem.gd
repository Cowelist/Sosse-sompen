class_name TimeSystem extends Node

signal updated

@export var date_time: DateTime
@export var ticks_pr_sec: int = 1000

#oppdaterer
func _process(delta: float) -> void:
	date_time.increas_by_sec(delta * ticks_pr_sec)
	updated.emit(date_time)
	
