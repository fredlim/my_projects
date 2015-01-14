
extends KinematicBody2D

var dir = Vector2(0,1)
var speed = 1000

func _ready():
	set_collide_with_kinematic_bodies(false)
	add_to_group("bullet")
	set_fixed_process(true)
	

func _fixed_process(dt):
	if ( ! get_node("VisibilityNotifier2D").is_on_screen() ):
		queue_free()
	
	# Method 1
	#print("dir vector: ", dir.x, " : ", dir.y)
	move( dir * -speed * dt )
	
	# Method 2
	#move_local_y( -speed * dt )


func setphi(p):
	dir = dir.rotated(p)
	#set_rot(p) # use with move_local_y()
	

func enable(pos):
	self.set_pos(pos)
	get_node("Animation").play("Anim",-1,1,false)
