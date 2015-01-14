
extends Node2D

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	#get_node("Area2D").connect("body_enter",self,"_on_body_enter")
	set_fixed_process(true)


func _fixed_process(dt):
	#move_local_x( -5 * dt )
	print( str(get_parent().get_offset()) )
	get_parent().set_offset( get_parent().get_offset() + (500*dt) )


func _on_Area2D_body_enter( body ):
	if ( body.is_in_group("bullet") ):
		#print("tomato collide")
		body.queue_free()

