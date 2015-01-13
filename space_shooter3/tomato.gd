
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	#get_node("Area2D").connect("body_enter",self,"_on_body_enter")
	set_fixed_process(true)


func _fixed_process(dt):
	#if ( is_colliding() ):
	#	print("who")
	#	var col = self.get_collider()
	#	col.disable()
	move_local_x( -5 * dt )

#func _on_body_enter( body ):


func _on_Area2D_body_enter( body ):
	if ( body.is_in_group("bullet") ):
		print("tomato collide")
		body.disable()
