
extends Node2D

var speed = 1000

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	#get_node("Area2D").connect("body_enter",self,"_on_body_enter")


func _on_Area2D_body_enter( body ):
	if ( body.is_in_group("bullet") ):
		#print("tomato collide")
		body.dismiss()
		queue_free()
	
	if ( body.is_in_group("player") ):
		pass
