
extends Node

const FIRERATE = 1
var nPlayer
var mouse_pos
var rapid_rate = FIRERATE


func _ready():
	nPlayer = get_node("Canvas/Player")
	nPlayer.set_animation("center")
	set_process(true)
	set_process_input(true)
	

func _process(dt):
	if Input.is_action_pressed("mouse_left_click"):
		if (rapid_rate < 0):
			get_node("ProjectileMgr").fire(mouse_pos)
			rapid_rate = FIRERATE
		rapid_rate -= 10 * dt
		
	#get_node("ProjectileMgr").lcount()
	

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		mouse_pos = ev.pos
		nPlayer.setterPos(Vector2(ev.pos.x, ev.pos.y+50))
		