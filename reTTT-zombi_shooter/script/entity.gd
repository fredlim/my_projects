extends RigidBody

export var health = 20

var damage = 0
var gr_detector
var ded = false



func on_dead():
	ded = true
	emit_signal("on_dead")


func is_ded():
	return ded;


func add_damage(d):
	damage += d
	
	damage = clamp(damage, 0, health)
	if get_health() == 0:
		on_dead()


func get_health():
	return health - damage


func _process(dt):
	var pos = get_translation()
	if pos.y < -3:
		on_dead()


func can_move():
	if gr_detector == null:
		return true
	
	return gr_detector.is_colliding()


func _ready():
	add_user_signal("on_dead")
	gr_detector = get_node("ground_detector")
	damage = 0

func _exit_scene():
	pass
