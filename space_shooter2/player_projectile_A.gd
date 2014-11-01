
extends Sprite

var move = false

func _ready():
	get_node("Animation").play("Anim",-1,1,false)
	set_process(true)

func _process(dt):
	if (move):
		var pos = self.get_pos()
		pos.y -= 1000 * dt
		#print(pos.y)
		if (pos.y < 0):
			self.hide()
			move = false
		self.set_pos(pos)

func fmove():
	move = true
