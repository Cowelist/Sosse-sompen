class_name DateTime extends Resource

#lar deg sette alle disse i inspector
@export_range(0,59) var Seconds: int = 0
@export_range(0,59) var Minutes: int = 0
@export_range(0,23) var Hours: int = 0
@export_range(0,10) var Days: int = 0

#lagrer tid som ikke er et sekund
var delta_time: float = 0

#oppdaterer sekundene
func increas_by_sec(delta_Seconds: float) -> void:
	delta_time += delta_Seconds
	if delta_time < 1: return
	
	#gjør deta time til hele sekduner
	var delta_int_secs: int = delta_time
	delta_time -= delta_int_secs
	
	Seconds += delta_int_secs
	Minutes += Seconds/ 60
	Hours += Minutes/ 60
	Days += Hours/ 24
	
	Seconds = Seconds % 60
	Minutes = Minutes % 60
	Hours = Hours % 24
	
	print_debug(str(Days) + ":" + str(Hours) + ":" + str(Minutes) + ":" + str(Seconds))
	 
	
	
	
