extends KinematicBody2D

export var speed = 250

var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('right'):
		velocity.x += 1
	velocity = move_and_slide(velocity.normalized() * speed)

func _on_Enemy_Collision(area):
	get_tree().change_scene("res://Scenes/EndGame.tscn")
