
extends KinematicBody2D

const CENTER = 0
const LEFT = 1
const RIGHT = 2
const MOUSE_IDLE = 0.2 #counter countdown for mouse idle

var pos setget setterPos
var move_state = CENTER #initial state
var mouse_move = false #mouse moving (true) or idle (false)
var reset_roll = MOUSE_IDLE #counter to reset center roll when mouse idle

func _ready():
	pos = Vector2(0,0)
	set_process(true)


func _process(dt):
	var current_pos = self.get_pos()
	if (mouse_move):
		if (pos.x < current_pos.x):
			if (move_state == CENTER or move_state == RIGHT):
				move_state = LEFT
				set_animation("left")
		elif (pos.x > current_pos.x):
			if (move_state == CENTER or move_state == LEFT):
				move_state = RIGHT
				set_animation("right")
		
		if (reset_roll < 0):
			mouse_move = false
		else:
			reset_roll -= 2*dt
			
	else:
		if (move_state != CENTER):
			move_state = CENTER
			set_animation("center")
	self.set_pos(pos)


func setterPos(val):
	pos = val
	mouse_move = true
	reset_roll = MOUSE_IDLE
	

func set_animation(a):
	get_node("Animation").play(a,-1,1,false)
