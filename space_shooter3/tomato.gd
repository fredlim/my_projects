
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	#self.set_layer_mask(12)
	set_fixed_process(true)
	#connect("body_enter", self, "_on_Area2D_body_enter")


func _fixed_process(dt):
	#if ( is_colliding() ):
	#	print("who")
	#	var col = self.get_collider()
	#	col.disable()
	move_local_x( -5 * dt )
	pass

#func _on_Area2D_body_enter( body ):
#	print("tomato collide")


func _on_Tomato_body_enter( body ):
	print("tomato collide")
	body.disable()
	pass # replace with function body
