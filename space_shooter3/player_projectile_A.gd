
extends KinematicBody2D

var dir = Vector2(0,1)
var speed = 1000
var transit = true

func _ready():
	set_collide_with_kinematic_bodies(false)
	add_to_group("bullet")
	set_fixed_process(true)
	

func _fixed_process(dt):
	#if ( ! get_node("VisibilityNotifier2D").is_on_screen() or transit == false):
	if (get_pos().y < 0 or transit == false):
		queue_free()
	
	# Method 1
	move( dir * -speed * dt )
	
	# Method 2 - no collision report
	#move_local_y( -speed * dt )


func setphi(p):
	dir = dir.rotated(p)
	#set_rot(p) # use with Method 2
	

func enable(pos):
	self.set_pos(pos)
	get_node("Animation").play("Anim",-1,1,false)


func dismiss():
	transit = false
	