
extends Viewport

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	set_process(true)

func _process(delta):
	var m = Matrix32()
	m = m.translated(Vector2(0, -5*delta))
	#set_canvas_transform( Matrix32().xform(m) )
	
