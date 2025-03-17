extends Control

@onready var days_label: Label = $"Day-control/Days"
@onready var hours_label: Label = $"Clock-control/hour"
@onready var minutes_label: Label = $"Clock-control/minute"
	
func _on_time_system_updated(date_time: DateTime) -> void:
	days_label.text = str(date_time.Days)
	hours_label.text = str(date_time.Hours)
	minutes_label.text = str(date_time.Minutes)
	
#func add_one_zero(label: Label, value: int) -> void:
#	if value > 10:
#		label.text += "0"
		
		
#func update_label(label: Label, value: int, should_have_zero: bool = true) -> void:
#	label.text = ""
	
#	if should_have_zero: 
#		add_one_zero(label, value)
		
#	label.text += str(value)
	
	
	
