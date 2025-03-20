extends CharacterBody2D

var friction = 1000

var speed = 50
#const max_speed = 100
var weight = 60
var accumelation = Vector2(1, 1)

var current_direction = "none"

var store_key = []

<<<<<<< HEAD
<<<<<<< HEAD
@export var inventory: Inventory

<<<<<<< HEAD
var right = "Dummy"
var left = "Dummy"
var down = "Dummy"
var up = "Dummy"

func _ready() -> void:
	if self.name == "Player1":
		right = "1_dir_Right"
		left = "1_dir_Left"
		down = "1_dir_Down"
		up = "1_dir_Up"
	elif self.name == "Player2":
		right = "2_dir_Right"
		left = "2_dir_Left"
		down = "2_dir_Down"
		up = "2_dir_Up"
=======
>>>>>>> parent of 1b339c2 (merge main to enemy 2)
=======
>>>>>>> parent of c62c97e (????)
=======
>>>>>>> parent of c507b06 (Merge Character to main)

#Funksjonen er for spiller bevegelsen
func _physics_process(delta): 
	var move_direction = Vector2.ZERO
	
	if Input.is_action_pressed("dir_Right"):
		current_direction = "right"
		move_direction.x += 1
		store_key.append("right")
		accumelation_handler_hori("HORIZONTAL")
		
	if Input.is_action_pressed("dir_Down"):
		current_direction = "down"
		move_direction.y += 1
		store_key.append("down")
		accumelation_handler_vert("VERTICAL")
	
	if Input.is_action_pressed("dir_Up"):
		current_direction = "up"
		store_key.append("up")
		move_direction.y -= 1
		accumelation_handler_vert("VERTICAL")

	if Input.is_action_pressed("dir_Left"):
		current_direction = "left"
		store_key.append("left")
		move_direction.x -= 1
		accumelation_handler_hori("HORIZONTAL")
		
	
	
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

	
	print(accumelation)
	#print(store_key)
	#print(velocity.length())
	velocity = Vector2(move_direction * speed * accumelation)
	if velocity.length() <= 300 and (store_key == ["right"] or store_key == ["left"]):
		velocity.x = move_toward(velocity.x, move_direction.x * speed, accumelation.x)
#	elif store_key not in [["up"], ["down"]]: 
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		
	if velocity.length() <= 300 and (store_key == ["up"] or store_key == ["down"]):
		velocity.y = move_toward(velocity.y, move_direction.y * speed, accumelation.y)
#	elif store_key not in [["right"], ["left"]]: 
	else:
		velocity.y = move_toward(velocity.y, 0, friction * delta)
		
	if velocity.length() <= 300 and store_key.size() > 1:
		if ("right" in store_key and "left" in store_key) or ("up" in store_key and "down" in store_key):
			velocity.y = move_toward(velocity.y, move_direction.y * speed, accumelation.y)
			velocity.x = move_toward(velocity.x, move_direction.x * speed, accumelation.x)
		else:
			velocity.x = move_toward(velocity.x, 0, friction * delta)
			velocity.y = move_toward(velocity.y, 0, friction * delta)
	#		accumelation_handler_hori("HORIZONTAL")
	#		accumelation_handler_vert("VERTICAL")

	

	accumelation_handler()
	#print (velocity)
	play_anim(move_direction)
	move_and_slide()
	
func accumelation_handler():
	accumelation_handler_stop()
	if store_key != []: 
		store_key = []
func accumelation_handler_stop():
	print("running every frame")
	if "right" not in store_key and "left" not in store_key:
#stopper spilleren
		if accumelation.x > 0.11:
			accumelation.x = max(accumelation.x - 0.2, 0.1)
		else:
			accumelation.x = 0
	if "up" not in store_key and "down" not in store_key:
		print("Aeawea")
#stopper spilleren
		if accumelation.y > 0.11:
			accumelation.y = max(accumelation.y - 0.2, 0.1)
		else:
			accumelation.y = 0

func accumelation_handler_vert(direction):
	#kører spilleren 
	if direction == "VERTICAL":
		if accumelation.y >= 7:
			pass
		elif accumelation.y <= 7:
			accumelation.y += 0.1


func accumelation_handler_hori(direction):
	#kjører	spilleren
	if direction == "HORIZONTAL":
		if accumelation.x >= 7:
			pass
		elif accumelation.x <= 7:
			accumelation.x += 0.1

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

	
