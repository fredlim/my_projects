extends RigidBody2D

const JUMP_FORCE = -330
const SCREEN_H = 800

const SCREEN_TOUCH = 6
const MOUSE_BUTTON = 3
const KEY = 1

var need_reset = false
var spawn_pos

var jump = false

func reset():
	var g = get_node("/root/World/Generator")
	g.reset()
	respawn()
	need_reset = false
	jump = false
	
func respawn():
	set_pos(spawn_pos)
	set_rot(0)

func _integrate_forces(s):
	#var jump = Input.is_action_pressed("jump")
	var lv = s.get_linear_velocity()
	var step = s.get_step()
		
	if jump:
		lv.y = JUMP_FORCE  
		jump = false

	lv += s.get_total_gravity()*step
	lv.x = 0
	
	var p = get_pos();
	
	if  p.y < 0 || p.y > SCREEN_H:
		lv.y = 0
		need_reset = true
	
	s.set_linear_velocity(lv)
	
func _fixed_process(delta):
	
	if need_reset:
		reset()

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	spawn_pos = get_pos()

func _on_Player_body_enter( body ):
	need_reset = true

func _input(event):

	if !event.is_pressed():
		return

	if event.type == SCREEN_TOUCH:
		jump = true
	elif event.type == MOUSE_BUTTON:
		jump = true
	elif event.type == KEY:
		jump = true

