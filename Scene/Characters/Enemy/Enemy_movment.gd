extends CharacterBody2D

@onready var navigation = $NavigationAgent2D
@onready var player:CharacterBody2D = $Enemy
@export var speed:float

var current_direction = "none"
var player_chase = null 


func _ready() -> void:
	$AnimatedSprite2D.play("idle_front")

func _physics_process(delta: float) -> void:
	var direction = to_local(navigation.get_next_path_position())
	var velocity = direction * speed
	move_and_slide()
	
	
	
	
	
	
	
#	var move_direction = Vector2.ZERO
	if player_chase == true:
	#	var direction = (player.position - position).normalized()
		position += direction * speed * delta  # delta ensures frame rate independence
		
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				current_direction = "right"
			else: 
				current_direction = "left"
		else:
			if direction.y > 0:
				current_direction = "down"
			else:
				current_direction = "up"
			
				
	


func _on_timer_timeout() -> void:
	print("hei" + str(player))
	if player:
		navigation.target_position = player.global_position  # Now you can safely access the player's position
	else:
		print("Error: Player is not assigned!")


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
