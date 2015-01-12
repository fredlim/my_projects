
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	set_fixed_process(true)


func _fixed_process(dt):
	#if ( is_colliding() ):
	#	print("who")
	#	var col = self.get_collider()
	#	col.disable()
	pass



