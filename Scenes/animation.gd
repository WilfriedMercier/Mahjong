extends AnimatedSprite

onready var main        = get_node('/root/Main')
onready var score_label = get_node('/root/Main/Score')
onready var p_label     = get_node('/root/Main/Possibility_label')
onready var parent      = get_parent()

var destroy: bool       = false

func _ready():
	
	#self.play_animation()
	self.z_index    = 100
	
	self.position.x = parent.dx
	self.position.y = parent.dy
	
	# Connect to end signal
	var _error      = connect('animation_finished', self, '_on_finish')

func play_animation(game_over_activate: bool = true):
	
	self.destroy = true
	
	# Hide texture
	parent.set_normal_texture(null)
	parent.set_pressed_texture(null)
	
	# Add potentially new IDs into the selectable Array
	main.add_selectable(parent.id, [parent.layer, parent.position_x, parent.position_y])
	
	# Remove the tile from the selectable array
	main.selectable_tiles.erase(parent.id)
	
	# Update the number of validated tiles
	main.count        += 1
	score_label.set_text('Score: %3d/144' %main.count)
	
	# Update the number of possible pairs and the label
	p_label.set_count(main.count_pairs(game_over_activate))
	
	# Play animation from beginning
	self.set_frame(0)
	self.play()

func _on_finish():
	
	self.stop()
	
	if self.destroy:
		
		main.remove_tile(parent.id)
		main.selected_tile = ''
		main.selected_obj  = null
		main.selected_id   = ''
		
		parent.queue_free()
