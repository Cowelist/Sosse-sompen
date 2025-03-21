extends BTAction

@export var target_variable: = &"target"

@export var speed_var = 60
@export var tolerance = 20

func _tick(_delta: float) -> Status:
	var target: CharacterBody2D = blackboard.get_var(target_variable)
#Finner sin egen posisjon og prøver å gå mott målet (target) 
	if target != null:
		var target_position = target.global_position
		var direction = agent.global_position.direction_to(target_position)
		print("Skrii", direction)
#Samme skript som i m_t_t | blir kalt på når target blir angrepet
#Finner posisjonen din og target. Går deretter etter deg til du er i tolerance rangen 
		if abs(agent.global_position.x - target_position.x) < tolerance:
			agent.movment_x(direction.x, 0)
			return SUCCESS
		elif abs(agent.global_position.y - target_position.y) < tolerance:
			agent.movment_y(direction.y, 0)
			return SUCCESS
		else: 
			print("verv", direction.x, direction.y)
			agent.movment_x(direction.x, speed_var)
			agent.movment_y(direction.y, speed_var)
			return RUNNING
		
	return FAILURE
