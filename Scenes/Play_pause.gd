extends TextureButton

# Main script to update variables
onready var main      = get_node('/root/Main')

var icon              = preload("res://Icons/pause.png")
onready var sound     = get_node("/root/Main/Play_pause/Click_sound")

# Various scales
var scale: Vector2    = Vector2(0.6, 0.6)
var scale2: Vector2   = Vector2(0.4, 0.4)

# Initial size of the button
onready var size_init = self.get_size()

func _init():
	
	var _error
	
	self.set_normal_texture(icon)
	self.set_scale(scale)
	
	_error = self.connect('button_down', self, '_on_pressed')
	_error = self.connect('button_up',   self, '_on_release')

func _on_pressed():
	
	# Play sound
	sound.play()
	
	# Offset to apply for the tile to remain centered
	var dscale: Vector2 = scale - scale2
	var offset_x: float = (dscale[0] * self.size_init[0])/2
	var offset_y: float = (dscale[1] * self.size_init[1])/2

	self.set_scale(scale2)
	self.set_position(self.get_begin() + Vector2(offset_x, offset_y))
	
	# Pause the game
	main.game_playing_flag = false
	
func _on_release():
	
	# Offset to apply for the tile to remain centered
	var dscale: Vector2 = scale - scale2
	var offset_x: float = (dscale[0] * self.size_init[0])/2
	var offset_y: float = (dscale[1] * self.size_init[1])/2

	self.set_scale(scale)
	self.set_position(self.get_begin() - Vector2(offset_x, offset_y))
