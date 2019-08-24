extends Node

var start_time
var time_passed

func _ready():
	begin()

func begin():
	start_time = OS.get_ticks_msec()

func _process(delta):
	var time = (OS.get_ticks_msec() - start_time) * 0.001
	time_passed = stepify(time, 0.1)
