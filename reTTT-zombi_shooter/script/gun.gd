extends Spatial

var damage = 10
export var delay = 0.5
var elapsed_time = 0
var world

var bullet_inst = preload("res://prefab/bullet.scn")

var fire_btn

func can_fire():
	return elapsed_time <= 0

func ____fire():
	var ray_from = get_translation()
	var ray_to = ray_from + Vector3(0, 0, -5)
	
	var t = get_global_transform()
	ray_from = t.xform(ray_from)
	ray_to = t.xform(ray_to)
	
	var e = []
	var player = get_node("../")
	e.push_back(player)
	var iii = PS.space_get_direct_state( get_world().get_space() ).intersect_ray( ray_from, ray_to,  e)
	
	if iii == null || !iii.has("collider_id"):
		return
	
	var collider = iii["collider"]
	
	if !(collider extends preload("res://script/enemy.gd")):
		return
		
	collider.add_damage(damage)


func fire():
	var b = bullet_inst.instance()
	
	var t = get_global_transform()
	var dir = t.xform(Vector3(0, 0, -1))
	var pos = t.xform(Vector3(0, 0, 0))
	
	b.dir = (dir - pos).normalized()
	
	b.set_translation(pos)
	b.owner = get_parent()
	b.damage = damage
	
	world.add_child(b)

func is_fire_touch():
	if Input.is_action_pressed("fire"):
		return true
		
	if fire_btn && fire_btn.pressed:
		return true
	
	return false


func _fixed_process(dt):
	elapsed_time -= dt
	
	if can_fire() && is_fire_touch():
		elapsed_time = delay
		fire()


func _ready():
	fire_btn = get_node("/root/game/ui/joystick/fire")
	world = get_node("/root/game/world")
	set_fixed_process(true)