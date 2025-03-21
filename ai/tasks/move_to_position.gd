extends BTAction

#Satt variabler fra c_r_p 
@export var target_position_var:=&"pos"
@export var dir_var_x:=&"dir_x"
@export var dir_var_y:=&"dir_y"

@export var speed_var = 10
@export var tolerance = 5


func _tick(_delta: float) -> Status:
#Kaller på en method i choose_random_position gjennom target_position_var
#Dette gjør det sånn at vi får variablene fra c_r_p til det scripte her
##dir_var gir meg verdien dir fra c_r_p | dir_var variabel? 
	var target_position: Vector2 = blackboard.get_var(target_position_var, Vector2.ZERO)
	var dir_x = blackboard.get_var(dir_var_x)
	var dir_y = blackboard.get_var(dir_var_y)
#Dette ser etter posisjonen sin og går motden helt til den er i lengden til (tolerance) som er 10
#dvs at den stopper rett før den når posisjonen sin
	if abs(agent.global_position.y - target_position.y) < tolerance:
		agent.movment_y(dir_y, 0)
		return SUCCESS
	elif abs(agent.global_position.x - target_position.x) < tolerance:
		agent.movment_x(dir_x, 0)
		return SUCCESS
	else:
		agent.movment_y(dir_y, speed_var)
		agent.movment_x(dir_x, speed_var)
		return RUNNING
		
		
