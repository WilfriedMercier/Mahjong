extends TextureButton

# Main script to update variables
onready var main             = get_node('/root/Main')

var icon_on                  = preload("res://Icons/sound_on.png")
var icon_off                 = preload("res://Icons/sound_off.png")

onready var volume_down: int = -100
onready var volume_up: int   = 0

func _init():

	# Set textures
	self.set_normal_texture(icon_on)
	self.set_pressed_texture(icon_off)
	self.set_toggle_mode(true)
	
	var _error_code = self.connect('pressed', self, '_on_pressed')

func _on_pressed():
	
	if is_pressed():
		BackgroundMusic.set_volume_db(volume_down)
		main.update_sound_effects_volume(volume_down)
	else:
		BackgroundMusic.set_volume_db(volume_up)
		main.update_sound_effects_volume(volume_up)
