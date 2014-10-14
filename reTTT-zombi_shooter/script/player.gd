extends "res://script/entity.gd"

export var auto_aim = true
export var aim_dist = 8
export var speed = 5.0
var mpos

var world

var joystick

func ____get_directin():

	if mpos == null:
		return Vector3(0, 0, 0)

	var camera = get_node("../camera")
	var ray_norm = camera.project_ray_normal(mpos)
	var ray_orig = camera.project_ray_origin(mpos)
	
	var objects = PS.space_get_direct_state( get_world().get_space() ).intersect_ray( ray_orig, ray_orig + ray_norm * 50 )

	if objects.empty():
		return Vector3(0, 0, 0)
		
	var pos = get_translation()
	var dest = objects["position"]
	var dir = dest - pos
	dir.y = 0
	return dir.normalized()


func get_directin():

	if !can_move():
		return Vector3(0, 0, 0)

	if joystick && joystick.active:
		var jd = joystick.direction
		return Vector3(jd.x, 0, jd.y)

	var m_left = Input.is_action_pressed("move_left");
	var m_right = Input.is_action_pressed("move_right");
	var m_up = Input.is_action_pressed("move_up");
	var m_down = Input.is_action_pressed("move_down");
	
	if !m_left && !m_right && !m_up && !m_down:
		return Vector3(0, 0, 0)

	var d = Vector3(0, 0, 0)
	
	if m_left:
		d.x = -1
	elif m_right:
		d.x = 1
	
	if m_up:
		d.z = -1
	elif m_down:
		d.z = 1
	
	return d


func _process(dt):
	var p = get_translation()
	#print(str(p.x) + " " + str(p.y) + " " + str(p.z))
	pass


func _fixed_process(dt):
	var dir = get_directin()
	
	var aim = false
	
	if auto_aim:
		var target = world.find_target(aim_dist)
	
		if target != null:
			var tr = get_transform().looking_at(target.get_translation(), Vector3(0, 1, 0))
			set_transform(tr)
			
			aim = true
	
	if dir != Vector3(0, 0, 0):
		set_linear_velocity(dir * speed)
		
		if !aim:
			var tr = get_transform().looking_at(get_translation() + dir * aim_dist, Vector3(0, 1, 0))
			set_transform(tr)


func _ready():
	
	health = 100
	world = get_node("/root/game/world")
	joystick = get_node("/root/game/ui/joystick/stick")
	world.player = self
	
	set_process(true)
	set_fixed_process(true)
	
	