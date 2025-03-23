extends CharacterBody2D

@onready var animation_sprite = $Enemy_movment

var current_direction = "none"
var life = 3
func _physics_process(delta: float) -> void:
	var dir = velocity
	if velocity.x > 0:
		current_direction = "right"
	elif dir.x < 0:
		current_direction = "left"
	if dir.y > 0:
		current_direction = "down"
	elif dir.y < 0:
		current_direction = "up"
	
	if life <= 0:
		get_tree().change_scene_to_file("res://Scene/start_screen.tscn")
		life = 2
	
	play_anim(dir)
	move_and_slide()

func movment_x(dir_x, speed):
	velocity.x = dir_x * speed
func movment_y(dir_y, speed):
	velocity.y = dir_y * speed


func check_for_self(node):
	if node == self:
		return true 
	else:
		return false




func play_anim(move_dir):
	var dir = current_direction
	if dir == "right":
		animation_sprite.flip_h = false
		if move_dir.x != 0: 
			animation_sprite.play("walk_side")
		else:
			animation_sprite.play("idle_side")

	if dir == "left":
		animation_sprite.flip_h = true
		if move_dir.x != 0:
			animation_sprite.play("walk_side")
		else:
			animation_sprite.play("idle_side")
			
	if dir == "up":
		animation_sprite.flip_h = true
		if move_dir.y != 0:
			animation_sprite.play("walk_back")
		else:
			animation_sprite.play("idle_back")

	if dir == "down":
		animation_sprite.flip_h = true
		if move_dir.y != 0:
			animation_sprite.play("walk_front")
		else:
			animation_sprite.play("idle_front")


func _on_enemy_hitbox_body_entered(body: CharacterBody2D) -> void:
	$CPUParticles2D.emitting = true
	life -= 1
	print("life ", life)
