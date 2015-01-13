
extends KinematicBody2D

var move = false
var dir = Vector2(0,1)
var speed = 800
var phi = 0

func _ready():
	set_fixed_process(true)
#	get_node("Area2D").connect("body_enter", self, "_on_Area2D_body_enter")
	

func _fixed_process(dt):
	if (move):
		#if (is_colliding()):
			#print("Collider: ", get_collider(), " Metadata: ", get_collider_metadata())
			#disable()
				
		if ( ! get_node("VisibilityNotifier2D").is_on_screen() ):
			disable()
		
		#print("dir vector: ", dir.x, " : ", dir.y)
		#move( dir * -speed * dt )
		
		#var pjt = Matrix32()
		#pjt = pjt.rotated(PI/8)
		#pjt = pjt.translated( Vector2( 0, 500 * dt) )
		#print("marix32: ", pjt[0], " : ", pjt[1], " : ", pjt[2])
		#set_pos( Vector2( get_pos().x + pjt[2].x, get_pos().y + pjt[2].y ) )
		#set_transform(pjt)
		
		#var velocity = Vector2( 0, -500 * dt )
		#set_rot(-PI/8/2)
		move_local_y( -speed * dt )


func setphi(p):
	phi = p
	dir = dir.rotated(phi)
	set_rot(phi)
	

func enable(pos):
	self.set_pos(pos)
	get_node("Animation").play("Anim",-1,1,false)
	#self.set_layer_mask(1)
	self.show()
	move = true


func disable():
	get_node("Animation").stop()
	self.hide()
	move = false

#func _on_Area2D_body_enter( body ):
#	print("bullet collide")