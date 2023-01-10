extends TextureButton

# Main script to update variables
onready var main_script      = get_node('/root/Main')

# Score label
onready var score_label      = get_node('/root/Main/Score')

# Possibility label
onready var p_label          = get_node('/root/Main/Possibility_label')

# Swoosh sound player
onready var swoosh_sound     = get_node("/root/Main/button/Swoosh_sound")

# Constant for placing the sprites
const scale_sprite: float    = 0.45
const scale_sprite2: float   = 0.3
const x0: float              = 120.0
const y0: float              = 50.0
const dx: float              = 150.0
const dy: float              = 180.0

# Initial size of the button
onready var size_init        = self.get_size()

# Initial position
var position_x: float
var position_y: float
var layer: int

# Initial vector position
var init_pos_vec: Vector2

# Name and ID of the tile associated to this instance
var tile_name: String
var id: String

# Interpolation variables
var interp_scale: float
var interp_flag_down: bool = true

onready var animation_scene = preload('res://Scenes/Explosion.tscn')
onready var animation_obj   = animation_scene.instance()

func _init(position: Array, texture, name: String):
#	:param Array position: [layer, pos_x, pos_y]
#	:param texture: texture object to apply to the button
#	:param String name: name of the tile
	
	# Set instance variables
	layer        = position[0]
	position_x   = position[1]
	position_y   = position[2]
	id           = '%s,%s,%s' %position
	tile_name    = name
	
	init_pos_vec = Vector2(x0 + position_x*dx - 20*layer, y0 + position_y*dy + 25*layer)
	
	# Set textures
	self.set_normal_texture(texture)
	self.set_pressed_texture(texture)
	self.set_scale(Vector2(scale_sprite, scale_sprite))
	self.set_toggle_mode(true)
	
	# Set initial position
	self.set_position(init_pos_vec)
	
	var _error_code = self.connect('pressed', self, '_on_pressed')
	
func _ready():
	
	# Add the animation object as a child
	self.add_child(animation_obj)

func _on_pressed():
	
	if is_pressed():
		
		# Case if the pressed tile is selectable and if it is either the first pressed or the same as the one previously pressed
		if id in main_script.selectable_tiles and main_script.selected_tile in ['', tile_name]:
			
			# Initialise interpolation variable
			interp_scale = scale_sprite
			
#			# Update the scale and position of the tile to show it is selected
#			self.set_scale(scale_sprite2)
#			self.set_position(self.get_begin() + Vector2(offset_x, offset_y))
			
			# Case if the pressed tile is the same as the previously pressed tile
			if main_script.selected_tile == tile_name:
				
				# Remove tiles from sprites Array in main script so that we know they are inactive
#				main_script.sprites[id]                          = null
#				main_script.sprites[main_script.selected_obj.id] = null
				
				# Remove the two IDs from the selectable Array
#				main_script.selectable_tiles.erase(id)
#				main_script.selectable_tiles.erase(main_script.selected_id)
				
				# Add potentially two new IDs into the selectable Array
				main_script.add_selectable(id, [layer, position_x, position_y])
				main_script.add_selectable(main_script.selected_id, 
										   [main_script.selected_obj.layer,
											main_script.selected_obj.position_x, 
											main_script.selected_obj.position_y]
										  )
										
				# Play sound
				swoosh_sound.play()
				
				# Show the animation once (the destruction of the tile is called at the end)
				animation_obj.play_animation()
				main_script.selected_obj.animation_obj.play_animation()
										
				# Remove tiles from main scene to hide them
#				main_script.remove_child(main_script.selected_obj)
#				main_script.remove_child(self)
				
				# Update the variables that are linked to the first selected element
#				main_script.selected_tile = ''
#				main_script.selected_obj  = null
#				main_script.selected_id   = ''
				
				# Update the number of validated tiles
				main_script.count        += 2
				score_label.set_text('Score: %3d/144' %main_script.count)
				
				# Update the number of possible pairs and the label
				p_label.set_count(main_script.count_pairs())
				
			# Case if this is the first pressed tile
			else:
				main_script.selected_tile = tile_name
				main_script.selected_obj  = self
				main_script.selected_id   = id
			
		# If tile cannot be selected, we release the press state
		else:
			self.set_pressed(false)
		
	# Release case if there is at least one selected tile
	elif main_script.selected_tile != '':
		
		# Bring back the original scale and position
		self.set_scale(Vector2(scale_sprite, scale_sprite))
		self.set_position(init_pos_vec)
		
		# Empty the selected tile name
		main_script.selected_tile = ''
		main_script.selected_obj  = null
		main_script.selected_id   = ''
		
func _process(delta):
	
	if is_pressed():
		
		var step: float   = delta * 0.15
		var dscale: float
		
		if interp_flag_down:
			interp_scale -= step
		else:
			interp_scale += step
			
		self.set_scale(Vector2(interp_scale, interp_scale))
		
		dscale          = scale_sprite - interp_scale
		self.set_position(init_pos_vec + 0.5*dscale*size_init)
		
		if interp_scale + step < scale_sprite2:
			interp_flag_down = false
		elif interp_scale + step > scale_sprite:
			interp_flag_down = true
		
