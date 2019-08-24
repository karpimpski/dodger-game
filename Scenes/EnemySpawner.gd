extends Node

var enemy = load('res://Scenes/Enemy.tscn')

var spawn_timer = null
var difficulty_timer = null

var max_time = 0.5
var min_time = 0.1


func _ready():
	init_spawn_timer()
	init_difficulty_timer()

func init_spawn_timer():
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	
	spawn_timer.connect("timeout", self, "spawn")
	spawn_timer.set_wait_time(max_time)
	spawn_timer.set_one_shot(false) # Make sure it loops
	spawn_timer.start()

func spawn():
	var new_enemy = enemy.instance()
	add_child(new_enemy)

func init_difficulty_timer():
	difficulty_timer = Timer.new()
	add_child(difficulty_timer)
	difficulty_timer.connect("timeout", self, "increase_difficulty")
	difficulty_timer.set_wait_time(10.0)
	difficulty_timer.set_one_shot(false)
	difficulty_timer.start()

func increase_difficulty():
	if spawn_timer.wait_time > min_time:
		spawn_timer.set_wait_time(spawn_timer.wait_time - 0.05)
		print(spawn_timer.wait_time)
		print('increasing difficulty')
