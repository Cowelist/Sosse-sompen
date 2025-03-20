extends BTAction

@export var range_min_dir: float = 40.0
@export var range_max_dir: float = 100.0

#& kan bli sett på som en global variable | kommer til å bli kalt på gjennom et annet script 
@export var position_var: StringName = &"pos"
@export var dir_var_x: StringName = &"dir_x"
@export var dir_var_y: StringName = &"dir_y"

#Func som kjører til den får en spesifikk (SUCCESS) retur verdi
func _tick(_delta: float) -> Status:
	var pos: Vector2
	var dir = random_dir()
	
	pos = random_position(dir)
#Gir postion_var den samme verdien som pos/random_position funksjonen
	blackboard.set_var(position_var, pos)
	
	return SUCCESS
	
	
#Gir en tilfeldig posisjon som karakteren skal bevege seg til 
func random_position(dir):
	var vector: Vector2
	var distance_x = randi_range(range_min_dir, range_max_dir) * dir 
	var distance_y = randi_range(range_min_dir, range_max_dir) * dir

#Lager en tilfeldig 
	var final_position_x = (distance_x + agent.global_position.x)
	var final_position_y = (distance_y + agent.global_position.y)
	
	vector.x = final_position_x
	vector.y = final_position_y
	return vector

#Gir en tilfeldig rettning som karakteren skal bevege seg mot	
func random_dir():
	var dir_x = randi_range(-2, 3)
	var dir_y = randi_range(-2, 3)
	if abs(dir_x) != dir_x:
		dir_x = -1
	elif dir_x <= 2:
		dir_x = 0
	else: 
		dir_x = 1
		
	if abs(dir_y) != dir_y:
		dir_y = -1
	elif dir_y <= 2:
		dir_y = 0
	else:
		dir_y = 1
#Blackboard = Er som en variabel som ai-en kan gå gjennom og endre på under kjøringen av spillet
#Den kan f.eks. se etter en spiller og deretter oppdatere bb sånn at en annen funksjon eller noe kan få nytte av informasjonen
	blackboard.set_var(dir_var_x, dir_x)
	blackboard.set_var(dir_var_y, dir_y)
	return dir_x
	return dir_y 
