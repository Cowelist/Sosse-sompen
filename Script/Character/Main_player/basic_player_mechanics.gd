extends CharacterBody2D

var friction = 1000

var speed = 100
const max_speed = 100
var weight = 60
var accumelation = Vector2(1, 1)

var current_direction = "none"

var one_time = false
var store_key = []


#Funksjonen er for spiller bevegelsen
func _physics_process(delta): 
	var move_direction = Vector2.ZERO
	
	if Input.is_action_pressed("dir_Right"):
		current_direction = "right"
		move_direction.x += 1
		store_key.append("right")
		
	if Input.is_action_pressed("dir_Down"):
		current_direction = "down"
		move_direction.y += 1
		store_key.append("down")
	
	if Input.is_action_pressed("dir_Up"):
		current_direction = "up"
		store_key.append("up")
		move_direction.y -= 1

	if Input.is_action_pressed("dir_Left"):
		current_direction = "left"
		store_key.append("left")
		move_direction.x -= 1
		
	
	
	#Gjort det sånn at man blir så hvit tregere når man går skrått
	if store_key == ["right", "down"] or store_key == ["down", "left"]:
		move_direction.y -= 0.25
		if "right" in store_key: 
			move_direction.x -= 0.25
		elif "left" in store_key:
			move_direction.x += 0.25
			
	if store_key == ["right", "up"] or store_key == ["up", "left"]:
		move_direction.y += 0.25
		if "right" in store_key: 
			move_direction.x -= 0.25
		elif "left" in store_key:
			move_direction.x += 0.25

	#print(accumelation)
	
	
	print(store_key)
	print(velocity.length())
#	velocity = Vector2(move_direction * speed * accumelation)
	if velocity.length() <= 300 and (store_key == ["right"] or store_key == ["left"]):
		velocity.x = move_toward( velocity.x, move_direction.x * speed, accumelation.x)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	if velocity.length() <= 300 and (store_key == ["up"] or store_key == ["down"]):
		velocity.y = move_toward( velocity.y, move_direction.y * speed, accumelation.y)
	else: 
		velocity.y = move_toward(velocity.y, 0, friction * delta)
	

	accumelation_handler()
	print (velocity)
	play_anim(move_direction)
	move_and_slide()
	
func accumelation_handler():
	if store_key != []: 
		accumelation_handler_run()
	else:
		accumelation_handler_stop()
	
func accumelation_handler_run():
	if store_key == ["right"]:
		accumelation_handler_hori("HORIZONTAL")
	if store_key == ["left"]:
		accumelation_handler_hori("HORIZONTAL")
	if store_key == ["up"]:
		accumelation_handler_vert("VERTICAL")
	if store_key == ["down"]:
		accumelation_handler_vert("VERTICAL")
	store_key = []

func accumelation_handler_stop():
	if one_time == true and store_key not in [["right"], ["left"]]:
		accumelation_handler_hori("null")
		print("null")
	elif one_time == true and store_key not in [["up"], ["down"]]:
		accumelation_handler_vert("null")
		print("null")

func accumelation_handler_vert(direction):
	one_time = true
	print(direction)
	#stopper spilleren
	if direction == "null":
		print(accumelation.x)
		if accumelation.x > 0:
			accumelation.x -= 0.4
		elif accumelation.y > 0:
			accumelation.y -= 0.1
		else:
			print("exit")
			one_time = false
			return
	#kører spilleren 
	if direction == "VERTICAL":
		if accumelation.y >= 3:
			pass
		elif accumelation.y <= 3:
			accumelation.y += 0.5


func accumelation_handler_hori(direction):
	one_time = true
	print(direction)
	#stopper spilleren
	if direction == "null":

		print(accumelation.x)
		if accumelation.x > 0:
			accumelation.x -= 0.4
		elif accumelation.y > 0:
			accumelation.y -= 0.1
		else:
			print("exit")
			one_time = false
			return
	#kjører	spilleren
	if direction == "HORIZONTAL":
		if accumelation.x >= 3:
			pass
		elif accumelation.x <= 3:
			accumelation.x += 0.5

func play_anim(movment):
	var animation = $AnimatedSprite2D
	var dir = current_direction
	

	if dir == "right":
		animation.flip_h = false
		if movment != Vector2.ZERO:
			animation.play("walk_side")
		else:
			animation.play("idle_side")

	if dir == "left":
		animation.flip_h = true 
		if movment != Vector2.ZERO:
			animation.play("walk_side")
		else:
			animation.play("idle_side")
			
	if dir == "up":
		animation.flip_h = true
		if movment != Vector2.ZERO:
			animation.play("walk_back")
		else:
			animation.play("idle_back")

	if dir == "down":
		animation.flip_h = true
		if movment != Vector2.ZERO:
			animation.play("walk_front")
		else:
			animation.play("idle_front")

	
