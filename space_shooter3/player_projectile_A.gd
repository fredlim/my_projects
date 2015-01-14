
extends KinematicBody2D

var dir = Vector2(0,1)
var speed = 1000
var phi = 0

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
	#var pjt = Matrix32()
	#pjt = pjt.rotated(PI/8)
	#pjt = pjt.translated( Vector2( 0, 500 * dt) )
	#print("marix32: ", pjt[0], " : ", pjt[1], " : ", pjt[2])
	#set_pos( Vector2( get_pos().x + pjt[2].x, get_pos().y + pjt[2].y ) )
	#set_transform(pjt)
	
	# Method 3
	#var velocity = Vector2( 0, -500 * dt )
	#set_rot(-PI/8/2)
	#move_local_y( -speed * dt )


func setphi(p):
	phi = p
	dir = dir.rotated(phi)
	set_rot(phi)
	

func enable(pos):
	self.set_pos(pos)
	get_node("Animation").play("Anim",-1,1,false)
