
extends Node2D

var nPlayer

func _ready():
	nPlayer = get_node("Player")
	nPlayer.set_animation("center")
	set_process(true)
	set_process_input(true)


func _process(dt):
	pass
	

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		nPlayer.setterPos(ev.pos)
