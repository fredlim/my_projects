extends Node

export var attack = 10
export var delay = 0.5

var target = null
var elapsed_time = 0

func detach():
	if self.target:
		self.target.disconnect("on_dead", self, "detach")
		
	target = null


func set_target(target):
	detach()
	
	self.target = target
	
	if self.target:
		self.target.connect("on_dead", self, "detach")
	

func fire():
	target.add_damage(attack)
	elapsed_time = delay


func can_fire():
	if elapsed_time > 0:
		return false
	
	if target == null || target.is_ded():
		return false
		
	return true


func _process(dt):
	elapsed_time -= dt
	
	if can_fire():
		fire()


func _ready():
	set_process(true)
