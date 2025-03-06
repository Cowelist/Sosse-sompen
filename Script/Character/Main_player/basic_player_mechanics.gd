extends CharacterBody2D

const speed = 100 

func _physics_process(delta): 
	var move_direction = Vector2.ZERO
	
	if Input.is_action_pressed("dir_Right"):
		move_direction.x += 1
	elif Input.is_action_pressed("dir_Left"):
		move_direction.x -= 1
	if Input.is_action_pressed("dir_Down"):
		move_direction.y += 1
	elif Input.is_action_pressed("dir_Up"):
		move_direction.y -= 1
	
	velocity = Vector2(move_direction * speed)
	move_and_slide()
	
func play_anim(movment):
	var dir 
	
