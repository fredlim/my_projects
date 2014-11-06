
extends Node

var nPlayer
var mouse_pos
var rapid_rate = 1

func _ready():
	nPlayer = get_node("Canvas/Player")
	nPlayer.set_animation("center")
	set_process(true)
	set_process_input(true)
	
	
func _process(dt):
	if Input.is_action_pressed("mouse_left_click"):
		if (rapid_rate < 0):
			get_node("ProjectileMgr").fire("PA", mouse_pos)
			rapid_rate = 1
		rapid_rate -= 10 * dt
	

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		mouse_pos = ev.pos
		nPlayer.setterPos(Vector2(ev.pos.x, ev.pos.y+50))
		