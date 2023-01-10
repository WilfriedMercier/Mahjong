extends Node2D

# Textures
var textures  = {'1'      : preload("res://Assets/1.png"),
				 '2'      : preload("res://Assets/2.png"),
				 '3'      : preload("res://Assets/3.png"),
				 '4'      : preload("res://Assets/4.png"),
				 '5'      : preload("res://Assets/5.png"),
				 '6'      : preload("res://Assets/6.png"),
				 '7'      : preload("res://Assets/7.png"),
				 '8'      : preload("res://Assets/8.png"),
				 '9'      : preload("res://Assets/9.png"),
				 'b1'     : preload("res://Assets/b1.png"),
				 'b2'     : preload("res://Assets/b2.png"),
				 'b3'     : preload("res://Assets/b3.png"),
				 'b4'     : preload("res://Assets/b4.png"),
				 'b5'     : preload("res://Assets/b5.png"),
				 'b6'     : preload("res://Assets/b6.png"),
				 'b7'     : preload("res://Assets/b7.png"),
				 'b8'     : preload("res://Assets/b8.png"),
				 'b9'     : preload("res://Assets/b9.png"),
				 'c1'     : preload("res://Assets/c1.png"),
				 'c2'     : preload("res://Assets/c2.png"),
				 'c3'     : preload("res://Assets/c3.png"),
				 'c4'     : preload("res://Assets/c4.png"),
				 'c5'     : preload("res://Assets/c5.png"),
				 'c6'     : preload("res://Assets/c6.png"),
				 'c7'     : preload("res://Assets/c7.png"),
				 'c8'     : preload("res://Assets/c8.png"),
				 'c9'     : preload("res://Assets/c9.png"),
				 'east'   : preload("res://Assets/east.png"),
				 'north'  : preload("res://Assets/north.png"),
				 'west'   : preload("res://Assets/west.png"),
				 'south'  : preload("res://Assets/south.png"),
				 'summer' : preload("res://Assets/summer.png"),
				 'winter' : preload("res://Assets/winter.png"),
				 'fall'   : preload("res://Assets/fall.png"),
				 'spring' : preload("res://Assets/spring.png"),
				 'red'    : preload("res://Assets/red.png"),
				 'white'  : preload("res://Assets/white.png"),
				 'green'  : preload("res://Assets/green.png"),
				}
					
# Fixed tiles positions (first number is layer height, second is x position, third is y position)
var layer_0: Array = [[0, 1, 7],   [0, 2, 7], [0, 3, 7], [0, 4, 7], [0, 5, 7], [0, 6, 7], [0, 7, 7], [0, 8, 7], [0, 9, 7], [0, 10, 7], [0, 11, 7], [0, 12, 7],
					  [0, 3, 6],   [0, 4, 6], [0, 5, 6], [0, 6, 6], [0, 7, 6], [0, 8, 6], [0, 9, 6], [0, 10, 6],
					  [0, 2, 5],   [0, 3, 5], [0, 4, 5], [0, 5, 5], [0, 6, 5], [0, 7, 5], [0, 8, 5], [0, 9, 5], [0, 10, 5], [0, 11, 5],
					  [0, 0, 3.5], [0, 1, 4], [0, 2, 4], [0, 3, 4], [0, 4, 4], [0, 5, 4], [0, 6, 4], [0, 7, 4], [0, 8, 4],  [0, 9, 4],  [0, 10, 4], [0, 11, 4], [0, 12, 4],
					  [0, 1, 3],   [0, 2, 3], [0, 3, 3], [0, 4, 3], [0, 5, 3], [0, 6, 3], [0, 7, 3], [0, 8, 3], [0, 9, 3],  [0, 10, 3], [0, 11, 3], [0, 12, 3], [0, 13, 3.5], [0, 14, 3.5],
					  [0, 2, 2],   [0, 3, 2], [0, 4, 2], [0, 5, 2], [0, 6, 2], [0, 7, 2], [0, 8, 2], [0, 9, 2], [0, 10, 2], [0, 11, 2],
					  [0, 3, 1],   [0, 4, 1], [0, 5, 1], [0, 6, 1], [0, 7, 1], [0, 8, 1], [0, 9, 1], [0, 10, 1],
					  [0, 1, 0],   [0, 2, 0], [0, 3, 0], [0, 4, 0], [0, 5, 0], [0, 6, 0], [0, 7, 0], [0, 8, 0], [0, 9, 0], [0, 10, 0], [0, 11, 0], [0, 12, 0],
					 ]
					
