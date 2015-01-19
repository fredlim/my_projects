
extends Node

var scroll = 0

func _ready():
	# Initalization here
	set_process(true)

func _process(delta):
	var m = Matrix32()
	m = get_node("/root").get_canvas_transform()
	#print("m[0]", m[0])
	#print("m[1]", m[1])
	#print("m[2]", m[2])
	m = m.translated(Vector2(0, 50*delta))
	get_node("/root").set_canvas_transform(m)