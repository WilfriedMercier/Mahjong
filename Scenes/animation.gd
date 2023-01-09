extends AnimatedSprite

var animated_frames = preload("res://Scenes/animation.tres")

func _init(x: float, y: float):
	
	self.position.x = 10
	self.position.y = 10

func _ready():
	
	self.z_index    = 101
	#self.stop()
	
	self.set_sprite_frames(animated_frames)
	self.play()
	
	# Connect to end signal
	var _error = connect('animation_finished', self, '_on_finish')

func play_animation():
	
	print('enter ', self.get_sprite_frames(), ' ', self.position.x, ' ', self.position.y)
	self.set_frame(0)
	self.play()

func on_finish():
	print('finish')
	self.stop()
