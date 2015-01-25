
extends Node2D

const MAPADJ = 14   # 540 / 128 - 4 * 128 / 2   screen width / tile width
const SCREEN_H = 960
var pos = 0
var scrollspeed = 500

func _ready():

	pass


func _process(delta):
	pos += scrollspeed * delta
	
	if (pos > SCREEN_H):
		get_parent().add_map(pos - SCREEN_H)
		queue_free()
	else:
		set_pos(Vector2(MAPADJ, pos))


func setpos(p):
	pos = p
	set_process(true)