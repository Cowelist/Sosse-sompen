extends CharacterBody2D

var speed = 0
const max_speed = 100

var current_direction = "none"


#Funksjonen er for spiller bevegelsen
func _physics_process(delta): 
	var move_direction = Vector2.ZERO
	
	const W_key = "dir_Up"
	const A_key = "dir_Left"
	const S_key = "dir_Down"
	const D_key = "dir_Right"
	const WASD = [W_key, A_key, S_key, D_key]
	
	var input_pressed = false
	
	for movment in WASD:
		if Input.is_action_pressed(movment) and not input_pressed:
			input_pressed = true
			match movment: 
				W_key: 
					current_direction = "up"
					play_anim(1)
					move_direction.y -= 1
				A_key:
					current_direction = "left"
					play_anim(1)
					move_direction.x -= 1
				S_key:
					current_direction = "down"
					play_anim(1)
					move_direction.y += 1
				D_key:
					current_direction = "right"
					play_anim(1)
					move_direction.x += 1
			#elif:
	for action in WASD:
		if Input.is_action_pressed(action) and speed <= max_speed:
			speed += 1
			print("+speed")
		elif !Input.is_action_pressed(action) and speed >= 0:
			speed -= 0.4
			print("-speed")
		velocity = Vector2(move_direction * speed)
		move_and_slide()



#Denne funksjonen er for spiller animasjonen når du bevegger spilleren
func play_anim(movment):
	var dir = current_direction
	var animation = $AnimatedSprite2D
	
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
	
