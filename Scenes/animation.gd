extends AnimatedSprite

onready var main   = get_node('/root/Main')
onready var parent = get_parent()

func _ready():
	
	#self.play_animation()
	self.z_index    = 100
	
	self.position.x = parent.dx
	self.position.y = parent.dy
	
	# Connect to end signal
	var _error      = connect('animation_finished', self, '_on_finish')

func play_animation():
	
	parent.set_normal_texture(null)
	parent.set_pressed_texture(null)
	self.set_frame(0)
	self.play()

func _on_finish():
	
	self.stop()
	main.remove_tile(parent.id)
	main.selected_tile = ''
	main.selected_obj  = null
	main.selected_id   = ''
