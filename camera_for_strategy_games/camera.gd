
extends Camera

var screen_size = null
var ray = null
var move_speed = 4.0
var rotation_speed = 4.0
var v_angle = 0 #do not change

func _ready():
	set_process(true)
	set_process_input(true)
	screen_size = OS.get_video_mode_size()
	ray = get_node("ray")
	get_look_point()

func get_look_point():
	var dir = get_global_transform().basis * Vector3(0, 0, -1)
	var transform = get_camera_transform().basis.inverse()
	var local_dir = transform * dir
	var point = Vector3()
	
	ray.set_enabled(true)
	ray.set_cast_to(local_dir * 100)
	
	if(ray.is_colliding()):
		point = ray.get_collision_point()
	
	get_node("../point").set_translation(point)
	
	return point

func _process(delta):
	var cursor_pos = Input.get_mouse_pos()
	var tr = get_translation()
	var pos = tr
	var m_speed = (move_speed + tr.y) * delta
	
	if ( not Input.is_action_pressed("mouse_middle") ):
		if (cursor_pos.x < 5):
			pos -= get_global_transform().basis[0] * m_speed
			set_translation(pos)
		elif (cursor_pos.x > screen_size.x - 5):
			pos += get_global_transform().basis[0] * m_speed
			set_translation(pos)
		elif (cursor_pos.y < 5):
			pos -= get_global_transform().basis[2] * m_speed
			pos.y = tr.y
			set_translation(pos)
		elif (cursor_pos.y > screen_size.y - 5):
			pos += get_global_transform().basis[2] * m_speed
			pos.y = tr.y
			set_translation(pos)

func _input(event):
	var delta = get_process_delta_time()
	var tr = get_translation()
	
	if (Input.is_action_pressed("mouse_middle") and event.type == InputEvent.MOUSE_MOTION):
		var target = get_look_point()
		var pos = tr
		var up = Vector3(0, 1, 0)
		
		var r_speed = (rotation_speed + tr.y) * delta
		var distance = pos - target
		
		if (event.relative_x < 0):
			pos += get_global_transform().basis[0] * r_speed
		elif (event.relative_x > 0):
			pos -= get_global_transform().basis[0] * r_speed
		
		if (event.relative_y < 0 and v_angle < 45):
			pos += get_global_transform().basis[1] * r_speed
			v_angle += 45/distance.length()
		elif (event.relative_y > 0 and v_angle > -45):
			pos -= get_global_transform().basis[1] * r_speed
			v_angle -= 45/distance.length()
		
		look_at_from_pos(pos, target, up)
	
	if (event.is_action("mouse_wheel_up") and tr.y > 2):
		tr.y -= (move_speed + tr.y) * delta
		set_translation(tr)
	
	if (event.is_action("mouse_wheel_down") and tr.y < 30):
		tr.y += (move_speed + tr.y) * delta
		set_translation(tr)
