extends BTAction

@export var group: StringName
@export var target_variable: StringName = &"target"

var target

func _tick(_delta: float) -> Status:
#Ser i group for å velge target
	if group == "enemy":
		target = get_enemy_ndoe()
	elif group == "player":
		target = get_player_ndoe()

	print(target)
	blackboard.set_var(target_variable, target)
	return SUCCESS
	
func get_enemy_ndoe():
	var nodes: Array[Node] = agent.get_tree().get_nodes_in_group(group)
#Ser etter om det er flere eller 2 enemies. Hvis så så ser den etter om den ser på seg selv
	if nodes.size() >= 2:
		while agent.check_for_self(nodes.front()):
			nodes.shuffle()
		return nodes.front()
	
func get_player_ndoe():
#Fra node lista/treet så tar den alle nodes i gruppen | mer spesifikk finner posisjonen utfra noden i treet
	var nodes: Array[Node] = agent.get_tree().get_nodes_in_group(group)
	return nodes[0]
