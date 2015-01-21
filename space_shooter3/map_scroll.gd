
extends Node2D

const SCREEN_H = 1280
var pos = 0
var scrollspeed = 1500

func _ready():
	set_process(true)


func _process(delta):
	pos += scrollspeed * delta
	set_pos(Vector2(0, pos))
	if (pos > SCREEN_H):
		get_parent().add_map(SCREEN_H - pos)
		queue_free()
		
func setpos(p):
	pos = p