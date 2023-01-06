extends Label

var color_bad: Color     = Color(204.0/255, 0, 0, 1)
var color_warning: Color = Color(1, 128.0/255, 0, 1)
var color_ok: Color      = Color(0,153.0/255, 0, 1)

# Game over sprite
onready var game_over_s  = get_node('/root/Main/Game_over')

func _init():
	self.add_color_override("font_color", color_ok)

func set_count(count: int):
	
	if count==0:
		self.add_color_override("font_color", color_bad)
		self.set_text('0 coup')
		game_over_s.show()
	elif count==1:
		self.add_color_override("font_color", color_warning)
		self.set_text('1 coup')
	else:
		self.add_color_override("font_color", color_ok)
		self.set_text('%d coups' %count)
