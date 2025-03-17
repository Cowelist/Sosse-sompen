extends Control

@onready var days_label: Label = $"Day-control/Days"
@onready var hours_label: Label = $"Clock-control/hour"
@onready var minutes_label: Label = $"Clock-control/minute"

func _on_time_system_updated(date_time: DateTime) -> void:
	days_label.text = str(date_time.Days)
	hours_label.text = str(date_time.Hours)
	minutes_label.text = str(date_time.Minutes)
	
	
