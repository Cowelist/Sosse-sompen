extends CharacterBody2D

var speed = 0 
const max_speed = 100

var current_direction = "none"

#Funksjonen er for spiller bevegelsen
func _physics_process(delta): 
	var move_direction = Vector2.ZERO
	const W_key = "dir_Up"
	const A_key = "dir_Down"
	
	
	if Input.is_action_pressed("dir_Right"):
		current_direction = "left"
		play_anim(1)
		move_direction.x += 1
	elif Input.is_action_pressed("dir_Left"):
		current_direction = "right"
		play_anim(1)
		move_direction.x -= 1
	if Input.is_action_pressed("dir_Down"):
		current_direction = "down"
		play_anim(1)
		move_direction.y += 1
	elif Input.is_action_pressed("dir_Up"):
		current_direction = "up"
		play_anim(1)
		move_direction.y -= 1
	
	if Input.is_action_pressed("dir_Down" or ) 
	
	
	velocity = Vector2(move_direction * speed)
	move_and_slide()



#Denne funksjonen er for spiller animasjonen når du bevegger spilleren
func play_anim(movment):
	var dir = current_direction
	var animation = $AnimatedSprite2D
	
	if dir == "right":
		animation.flip_h = true
		if movment == 1:
			animation.play("walk_side")
		elif movment == 0:
			multi_bind -= 1
			animation.play("idle_side")
			
	if dir == "left":
		animation.flip_h = false
		if movment == 1:
			animation.play("walk_side")
		elif movment == 0:
			multi_bind -= 1
			animation.play("idle_side")
			
	if dir == "up":
		animation.flip_h = true
		if movment == 1:
			animation.play("walk_back")
		elif movment == 0:
			multi_bind -= 1
			animation.play("idle_back")
			
	if dir == "down":
		animation.flip_h = true
		if movment == 1:
			animation.play("walk_front")
		elif movment == 0:
			multi_bind -= 1
			animation.play("idle_front")
	
