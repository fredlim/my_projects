
extends KinematicBody2D

var move = false

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	print("Layer: ", get_layer_mask())
	set_fixed_process(true)
	#set_process(true)


func _fixed_process(dt):
	if (move):
		var pos = self.get_pos()
		
		#if ( (pos.y < 0) or self.is_colliding() ):
		if ( ! get_node("VisibilityNotifier2D").is_on_screen() or self.is_colliding() ):
			self.hide()
			move = false
			self.set_layer_mask(0)
			
		move( Vector2(0, -1000 * dt) )

#func _process(dt):
#	if (move):
#		var pos = self.get_pos()
#		pos.y -= 1000 * dt
#		if (pos.y < 0):
#			self.hide()
#			move = false
#		self.set_pos(pos)


func set_move():
	self.set_layer_mask(1)
	move = true
