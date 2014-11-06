
extends KinematicBody2D

var move = false

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	print("Layer: ", get_layer_mask())
	set_fixed_process(true)
	#set_process(true)


func _fixed_process(dt):
	if (move):
		#var pos = self.get_pos()
		
		if ( ! get_node("VisibilityNotifier2D").is_on_screen() or self.is_colliding() ):
			disable()
			
		move( Vector2(0, -500 * dt) )


func enable(pos):
	self.set_pos(pos)
	get_node("Animation").play("Anim",-1,1,false)
	self.set_layer_mask(1)
	self.show()
	move = true


func disable():
	get_node("Animation").stop()
	self.set_layer_mask(0)
	self.hide()
	move = false
