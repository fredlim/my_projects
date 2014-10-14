extends Navigation

func _process(dt):
	print("begin")
	var path = get_simple_path(Vector3(0, 0.5, -5), Vector3(0, 0.5, 5))
	for v in path:
		var st = v.x + " " + v.y + " " + v.z;
		print(st)
	
	print("end")

func _ready():
	set_process(true)