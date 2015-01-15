
extends Path2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	pass

func dismiss():
	#print("I am die..")
	queue_free()
