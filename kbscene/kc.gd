
extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 200.0

var velocity = Vector2()
var motion = Vector2()
var n = Vector2()

func _fixed_process(delta):
	#move( Vector2(0,1) )
	print(n)
	velocity.y += delta * GRAVITY
	
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = WALK_SPEED
	else:
		velocity.x = 0
		
	motion = velocity * delta
	move(motion)
	
	if ( is_colliding() ):
		n = get_collision_normal()
	
		motion = n.slide(motion)
		velocity = n.slide(velocity)
	
		if (velocity.y < 0):
			velocity.y = 0
		
		move(motion)
		
func _ready():
	set_fixed_process(true)
	