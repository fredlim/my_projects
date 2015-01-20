
extends Viewport

var rect2 = 0

func _ready():
	rect2 = get_node("/root").get_rect()
	set_rect(rect2)