var layer_1: Array = [[1, 4, 6], [1, 5, 6], [1, 6, 6], [1, 7, 6], [1, 8, 6], [1, 9, 6],
					  [1, 4, 5], [1, 5, 5], [1, 6, 5], [1, 7, 5], [1, 8, 5], [1, 9, 5],
					  [1, 4, 4], [1, 5, 4], [1, 6, 4], [1, 7, 4], [1, 8, 4], [1, 9, 4],
					  [1, 4, 3], [1, 5, 3], [1, 6, 3], [1, 7, 3], [1, 8, 3], [1, 9, 3],
					  [1, 4, 2], [1, 5, 2], [1, 6, 2], [1, 7, 2], [1, 8, 2], [1, 9, 2],
					  [1, 4, 1], [1, 5, 1], [1, 6, 1], [1, 7, 1], [1, 8, 1], [1, 9, 1],
					 ]
					
var layer_2: Array = [[2, 5, 5], [2, 6, 5], [2, 7, 5], [2, 8, 5],
					  [2, 5, 4], [2, 6, 4], [2, 7, 4], [2, 8, 4], 
					  [2, 5, 3], [2, 6, 3], [2, 7, 3], [2, 8, 3],
					  [2, 5, 2], [2, 6, 2], [2, 7, 2], [2, 8, 2],
					 ]
					
var layer_3: Array = [[3, 6, 4], [3, 7, 4],
					  [3, 6, 3], [3, 7, 3],
					 ]
					
var layer_4: Array = [[4, 6.5, 3.5]]

var layers: Array = layer_0 + layer_1 + layer_2 + layer_3 + layer_4

# Complete list of tile IDs
var tiles_ids: Array
				
# Array of tiles that are selectable
var selectable_tiles: Array = ['0,1,7', '0,12,7', '0,3,6', '0,10,6', '0,2,5', '0,11,5', '0,0,3.5', '0,14,3.5', '0,2,2', '0,11,2', '0,3,1', '0,10,1', '0,1,0', '0,12,0',
							   '1,4,1', '1,4,2', '1,4,3', '1,4,4', '1,4,5', '1,4,6', '1,9,1', '1,9,2', '1,9,3', '1,9,4', '1,9,5', '1,9,6',
							   '2,5,2', '2,5,3', '2,5,4', '2,5,5', '2,8,2', '2,8,3', '2,8,4', '2,8,5',
							   '4,6.5,3.5'
							  ]
			
# Complete set of tiles				
var dots: Array       = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
var bamboo: Array     = ['b1', 'b2', 'b3', 'b4', 'b5', 'b6', 'b7', 'b8', 'b9']
var characters: Array = ['c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9']
var honors: Array     = ['east', 'west', 'north', 'south', 'red', 'green', 'white']
var suits_h: Array    = dots + bamboo + characters + honors

var bonus: Array      = ['summer', 'fall', 'spring', 'winter']
var tile_names: Array = suits_h + suits_h + suits_h + suits_h + bonus + bonus

# Selected tile
var selected_tile: String
var selected_obj
var selected_id: String

# List of tile sprites
var sprites: Dictionary

# Number of validated tiles
var count: int           = 0

# Flag for game over
var game_over_flag: bool = false

# Possibility label
onready var p_label      = get_node("Possibility_label")

# Game over sprite
onready var game_over_s  = get_node("Game_over")

# Timer and clock label
var timer: float         = 0.0
onready var clock_label  = get_node("Clock")

func random_int(mini: int, maxi: int):
	return randi() % (maxi-mini+1) + mini
	
func random_tile_name(mini: int, maxi: int):
	return tile_names[random_int(mini, maxi)]
	
func make_tile(position: Array):
#	Create a tile with a position and a texture
#
#	:param Array position: (layer, x, y) coordinates on the grid 
#
#	:returns: tile instance
#	:rtype: Tile

	# Find a random tile in the list of tile names
	var index: int        = random_int(0, len(tile_names) - 1)
	var tile_name: String = tile_names[index]
	
	# Remove this tile from the tile name list so that it is not picked up again
	tile_names.remove(index)
	
	return load("res://Scenes/Tile.gd").new(position, textures[tile_name], tile_name)
	
