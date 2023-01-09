extends Sprite

onready var main = get_node("/root/Main")

func _ready():
	
	self.set_scale(Vector2(0.5, 0.5))
	
	var x = main.get_viewport().get_visible_rect().size[0]/2
	var y = main.get_viewport().get_visible_rect().size[1]/2
	
	self.set_position(Vector2(x, y))
	
	# Force z game over to be on top
	self.z_index = 100
