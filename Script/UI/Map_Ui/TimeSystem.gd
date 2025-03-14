class_name TimeSystem extends Node

@export var date_time: DateTime
@export var ticks_pr_sec: int = 6

func _process(delta: float) -> void:
	date_time.increas_by_sec(delta * ticks_pr_sec)
	
	