func remove_tile(id: String):
	
	self.remove_child(self.sprites[id])
	self.sprites[id] = null
	self.selectable_tiles.erase(id)
			
func is_top_free(position: Array):
	
	var new_id: String
	
	# If there is a tile above the tested tile, then it is not selectable
	new_id  = '%s,%s,%s' %[position[0]+1, position[1], position[2]]
	if new_id in tiles_ids and sprites[new_id] != null:
		return false
	
	return true
	
func count_pairs():
	
	var cnt: int          = 0
	var length: int       = len(selectable_tiles)
	var index_list: Array = []
	var name1: String
	
	for idx1 in range(length-1):
	
		# Name of the tile associated to idx1
		name1     = sprites[selectable_tiles[idx1]].tile_name
		
		for idx2 in range(idx1+1, length):
			
			if idx1 in index_list:
				break
			
			# If both names are equal, we have found a pair and we stop the search
			var sprite = sprites[selectable_tiles[idx2]]
			if sprite == null:
				print('Null tile ', selectable_tiles[idx2])
			
			if name1 == sprite.tile_name:
				cnt += 1
				index_list.append(idx2)
				break
				
	# Set game over flag if 0 is reached
	if cnt == 0:
		game_over_flag = true
				
	return cnt

func add_selectable(id: String, position: Array):
	
	var new_id: String
	var new_pos: Array
	
	# Work with special cases first
	if id == '0,0,3.5':
		selectable_tiles.append('0,1,3')
		selectable_tiles.append('0,1,4')
	elif id == '0,14,3.5':
		selectable_tiles.append('0,13,3.5')
	elif id == '0,13,3.5':
		selectable_tiles.append('0,12,3')
		selectable_tiles.append('0,12,4')
	elif id == '4,6.5,3.5':
		selectable_tiles.append('3,6,4')
		selectable_tiles.append('3,7,4')
		selectable_tiles.append('3,6,3')
		selectable_tiles.append('3,7,3')
	else:
		
		# Check whether the right tile is selectable
		new_pos = [position[0], position[1]+1, position[2]]
		new_id  = '%s,%s,%s' %new_pos
		if new_id in tiles_ids and sprites[new_id] != null and not (new_id in selectable_tiles) and is_top_free(new_pos):
			selectable_tiles.append(new_id)
			
		# Check whether the left tile is selectable
		new_pos = [position[0], position[1]-1, position[2]]
		new_id  = '%s,%s,%s' %new_pos
		if new_id in tiles_ids and sprites[new_id] != null and not (new_id in selectable_tiles) and is_top_free(new_pos):
			selectable_tiles.append(new_id)
			
		# Check whether the bottom tile is selectable
		new_pos = [position[0]-1, position[1], position[2]]
		new_id  = '%s,%s,%s' %new_pos
		if position[0] != 0 and not (new_id in selectable_tiles):
			
			# First check tile to the left, then tile to the right
			new_pos = [position[0]-1, position[1]-1, position[2]]
			new_id  = '%s,%s,%s' %new_pos
			if not (new_id in tiles_ids) or sprites[new_id] == null:
				selectable_tiles.append('%s,%s,%s' %[position[0]-1, position[1], position[2]])
				return
			
			new_pos = [position[0]-1, position[1]+1, position[2]]
			new_id  = '%s,%s,%s' %new_pos
			if not (new_id in tiles_ids) or sprites[new_id] == null:
				selectable_tiles.append('%s,%s,%s' %[position[0]-1, position[1], position[2]])

func _ready():
	
	print('Loaded main scene.')
	
	# Start random generator
	randomize()
	
	var label: String
	
	# Generate the list of IDs
	for element in layers:
		tiles_ids.append('%s,%s,%s' %element)
	
	# Generate the first layer of tiles
	for position in layers:
		label = '%s,%s,%s' %position
		sprites[label] = make_tile(position)
		add_child(sprites[label], true)
		
	p_label.set_count(count_pairs())
	game_over_s.hide()
	
func _process(delta):
	
	if not game_over_flag:
		timer += delta
		var timer_int: int = int(timer)
		var seconds: int   = timer_int % 60
		var minutes: int   = (timer_int - seconds)/60
		clock_label.set_text('%02d:%02d' %[minutes, seconds])
