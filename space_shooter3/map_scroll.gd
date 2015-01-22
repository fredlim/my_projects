
extends Node2D

const SCREEN_H = 1280
var pos = 0
var scrollspeed = 300

func _ready():

	pass


func _process(delta):
	pos += scrollspeed * delta
	
	if (pos > SCREEN_H):
		get_parent().add_map(pos - SCREEN_H)
		queue_free()
	else:
		set_pos(Vector2(0, pos))


func setpos(p):
	pos = p
	set_process(true)