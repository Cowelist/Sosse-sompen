extends TextureRect


var bg_texture = preload("res://Sprite/placeholder/PNG/som_bakgrunn.png")
func _ready():
	texture = bg_texture
	size_flags_horizontal = SIZE_FILL
	size_flags_vertical = SIZE_FILL
	
