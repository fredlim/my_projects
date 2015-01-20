
extends Position2D

var map
var scroll = 0
var scrollspeed = 50

func _ready():
	map = preload("res://map1.scn")
	set_process(true)

func _process(delta):
	scroll += 50 * delta
	set_pos(Vector2(0, scroll))
	