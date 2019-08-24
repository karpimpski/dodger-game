extends KinematicBody2D

var rng = RandomNumberGenerator.new()

var movement = Vector2()
var min_speed = 150
var max_speed = 350
var speed = 0

onready var screen_size = get_viewport_rect().size
onready var min_sprite_size = 20
onready var max_sprite_size = 40

func _ready():
	speed = set_speed()
	scale = set_size()
	position = set_origin()

func _physics_process(delta):
	move_and_slide(movement)
	check_bounds()

func set_size():
	rng.randomize()
	var x = rng.randf_range(min_sprite_size * 0.01, max_sprite_size * 0.01)
	var y = rng.randf_range(min_sprite_size * 0.01, max_sprite_size * 0.01)
	return Vector2(x, y)

func set_origin():
	rng.randomize()
	var x
	var y
	var direction = rng.randi_range(0, 3)
	var rand_x = rng.randi_range(max_sprite_size, screen_size.x - max_sprite_size)
	var rand_y = rng.randi_range(max_sprite_size, screen_size.y - max_sprite_size)
	if direction == 0:		# Top
		y = -10
		x = rand_x
		movement.y = speed
	elif direction == 1:	# Right
		x = screen_size.x + 10
		y = rand_y
		movement.x = -speed
	elif direction == 2:	# Bottom
		y = screen_size.y + 10
		x = rand_x
		movement.y = -speed
	elif direction == 3:	# Left
		x = -10
		y = rand_y
		movement.x = speed
	return Vector2(x, y)

func set_speed():
	rng.randomize()
	return rng.randi_range(min_speed, max_speed)

func check_bounds():
	if position.x < -max_sprite_size or position.y < -max_sprite_size or position.x > screen_size.x + max_sprite_size or position.y > screen_size.y + max_sprite_size:
		queue_free()

