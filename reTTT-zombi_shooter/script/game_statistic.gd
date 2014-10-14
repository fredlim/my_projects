extends Node

var kill = 0
var wave = 1

var lab_kill
var lab_wave

func reset():
	kill = 0
	wave = 1


func kill():
	kill += 1
	update()


func set_wave(wave):
	self.wave = wave
	update()


func update():
	if lab_kill:
		lab_kill.set_text("kill: " + str(kill))
	
	if lab_wave:
		lab_wave.set_text("wave: " + str(wave))


func _ready():
	lab_kill = get_node("/root/game/ui/kill")
	lab_wave = get_node("/root/game/ui/wave")
	
	reset()
	update()