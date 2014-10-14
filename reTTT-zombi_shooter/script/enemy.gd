extends "res://script/entity.gd"

var dir
export var speed = 1.0
var target
var gun

var world
var spawner = null

export var attack = 10

func on_dead():
	world.remove_enemy(self)
	
	if spawner != null:
		spawner.dead_enemy(self)
		
	queue_free()


func _process(dt):
	pass


func get_dist():
	if !can_move():
		return get_translation()
	
	if world.player == null:
		return get_translation()

	if world.player.is_ded():
		return get_translation()

	return world.player.get_translation()


func _fixed_process(dt):

	var delta = get_dist() - get_translation()
	delta.y = 0

	if delta != Vector3(0, 0, 0):

		var tr = get_transform().looking_at(get_translation() + delta, Vector3(0, 1, 0))
		set_transform(tr)

		if can_move():
			delta = delta.normalized()
			set_linear_velocity(delta*speed)


func _ready():
	add_to_group("enemies")
	gun = get_node("gun")
	gr_detector = get_node("ground_detector")
	world = get_node("/root/game/world")
	world.add_enemy(self)
	
	dir = Vector3(0, 0, 0)
	set_process(true)
	set_fixed_process(true)


func _on_enemy_body_enter( body ):
	if (body extends preload("res://script/player.gd")):
		if gun:
			gun.set_target(body)


func _on_enemy_body_exit( body ):
	if gun && gun.target == body:
		gun.detach()
