extends CharacterBody2D

var speed = 100
const max_speed = 100
var weight = 60
var accumelation = Vector2(1, 1)

var current_direction = "none"



#Funksjonen er for spiller bevegelsen
func _physics_process(delta): 
	var move_direction = Vector2.ZERO
	
	var input_pressed = false
	if Input.is_action_pressed("dir_Right"):
		current_direction = "right"
		move_direction.x = 1
		
	if Input.is_action_pressed("dir_Down"):
		current_direction = "down"
		move_direction.y += 1
	
	
	if Input.is_action_pressed("dir_Up"):
		current_direction = "up"
		move_direction.y -= 1

	if Input.is_action_pressed("dir_Left"):
		current_direction = "left"
		move_direction.x -= 1
		
	print(accumelation)
	
	if move_direction.x != 0:
		accumelation.x += 0.05
		if accumelation.x > 3:
			accumelation.x = 3
	else:
		accumelation.x = 0

	
	if move_direction.y != 0:
		accumelation.y += 0.05
		if accumelation.y > 3:
			accumelation.y = 3
	else:
		accumelation.y = 0

	velocity = Vector2(move_direction * speed * accumelation)
	play_anim(move_direction)
	move_and_slide()
	

#func speed_handler(acc):
#	var dir = current_direction
#	if dir == "right":
#		move_direction.x = 1
	
#	var force = move_direction * weight
#	var tempo = force - speed
	



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

	
