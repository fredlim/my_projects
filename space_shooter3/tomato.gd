
extends Node2D

var speed = 1000

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	#get_node("Area2D").connect("body_enter",self,"_on_body_enter")
	set_process(true)


func _process(delta):
	get_parent().set_offset( get_parent().get_offset() + (speed*delta) )
		
	if (get_parent().get_unit_offset() > 1):
		get_node("../..").queue_free()


func _on_Area2D_body_enter( body ):
	if ( body.is_in_group("bullet") ):
		#print("tomato collide")
		body.dismiss()
		get_node("../..").queue_free()
	