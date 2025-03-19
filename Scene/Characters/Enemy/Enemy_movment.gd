extends CharacterBody2D

@onready var animation_sprite = $Enemy_movment

var current_direction = "none"
var direction = velocity.normalized()

func _physics_process(delta: float) -> void:
	var dir = direction
	if dir.x > 0:
		current_direction = "right"
		print("Det her right")
	elif dir.x < 0:
		current_direction = "left"
		print("Det her left")
	if dir.y > 0:
		current_direction = "down"
		print("Det her down")
	elif dir.y < 0:
		current_direction = "up"
		print("Det her up")
		
	
	play_anim()
	move_and_slide()


func movment(dir, speed):
	velocity.x = dir * speed
	velocity.y = dir * speed



func play_anim():
	var dir = current_direction
	print("Det her", + direction)

	if dir == "right":
		animation_sprite.flip_h = true
		if direction.x > 0: 
			animation_sprite.play("walk_side")
		else:
			animation_sprite.play("idle_side")

	if dir == "left":
		animation_sprite.flip_h = false 
		if direction.x < 0:
			animation_sprite.play("walk_side")
		else:
			animation_sprite.play("idle_side")
			
	if dir == "up":
		animation_sprite.flip_h = true
		if direction.y > 0:
			animation_sprite.play("walk_back")
		else:
			animation_sprite.play("idle_back")

	if dir == "down":
		animation_sprite.flip_h = true
		if direction.y < 0:
			animation_sprite.play("walk_front")
		else:
			animation_sprite.play("idle_front")
