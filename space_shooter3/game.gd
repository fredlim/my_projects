
extends Node

var nPlayer
var mouse_pos
var firerate = 10
var countdown = 1


func _ready():
	nPlayer = get_node("Canvas/Player")
	nPlayer.set_animation("center")
	set_process(true)
	set_process_input(true)
	

func _process(dt):
	if Input.is_action_pressed("mouse_left_click"):
		if (countdown < 0):
			get_node("ProjectileMgr").fire(mouse_pos)
			countdown = 1
		countdown -= firerate * dt
		
	#get_node("ProjectileMgr").lcount()
	

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		mouse_pos = ev.pos
		nPlayer.setterPos(Vector2(ev.pos.x, ev.pos.y+50))
		