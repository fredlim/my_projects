extends Node2D

var pressed = false

func is_inside(pos):
	var t = self.get_global_transform()
	t = t.inverse()
	var p = t.xform(pos)
	var r = self.get_item_rect()
	
	return r.has_point(p)
	

func _input(e):
	if e.type == InputEvent.MOUSE_BUTTON || e.type == InputEvent.SCREEN_TOUCH:
		
		if e.pressed:
			if is_inside(e.pos):
				pressed = true
		else:
			pressed = false


func _ready():
	pressed = false
	set_process_input(true)