
extends Node

var canvas_node
var pjtmanager
var nPlayer
var mouse_pos
var rapid_rate = 1

func _ready():
	canvas_node = get_node("/root/Game/Canvas")
	pjtmanager = get_node("ProjectileMgr")
	nPlayer = get_node("Canvas/Player")
	nPlayer.set_animation("center")
	set_process(true)
	set_process_input(true)
	
	
func _process(dt):
	if Input.is_action_pressed("mouse_left_click"):
		if (rapid_rate < 0):
			pjtmanager.fire("PA", mouse_pos)
			rapid_rate = 1
		rapid_rate -= 10 * dt
	

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		mouse_pos = ev.pos
		nPlayer.setterPos(Vector2(ev.pos.x, ev.pos.y+30))
		