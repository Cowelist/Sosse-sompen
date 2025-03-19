extends BTAction

@export var range_min_dir: float = 40.0
@export var range_max_dir: float = 100.0

#& kan bli sett på som en global variable | kommer til å bli kalt på gjennom et annet script 
@export var position_var: StringName = &"pos"
@export var dir_var: StringName = &"dir"
var tr = false 

#Func som kjører til den får en spesifikk (SUCCESS) retur verdi
func _tick(_delta: float) -> Status:
	var pos: Vector2
	var dir = random_dir()
	
	pos = random_position(dir)
#Gir postion_var den samme verdien som pos/random_position funksjonen
	blackboard.set_var(position_var, pos)
	
	print("Klag", + dir, pos)
	return SUCCESS
	
	
#Gir en tilfeldig posisjon som karakteren skal bevege seg til 
func random_position(dir):
	var vector: Vector2
	var distance = randi_range(range_min_dir, range_max_dir) * dir 

#Lager en tilfeldig 
	var final_position_x = (distance + agent.global_position.x)
	var final_position_y = (distance + agent.global_position.y)
	
	vector.x = final_position_x
	vector.y = final_position_y
	return vector

#Gir en tilfeldig rettning som karakteren skal bevege seg mot	
func random_dir():
	var dir = randi_range(-4, 3)
	if abs(dir) != dir:
		dir = -1
	else:
		dir = 1
#Blackboard = Er som en variabel som ai-en kan gå gjennom og endre på under kjøringen av spillet
#Den kan f.eks. se etter en spiller og deretter oppdatere bb sånn at en annen funksjon eller noe kan få nytte av informasjonen
	blackboard.set_var(dir_var, dir)
	return dir 
