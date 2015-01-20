
extends Position2D

func _ready():
	set_process(true)

func _process(delta):
	var m = Matrix32()
	m = get_node("/root").get_canvas_transform()
	m = m.translated(Vector2(0, 50*delta))
	get_node("/root").set_canvas_transform(m)
	