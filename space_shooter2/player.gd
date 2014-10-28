
extends Sprite


func _ready():
	set_process(true)
	

func _process(d):
	pass
		
	
func set_animation(a):
	get_node("Animation").play(a,-1,1,false)
