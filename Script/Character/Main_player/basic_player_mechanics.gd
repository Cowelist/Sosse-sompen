extends CharacterBody2D

var speed = 50
const max_speed = 100
var wheight = 60

var current_direction = "none"
var move_direction = Vector2.ZERO


#Funksjonen er for spiller bevegelsen
func _physics_process(delta): 
	
	var input_pressed = false
	if Input.is_action_pressed("dir_Right"):
		current_direction = "right"
		play_anim(1)
		speed_handler(1)
	if Input.is_action_pressed("dir_Down"):
		current_direction = "down"
		play_anim(1)
		move_direction.y += 1
	if Input.is_action_pressed("dir_Up"):
		current_direction = "up"
		play_anim(1)
		move_direction.y -= 1
	if Input.is_action_pressed("dir_Left"):
		current_direction = "left"
		play_anim(1)
		move_direction.x -= 1

	velocity = Vector2(move_direction * speed)
	move_and_slide()

func speed_handler(acc):
	var dir = current_direction
	if dir == "right":
		move_direction.x = 1
	
	var force = move_direction * wheight
	var tempo = force - speed
	



func play_anim(movment):
	var animation = $AnimatedSprite2D
	var dir = current_direction

	if dir == "right":
		animation.flip_h = false
		if movment == 1:
			animation.play("walk_side")
		elif movment == 0:

			animation.play("idle_side")

	if dir == "left":
		animation.flip_h = true 
		if movment == 1:
			animation.play("walk_side")
		elif movment == 0:

			animation.play("idle_side")

	if dir == "up":
		animation.flip_h = true
		if movment == 1:
			animation.play("walk_back")
		elif movment == 0:

			animation.play("idle_back")

	if dir == "down":
		animation.flip_h = true
		if movment == 1:
			animation.play("walk_front")
		elif movment == 0:

			animation.play("idle_front")

	
