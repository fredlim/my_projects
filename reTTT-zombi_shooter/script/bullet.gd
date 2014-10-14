extends RigidBody

var owner
var damage = 1
var life = 3
var speed = 50
var dir = Vector3(0, 0, 1)
var world

var statistic

func _integrate_forces(s):
	s.set_linear_velocity(dir*speed)


func _process(dt):
	life -= dt
	
	if life <= 0:
		queue_free()


func _ready():
	world = get_node("/root/game/world")
	statistic = get_node("/root/game/statistic")
	
	set_process(true)


func _on_bullet_body_enter( body ):
	if (body extends preload("res://script/enemy.gd")):
		var health = body.get_health()
		body.add_damage(damage)
		
		if health > 0 && body.get_health() == 0 && statistic:
			statistic.kill()

	queue_free()
