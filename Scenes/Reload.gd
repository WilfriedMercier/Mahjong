extends TextureButton

# Main script to update variables
onready var main_script = get_node('/root/Main')

# Reload icon
var icon                = preload("res://Assets/reload_icon.png")

# Various scales
var scale: Vector2      = Vector2(0.3, 0.3)
var scale2: Vector2     = Vector2(0.2, 0.2)

# Initial size of the button
onready var size_init   = self.get_size()

func _init():
	
	var _error
	
	self.set_normal_texture(icon)
	self.set_scale(scale)
	_error = self.connect('button_down', self, '_on_pressed')
	_error = self.connect('button_up',   self, '_on_release')

func _on_pressed():
	
	# Offset to apply for the tile to remain centered
	var dscale: Vector2 = scale - scale2
	var offset_x: float = (dscale[0] * self.size_init[0])/2
	var offset_y: float = (dscale[1] * self.size_init[1])/2

	self.set_scale(scale2)
	self.set_position(self.get_begin() + Vector2(offset_x, offset_y))
	
func _on_release():
	
	# Offset to apply for the tile to remain centered
	var dscale: Vector2 = scale - scale2
	var offset_x: float = (dscale[0] * self.size_init[0])/2
	var offset_y: float = (dscale[1] * self.size_init[1])/2

	self.set_scale(scale)
	self.set_position(self.get_begin() - Vector2(offset_x, offset_y))
	
	# Reload main scene
	var _reload = get_tree().reload_current_scene()
