extends BTAction

#Satt variabler fra c_r_p 
@export var target_position_var:=&"pos"
@export var dir_var:=&"dir"

@export var speed_var = 40
@export var tolerance = 10

func _tick(_delta: float) -> Status:
#Kaller på en method i choose_random_position gjennom target_position_var
#Dette gjør det sånn at vi får variablene fra c_r_p til det scripte her
##dir_var gir meg verdien dir | dir_var variabel? 
	var target_position: Vector2 = blackboard.get_var(target_position_var, Vector2.ZERO)
	var dir = blackboard.get_var(dir_var)

#Dette ser etter posisjonen sin og går motden helt til den er i lengden til (tolerance) som er 10
#dvs at den stopper rett før den når posisjonen sin
	if abs(agent.global_position.x - target_position.x) < tolerance:
		agent.move(dir, 0)
		return SUCCESS
	else:
#		agent.move(dir, speed_var)
		return RUNNING
