extends Control

const SAVE_PATH = "times.save"
var data

func _ready():
	if not File.new().file_exists(SAVE_PATH):
		save_game([0,0,0,0,0])
	data = load_data()
	add_score()
	display_scores()

func save_game(save_data):
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.WRITE)
	save_game.store_line(to_json(save_data))
	save_game.close()

func load_data():
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.READ)
	var file_text = save_game.get_as_text()
	return parse_json(file_text)

func add_score():
	var data = load_data()
	data.append(Time.time_passed)
	data.sort()
	data.invert()
	data.remove(5)
	save_game(data)

func display_scores():
	var data = load_data()
	for i in range(data.size()):
		get_node('Scores/Time' + str(i)).text = str(data[i])

func _process(delta):
	if Input.is_action_pressed("restart"):
		restart()

func restart():
	Time.begin()
	get_tree().change_scene("res://Scenes/Game.tscn")