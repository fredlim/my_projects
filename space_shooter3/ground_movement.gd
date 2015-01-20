
extends Position2D

var scroll = 0

func _ready():
	set_process(true)

func _process(delta):
	scroll+=50*delta
	set_pos(Vector2(0, scroll))
	